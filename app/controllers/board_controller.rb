class BoardController < ApplicationController
  before_action :authenticate_member!
    def pagelogic(usage_name,use_templete,Model_name)#CRUD중 R기능을 구현한 함수
      #초기화
      @article = Introduce.where(:usage => usage_name)
      @usage = usage_name
      @navigation = "<a href='/introduce/history'>History</a>  /  <a href='/introduce/staff'>Staff</a>  /  <a href='/introduce/song'>Song</a>  /  <a href='/introduce/rules'>Rules</a>"
      #해당 게시판에 처음 들어갔을때 설정
      if params[:id]==nil                        #기본 접근시 가장 최근의 글을 보여줍니다
        @id = -1
      else                                       #특정 글에 접근시 가장 최근의 글을 보여줍니다
        @id = params[:id].to_i
      end
      #페이지 목록
      if params[:page] ==nil && params[:id]!=nil #해당 글이 위치한 페이지를 띄웁니다
        page = ((@article.length - params[:id].to_i)/5).ceil+1
      else
        page = params[:page]
      end
      @article_page = Introduce.where(:usage => usage_name).reverse_order.paginate(:page => page).per_page(5) #페이지 목록을 5개씩 끊어서 번호를 부여합니다
      #use_templete값이 참이면 공통된 html을 갖습니다
      if use_templete                            #use_templete값이 true이면,
        render template: "shared/article_view"   #shared 템플릿의 article_view로 페이지를 띄웁니다
      end
    end
    def pagelogic_write(usage_name,Model_name)              #C(R빼고)UD 기능 구현한 함수
      if params[:post_id] == ""                  #Create Post
        @article = Introduce.new
        @article.usage = usage_name
        authorize! :create, @article
      elsif params[:usage] == "delete"           #Delete Post
        @article = Introduce.find(params[:id].to_i)
        @article.destroy
        authorize! :destroy, @article
        redirect_to :back
        return 0
      else                                     #Update Post
        @article = Introduce.find(params[:post_id].to_i)
        number = Introduce.where(:usage => usage_name).index(@article)
        authorize! :update, @article
      end
      @article.title = params[:title]
      @article.content = params[:content]
      @article.member_id = params[:member_id]
      @article.save
      redirect_to "/introduce/#{usage_name}/#{number}"
    end
    def history
      pagelogic("history",true)
    end
    def history_write
      pagelogic_write("history")
    end
    def staff
      pagelogic("staff",true)
    end
    def staff_write
      pagelogic_write("staff")
    end
    def song
      pagelogic("song",true)
    end
    def song_write
      pagelogic_write("song")
    end
    def rules
      pagelogic("rules",true)
    end
    def rules_write
      pagelogic_write("rules")
    end
end
