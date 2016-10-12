class BoardController < ApplicationController
  before_action :authenticate_member!
    def pagelogic(usage_name,model,use_templete)#CRUD중 R기능을 구현한 함수
      #초기화
      @category = "board"
      @article = model.all
      @usage = usage_name
      @navigation = "<a href='/#{@category}/notice'>Notice</a>  /  <a href='/#{@category}/free'>Free</a>  /  <a href='/#{@category}/member'>Member</a>  /  <a href='/#{@category}/graduate'>HAS</a>/  <a href='/#{@category}/sameage'>Same-age</a>"
      #해당 게시판에 처음 들어갔을때 설정
      if params[:id]==nil                        #기본 접근시 가장 최근의 글을 보여줍니다
        @id = -1
      else                                       #특정 글에 접근시 가장 최근의 글을 보여줍니다
        @id = params[:id].to_i
      end
      #페이지 목록
      if params[:page] ==nil && params[:id]!=nil #해당 글이 위치한 페이지를 띄웁니다
        page = ((@article.length - params[:id].to_i)/10).ceil+1
      else
        page = params[:page]
      end
      @article_page = model.all.reverse_order.paginate(:page => page).per_page(10) #페이지 목록을 5개씩 끊어서 번호를 부여합니다
      authorize! :read, model
      #use_templete값이 참이면 공통된 html을 갖습니다
      if use_templete                            #use_templete값이 true이면,
        render template: "shared/list_view"   #shared 템플릿의 article_view로 페이지를 띄웁니다
      end
    end
    def pagelogic_write(usage_name,model)        #C(R빼고)UD 기능 구현한 함수
      category = "board"
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
        number = model.all.index(@article)
        authorize! :update, model
      end
      @article.title = params[:title]
      @article.content = params[:content]
      @article.member_id = params[:member_id]
      @article.save
      redirect_to "/#{category}/#{usage_name}/#{number}"
    end

    def notice
      pagelogic("notice",NoticeBoard,true)
    end
    def notice_write
      pagelogic_write("notice",NoticeBoard)
    end
    def free
      pagelogic("free",FreeBoard,true)
    end
    def free_write
      pagelogic_write("free",FreeBoard)
    end
    def member
      pagelogic("member",MemberBoard,true)
    end
    def member_write
      pagelogic_write("member",MemberBoard)
    end
    def graduate
      pagelogic("graduate",GraduateBoard,true)
    end
    def graduate_write
      pagelogic_write("graduate",GraduateBoard)
    end
    def sameage
      if ( current_member.senior_number == params[:senior_number].to_i || current_member.admin ) && params[:senior_number]
        #초기화
        usage_name = params[:senior_number]
        model = SameageBoard
        use_templete = true
        @category = "board"
        @article = model.where(:senior_number => usage_name)
        @usage = usage_name
        @navigation = "<a href='/#{@category}/notice'>Notice</a>  /  <a href='/#{@category}/free'>Free</a>  /  <a href='/#{@category}/member'>Member</a>  /  <a href='/#{@category}/graduate'>HAS</a>/  <a href='/#{@category}/sameage'>Same-age</a>"
        #해당 게시판에 처음 들어갔을때 설정
        if params[:id]==nil                        #기본 접근시 가장 최근의 글을 보여줍니다
          @id = -1
        else                                       #특정 글에 접근시 가장 최근의 글을 보여줍니다
          @id = params[:id].to_i
        end
        #페이지 목록
        if params[:page] ==nil && params[:id]!=nil #해당 글이 위치한 페이지를 띄웁니다
          page = ((@article.length - params[:id].to_i)/10).ceil+1
        else
          page = params[:page]
        end
        @article_page = model.where(:senior_number => usage_name).reverse_order.paginate(:page => page).per_page(10) #페이지 목록을 5개씩 끊어서 번호를 부여합니다
        authorize! :read, model
        #use_templete값이 참이면 공통된 html을 갖습니다
        if use_templete                            #use_templete값이 true이면,
          render template: "shared/list_view"   #shared 템플릿의 article_view로 페이지를 띄웁니다
        end
      else
        redirect_to "/board/#{current_member.senior_number}"
      end
    end
    def sameage_write
      if ( current_member.senior_number == params[:senior_number].to_i || current_member.admin ) && params[:senior_number]
        #초기화
        usage_name = params[:senior_number]
        model = SameageBoard
        category = "board"
        if params[:post_id] == ""                  #Create Post
          @article = model.new
          @article.senior_number = usage_name
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
          number = model.where(:senior_number => usage_name).index(@article)
          authorize! :update, model
        end
        @article.title = params[:title]
        @article.content = params[:content]
        @article.member_id = params[:member_id]
        @article.save
        redirect_to "/#{category}/#{usage_name}/#{number}"
      else
        redirect_to "/board/#{current_member.senior_number}/write"
      end
    end
end
