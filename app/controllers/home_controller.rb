class HomeController < ApplicationController
  #http://stackoverflow.com/questions/16021449/parse-xml-to-ruby-objects-and-create-attribute-methods-dynamically
  #make xml to object
  def index
  begin
   @last_3_record = Board.where(route:"gallery").take.articles.reverse
   @last_3_image = {}
   k = 0
   @last_3_record.each do |record|
     urls = []
     @files = Uploadfile.where(article_id: record.id)
     if k<3 && @files.length >0
       @files.each_with_index do |file,index|
         if index<4
           urls.push(file.url)
         end
       end
       @last_3_image[record.title] = urls
       k += 1
     end
   end
   rescue
     @last_3_record
     @last_3_image = {}
   end
   @staff = Member.where(staff:true).order(:admin)
  end
  def create_post
    if !params[:post_id]
      board = params[:board]
      model = Board.where(route: params[:board]).first.articles
      authorize! :create, model.last
      article = model.new
      article.member_name = "#{current_member.senior_number}기 #{current_member.username}"
      article.member_id = current_member.id
      article.board_id = Board.where(route: params[:board]).first.id
      article.active = false
      article.save
      params[:post_id] = article.id
      params[:sended] = article.board.name + " 작성"
    end
  end
  def your_profile
    perpage = 5
    if params[:usage] == "comment"
      @article = Comment.where(member_id: current_member.id).paginate(:page => params[:page], :per_page => perpage).order('id DESC')
      @route = Proc.new{ |x| "/board/#{x.commentable.board.category.route}/#{x.commentable.board.route}/#{x.commentable.id}"}
      @title = Proc.new{ |x| x.body}
    elsif params[:usage] == "attendence"
      @article = Statistic.where(name: "sign_in").paginate(:page => params[:page], :per_page => perpage).order('id DESC')
      @route = Proc.new{ |x| "#"}
      @title = Proc.new{ |x| "#{x.created_at} 출석!"}
    else
      @article = Article.where(member_id: current_member.id).paginate(:page => params[:page], :per_page => perpage).order('id DESC')
      @route = Proc.new{ |x| "/board/#{x.board.category.route}/#{x.board.route}/#{x.id}"}
      @title = Proc.new{ |x| x.title}
    end
    Article.where(active: false,content: nil).destroy_all
  end
  def profile_statistic
    startDate = Time.parse(params[:startDate]).to_date
    endDate = Time.parse(params[:endDate]).to_date
    result = Statistic.where(member_id:current_member.id, created_at: startDate..endDate).group_by{ |u| u.created_at.beginning_of_month.strftime("%Y년 %m월") }
    respond_to do |format|
      format.json {render json: result}
    end
  end
  def edit_profile_image
    params[:post_id] = 0
    sended_msg = Cloudinary::Uploader.upload(params[:file],{use_filename: true,unique_filename: false,overwrite:true,folder: "member/#{current_member.id}"})
    upload_write2model(sended_msg)
    current_member.image_url = sended_msg['url']
    current_member.save
    render json: {}
  end
  def image_crop

  end
  #파일 업로드
  def upload_image
    #sended_msg = Cloudinary::Uploader.upload(params[:file],{use_filename: true,folder: params[:post_id]})
    #upload_write2model(sended_msg)

     render json: {:link => sended_msg['url']}
  end
  def upload_file
    #sended_msg = Cloudinary::Uploader.upload(params[:file],{resource_type: 'raw',use_filename: true,folder: params[:post_id]})
    #upload_write2model(sended_msg)

    render json: {:link => sended_msg['url']}
  end
  def upload_write2model(sended_msg)
    Uploadfile.create(
     article_id: params[:post_id],
     public_id: sended_msg['public_id'],
     format: sended_msg['format'],
     url: sended_msg['url'],
     resource_type: sended_msg['resource_type'])
  end
end
