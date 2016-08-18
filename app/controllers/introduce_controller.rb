class IntroduceController < ApplicationController
  def pagelogic(pagename)
    if Introduce.where(:usage => pagename).empty?
      @article = Introduce.new
      @article.usage = pagename
      @article.save
    else
      @article = Introduce.where(:usage => pagename)
    end
  end
  def pagelogic_write(pagename)
    if Introduce.where(:usage => pagename).empty?
      @article = Introduce.new
      @article.usage = pagename
    else
      @article = Introduce.where(:usage => pagename)[0]
    end
    @article.content = params[:content]
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
