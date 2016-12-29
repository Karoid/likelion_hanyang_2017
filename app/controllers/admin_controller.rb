class AdminController < ApplicationController
  layout "admin_application"
  def index
    #flash[:success ] = "Success Flash Message: Welcome to GentellelaOnRails"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
    authorize! :read, Category.where(route: "admin").take
  end
  def show_category
    @category = Category.all
    @board = Board.all
    authorize! :read, Category.where(route: "admin").take
  end
  def show_article
    @article = Article.where(active: true)
    @article_trash = Article.where(active: false)
    authorize! :read, Category.where(route: "admin").take
  end
end
