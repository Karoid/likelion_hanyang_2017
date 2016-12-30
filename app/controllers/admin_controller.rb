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
  def delete_data
    params[:data].each do |id|
      params[:db].camelize.constantize.find(id).destroy
    end
    respond_to do |format|
      format.json { render json: {notice: 'success'} }
    end
    authorize! :read, Category.where(route: "admin").take
  end
  def edit_data
    record = params[:db].camelize.constantize
    record = params[:data][:id] != "" ? record.find(params[:data][:id].to_i) : record.new
    params[:data].each_key {|key|
      params[:data][key] = params[:data][key] == "" ? nil : params[:data][key]   
      if key.split(".").length == 1 && key != "id"
        record[key] = params[:data][key]
      elsif key.split(".").length > 1
        forign_record = key.split(".")[0].camelize.constantize.where(key.split(".")[1] => params[:data][key]).take
        record[key.split(".")[0].foreign_key] = forign_record.id
      end
    }
    record.save
    respond_to do |format|
      format.json { render json: {notice: 'success'} }
    end
    authorize! :read, Category.where(route: "admin").take
  end
end
