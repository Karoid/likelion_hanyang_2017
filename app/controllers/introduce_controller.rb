class IntroduceController < ApplicationController
before_action :authenticate_member!, except: [ :history, :rules ]
  def pagelogic(pagename)
    @article = Introduce.where(:usage => pagename)
    @usage = pagename
    @navigation = "<a href='/introduce/history'>History</a>  /  <a href='/introduce/staff'>Staff</a>  /  <a href='/introduce/song'>Song</a>  /  <a href='/introduce/rules'>Rules</a>"
    if params[:id]==nil
      @id = -1
    else
      @id = params[:id].to_i
    end
  end
  def pagelogic_write(pagename)
    if params[:id] == ""
      @article = Introduce.new
      @article.usage = pagename
    elsif params[:usage] == "delete"
      @article = Introduce.find(params[:id].to_i)
      @article.destroy
      redirect_to :back
      return 0
    else
      @article = Introduce.find(params[:post_id].to_i)
    end
    @article.title = params[:title]
    @article.content = params[:content]
    @article.member_id = params[:member_id]
    @article.save
    redirect_to "/introduce/"+pagename
  end
  def history
    pagelogic("history")
  end
  def history_write
    pagelogic_write("history")
  end
  def staff
    pagelogic("staff")
  end
  def staff_write
    pagelogic_write("staff")
  end
  def song
    pagelogic("song")
  end
  def song_write
    pagelogic_write("song")
  end
  def rules
    pagelogic("rules")
  end
  def rules_write
    pagelogic_write("rules")
  end
end
