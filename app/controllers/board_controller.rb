class BoardController < ApplicationController
    def pagelogic_write                         #C(R빼고)UD 기능 구현한 함수
      board = params[:board]
      model = Board.where(route: params[:board]).first.articles
      category = params[:category]
      if params[:usage] == "delete"           #Delete Post
        @article = model.find(params[:id])
        @article.active = false
        @article.save
        Uploadfile.destroy_files(params[:id])
        authorize! :destroy, model.last
        redirect_to "/board/#{category}/#{board}"
        return 0
      else                                     #Create Post & Update Post
        @article = model.find(params[:post_id].to_i)
        number = model.find(params[:post_id]).id
        if @article.member_name == nil && @article.active == false
          authorize! :create, @article
        else
          authorize! :update, @article
        end
      end
      @article.title = params[:title]
      @article.content = params[:content]
      @article.member_id = params[:member_id]
      @article.member_name = "#{current_member.senior_number}기 #{current_member.username}"
      @article.active = true
      @article.save
      redirect_to "/board/#{category}/#{board}/#{number}"
    end

    def showBoard
      @category = Category.where(route: params[:category]).take
      @board = @category.boards.where(route: params[:board]).take
      @article = @board.articles.where(active: true)
      authorize! :read, @article.last
      perpage = 10
      if params[:page]
        page = params[:page]
      elsif  params[:id]
        page = ((@article.length - @article.index{|article| article.id == params[:id].to_i} - 1)/perpage).ceil + 1
      else
        page=1
      end
      @article_page = @article.paginate(:page => page, :per_page => perpage).order('id DESC')
      @navigation = ""
      @category.boards.each do |board|
        @navigation += "<a href='/board/#{params[:category]}/#{board.route}'>#{board.name}</a> "
      end
      if @board.show_last
        params[:id] = @article.last.id
        @thisArticle = @article.find(params[:id])
        render template: "board/showArticle"
      end
      if @board.template && !params[:id]
        render template: @board.template
      end
    end
    def showArticle
      showBoard
      @thisArticle = @article.find(params[:id])
    end

    def write_comment
      @article = Article.find(params[:id])
      if @article.board.show_comment
        @comment = Comment.build_from( @article, current_member.id, params[:content] )
        @comment.save
      end
      redirect_to :back
    end
end
