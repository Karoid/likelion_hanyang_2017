class BoardController < ApplicationController
  before_action :authenticate_member!
    def pagelogic_write                         #C(R빼고)UD 기능 구현한 함수
      board = params[:board]
      model = Board.where(route: params[:board]).first.articles
      category = params[:category]
      if params[:post_id] == ""                  #Create Post
        @article = model.new
        authorize! :create, model
      elsif params[:usage] == "delete"           #Delete Post
        @article = model.find(params[:id].to_i)
        @article.destroy
        Uploadfile.destroy_files(params[:id].to_i,model)
        authorize! :destroy, model
        redirect_to :back
        return 0
      else                                     #Update Post
        @article = model.find(params[:post_id].to_i)
        number = model.find(params[:post_id]).id
        authorize! :update, model
      end
      @article.title = params[:title]
      @article.content = params[:content]
      @article.member_id = params[:member_id]
      @article.save
      redirect_to "/board/#{category}/#{board}/#{number}"
    end

    def showBoard
      @category = Category.where(route: params[:category]).first
      @board = @category.boards.where(route: params[:board]).first
      @article = @board.articles
      perpage = 10
      if params[:page]
        page = params[:page]
      elsif  params[:id]
        page = ((@article.length - @article.index{|article| article.id == params[:id].to_i})/perpage).ceil+1
      else
        page=1
      end
      @article_page = @article.paginate(:page => page, :per_page => perpage).order('id DESC')
      @navigation = ""
      @category.boards.each do |board|
        @navigation += "<a href='/board/#{params[:category]}/#{board.route}'>#{board.name}</a> "
      end
    end
    def showArticle
      showBoard
      @thisArticle = @article.find(params[:id])
    end
end
