class HomeController < ApplicationController
  #http://stackoverflow.com/questions/16021449/parse-xml-to-ruby-objects-and-create-attribute-methods-dynamically
  #make xml to object
  def index
  end
  def create_post
    if !params[:post_id]
      board = params[:board]
      model = Board.where(route: params[:board]).first.articles
      authorize! :create, model.last
      article = model.new
      article.member_id = current_member.id
      article.board_id = Board.where(route: params[:board]).first.id
      article.active = false
      article.save
      params[:post_id] = article.id
    end
  end
  def your_profile
    @comment = Comment.where(member_id:current_member.id)
    @article = Article.where(member_id: current_member.id)
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
    Uploadfile.create(
     article_id: params[:post_id],
     public_id: sended_msg['public_id'],
     format: sended_msg['format'],
     url: sended_msg['url'],
     resource_type: sended_msg['resource_type'])
  end
end
