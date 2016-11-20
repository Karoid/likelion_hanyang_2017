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
    
  end
end
