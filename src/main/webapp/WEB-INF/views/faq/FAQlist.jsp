<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<%--jstl 라이브러리 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">    

 <!--부트스트랩-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	*{
		box-sizing: border-box;
		font-family: 'Nanum Gothic', 'sans-serif';
	}
	
	#warpForm{
		width: 100%;
	}
	
	#headerForm{
		width: 100%;
		height: 175px;
		margin: 30px auto;
	}
	
	#contentForm{
		width: 100%;
	}
	
	#footerFrom{
		width: 100%;
		height: 242px;
	}
	
	
	/* faqWrqp*/
    #faqWrap
    {
        width: 100%;
      	
    }
    
    #faqContentWrap
    {
        width: 85%;
        margin: 0 auto;
    }
    
    #empty1
    {
        width: 100%;
        height: 7%;
    }
    
    #contentTitle
    {
        width: 100%;
        height: 10%;
        font-size: 28px;
        font-weight: bold;
        text-align: center;
        line-height: 9vh;
        color: #3BBD5A;
        font-family: 'Nanum Gothic';
    }
    #empty2
    {
        width: 100%;
        height: 7%;
    } 
    
    #contentWrap
    {
        width: 100%;
    } 
    #contentWrap-listWrap
    {
        width: 80%;
        margin: 0 auto;
    }
    
    #board-row
    {
        width: 100%;
        margin: 0 auto; 
    }
    #board-row-content
    {
        width: 98%;
        margin: 0 auto; 
        border-bottom: 1px solid;
    }

   .faqTitle
    {
        width: 100%;
        height: 10%;
        margin: 0 auto;
        font-size: 14px;
        padding-top: 28px;
        padding-bottom: 15px;
        border-top: 1px solid black;
    }
    


    .faqCotent
    {
        width: 100%;
        margin: 0 auto;
        font-size: 14px;
        padding-top: 15px;
        padding-bottom: 15px;
        border-top: 1px solid rgba(0, 0, 0, 0.2);
    }

    
   	#writeBtn
   	{
        width: 4.5vw;
        height: 4vh;
		border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
		position: relative;
        left: 70vw;
        top: 2.5vh;
	}
    #writeBtn>a
    {
		text-decoration: none;
		color: white;
    }

    .updateBtn
    {
        width: 3vw;
        height: 3.5vh;
       	border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
        position: relative;
        left: 57vw;
        bottom: 0.5vh;
    }
    .deleteBtn
    {
        width: 3vw;
        height: 3.5vh;
        border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
        position: relative;
        left: 58vw;
        bottom: 0.5vh;
    }
</style>


</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	<div id="contentForm" align="left"><br>
		<div id="faqWrap">
        <div id="faqContentWrap" >
            <div id="empty1"></div>
            <div id="contentTitle"> 자주 찾는 질문</div>
            <div id="empty2">                        
                <button type="button" id="writeBtn"><a href="/faq/faqWritePage.do">글 쓰기</a></button>
            </div>
            <div id="contentWrap">
                <div id="contentWrap-listWrap">
                    <div id="board-row">
                       <div id="board-row-content">
                       
                       <c:forEach items="${requestScope.list}" var="f" varStatus="i">
	                        <details>
	                            <summary class="faqTitle">${f.getFaqTitle()}</summary>
	                            <p class="faqCotent">${f.getFaqContent()}</p>
		                        <button type="button" class="updateBtn" boardNo="${f.getFaqNo()}">수정</button>
		                        <button type="button" class="deleteBtn" boardNo="${f.getFaqNo()}">삭제</button>
	                        </details>
                      </c:forEach>
		                    </div>  
		                </div>
		            </div>
		        </div>
		    </div>    
		</div>

	</div><br>
		
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>


<!-- 수정 버튼 -->
<script>
  $('.updateBtn').click(function(){
	  
	  var boardNo = $(this).attr('boardNo');
	  
	  
      // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
      var _width = '800';
      var _height = '600';
      var _left = Math.ceil(( window.screen.width - _width )/2);
      var _top = Math.ceil(( window.screen.height - _height )/2);
     
      window.open('/faq/faqUpdatePage.do?boardNo='+boardNo+'', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
     
  });

</script>


<!-- 삭제 버튼 -->
<script>
  $('.deleteBtn').click(function(){
	 
	  var boardNo = $(this).attr('boardNo');
      var result = window.confirm('게시물을 삭제하시겠습니까?');
   
      if(result==true)
    	{
			$.ajax({
				url:"/faq/faqBoardDelete.do",
				type:"get",
				data:{"boardNo":boardNo},
				success:function(result){
					
					alert(result);
					location.reload();
				
				},
				error:function(){
					consol.log("ajax2.do 서버 호출 실패");
				}
			});
   		 };
  });

</script>


</body>
</html>