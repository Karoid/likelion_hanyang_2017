class HomeController < ApplicationController
  #http://stackoverflow.com/questions/16021449/parse-xml-to-ruby-objects-and-create-attribute-methods-dynamically
  #make xml to object
  def index
  end
  def create_post
  end
  def your_profile
    @comment = Commontator::Comment.where(creator_id:current_member.id)
    @article = Introduce.where(member_id:current_member.id)+NoticeBoard.where(member_id:current_member.id)+FreeBoard.where(member_id:current_member.id)+MemberBoard.where(member_id:current_member.id)+GraduateBoard.where(member_id:current_member.id)+SameageBoard.where(member_id:current_member.id)
  end
  #파일 업로드
  def upload_image
    sended_msg = Cloudinary::Uploader.upload(params[:file],{unique_filename: false})
    upload_write2model(sended_msg)

     render json: {:link => sended_msg['url']}
  end
  def upload_file
    sended_msg = Cloudinary::Uploader.upload(params[:file],{resource_type: 'raw',unique_filename: false})
    upload_write2model(sended_msg)

    render json: {:link => sended_msg['url']}
  end
  def upload_write2model(sended_msg)
    Uploadfile.create(model_number: Uploadfile.modelnumber(params[:model]),
     model_id: Uploadfile.modelid(params[:model],params[:model_id].to_i) ,
     public_id: sended_msg['public_id'],
     format: sended_msg['format'],
     url: sended_msg['url'],
     resource_type: sended_msg['resource_type'])
  end
  #휴즈넷 복구 알고리즘
  def insert_old_huhs_net
    @boardxml1 = File.open("old_migration_data/docs/documents1.xml") { |f| Nokogiri::XML(f) }
    @boardxml1 = @boardxml1.search('//xe_documents')
    @attach = File.open("old_migration_data/docs/attach.xml") { |f| Nokogiri::XML(f) }
    @attach = @attach.search('//xe_files')
    if params[:do]
      @boardxml1.each do |doc|
        #공지사항:238,자유게시판: 5793, 회원게시판: 160, 임원회의록: 166
        case params[:category]
        when '238'
          model = NoticeBoard
        when '5793'
          model = FreeBoard
        when '160'
          model = MemberBoard
        end
        if doc.at('module_srl').text == params[:category]
          @article = model.new
          @article.member_id = 1234567
          @article.created_at = doc.at('regdate').text.to_time
          @article.updated_at = doc.at('last_update').text.to_time
          @article.title = doc.at('title').text #제목
          @article.content = ""
          @article.content += "글쓴이: "+doc.at('nick_name').text+"<br>" #글쓴이
          if doc.at('uploaded_count').text != '0'
            @article.content += "첨부 갯수: "+doc.at('uploaded_count').text+"<br>" #첨부갯수
            @attach.each do |att|
              if att.at('upload_target_srl').text == doc.at('document_srl').text
                @article.content += '<a href="'+att.at("uploaded_filename").text[1..-1]+'">'+att.at("source_filename").text+'</a><br>'
              end
            end
          end
          @article.content += doc.at('content').text.gsub('src="files/', 'src="/files/').html_safe #내용물
          @article.save
        end
      end
    end
  end
end
