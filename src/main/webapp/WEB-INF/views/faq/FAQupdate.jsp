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
	

	
	/* faqWrqp*/

	#faqWrap
    {
        width: 100%;
        height: 600px;
    }
    
    #faqContentWrap
    {
        width: 80%;
        height: 90%;
        margin: 0 auto;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 20px;
      	box-shadow: 3px 3px 10px #aeaeae;
      	padding: 5 5 5 5 ;
       
    }
    
    #title
    {
        width: 100%;
        height: 20%;
       
    }
    #faqHeader
    {
        font-size: 30px;
        font-weight: bolder;
        position: relative;
        left: 36%;
        top: 25%;
        color:#3BBD5A;
    }
    
    #faqTypeArea
    {
        width: 14%;
        height: 10%;
        float: left;
       
        
    }
    #faqType
    {
        width: 100%;
        height: 50%;
        position: relative;
        top: 25%;
        text-align: center;
        
    }

    #faqTitleArea
    {
        width: 86%;
        height: 10%;
        float: left;
        
        
    }
    #faqTitle
    {
        width: 100%;
        height: 50%;
        position: relative;
        top: 25%;
        padding-left: 5px;
       
    }
    
    
    #faqContentArea
    {
        width: 100%;
        height: 70%;
        float: left;
       
        
    }
    #faqContent
    {
        width: 100%;
        height: 100%;
        float: left;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
		padding: 15 15 15 15;
    }
  
    #btnArea
    {
        width: 100%;
        height: 10%;
    }
    
    .updateBtn
    {
        width: 8%;
        height: 48%;
        border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
        position: relative;
        left: 43vw; 
        top: 2.5vh;
    }
    .closeBtn
    {
        width: 8%;
        height: 48%;
        border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
        position: relative;
        left: 44vw; 
        top: 2.5vh;
    }

</style>

</head>
<body>


	
    <div id="faqWrap">
        <div id="faqContentWrap" >
            <div id="title">
               <span id="faqHeader">자주 찾는 질문</span>
            </div>  
            <form action="/fqa/fqaBoardUpdate.do" method="post">
	            <div id="faqTypeArea">
	                <select id="faqType" name="type">
	                	<c:choose>	
	                		<c:when test="${list.get(0).getFaqCode() eq 'F-1'}">
				                  <option value="" disabled selected>분류</option>
				                  <option value="F-2">배송</option>
				                  <option value="F-3">환불</option>
				                  <option value="F-1" selected>기타</option>
			                 </c:when> 
			                 <c:when test="${list.get(0).getFaqCode() eq 'F-2'}">
				                  <option value="" disabled>분류</option>
				                  <option value="F-2" selected>배송</option>
				                  <option value="F-3">환불</option>
				                  <option value="F-1">기타</option>
			                 </c:when> 
			                <c:otherwise>
				                  <option value="" disabled>분류</option>
				                  <option value="F-2">배송</option>
				                  <option value="F-3" selected>환불</option>
				                  <option value="F-1">기타</option>
			                </c:otherwise>
	                  </c:choose>
	                 </select>
		            </div>
		            <div id="faqTitleArea">
		                <input type="text" name="faqTitle" id="faqTitle" value="${list.get(0).getFaqTitle()}"/>
		                <input type="hidden" name="boardNo" value="${list.get(0).getFaqNo()}"/>
		            </div>
		            <div id="faqContentArea">
		                 <textarea style="resize:none" name="faqContent" id="faqContent">${list.get(0).getFaqContent()}</textarea>
		            </div>
		        </div>
		        <div id="btnArea">
		            <button type="submit" class="updateBtn">수정</button>
				     <button type="button" class="closeBtn">닫기</button>
		        </div>
			</form> 
    </div>

		
<!-- 수정 버튼 클릭 시 유효성 검사 -->
<script>
	$('.updateBtn').click(function(){
		
		  
		if($('select[name=type]').val()==null)
		{
			alert('게시글의 분류를 선택해주세요');
			return false;
		}
		
		if($('input[name=faqTitle]').val()==null || $('input[name=faqTitle]').val()=='' ||  $('textarea[name=faqContent]').val()==null ||  $('textarea[name=faqContent]').val()=='')
		{
			alert('입력칸에 빈칸이 있는지 확인해주세요');
			return false;
		}
	
		
	});

</script>


<!--닫기 버튼 클릭 시 -->
<script>
	$('.closeBtn').click(function(){
		
		window.close();
		
	});

</script>





</body>
</html>