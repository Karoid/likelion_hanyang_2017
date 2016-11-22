## 본 문서의 목적
본 문서는 **Front-end 개발을 용이하게 하기 위해 작성** 되었습니다.
## 페이지의 구조
본 사이트는 다음과 같은 페이지 구조로 요약할 수 있습니다  
/ => /app/views/home/index.html.erb 소개 페이지  
└/board/:category/:board => /app/views/board/showBoard.erb 게시판 페이지  
└/board/:category/:board/:id => /app/views/board/showArticle.erb 게시글 페이지  

## ERB 파일이란

본 프로젝트에 주로 쓰인 erb 확장자명의 파일은 루비 문법을 html문서로 렌더링 하기 이전에 담기 위한 목적으로 작성되었스며 다음의 규칙에 따라 루비 문법과 html 문법이 혼용되어 있습니다
```erb
<html>
  <body>
    <div class="container">
      <h1>hello world</h1>
    </div>
  </body>
</html>
```
위와같은 html문법은 erb파일에서 사용될 수 있으며 나중에 erb -> html로 바꾸는 과정에서 보존되며 바뀝니다
```erb
<html>  
  <body>  
    <div class="container">  
      <%if params[:id]%>  
      <h1>hello world</h1>  
      <%else%>  
      <%= @alarm %>
      <%end%>
    </div>  
  </body>  
</html>  
```
위와같은 형태는 일반적인 erb 문서의 모습으로, <% 와 %> 안에 있는 부분이 바로 루비 문법입니다. 또한 <%= 와 %> 안에 있는 부분은 루비 문볍을 적용한뒤 리턴값을 문서에 출력하라는 의미입니다.  
 따라서 위의 문서를 해석하자면 params[:id] 값이 있는경우 hello world를 출력하고, 그렇지 않은 경우는 @alarm 변수안의 값을 출력하라는 문서가 되겠군요.
