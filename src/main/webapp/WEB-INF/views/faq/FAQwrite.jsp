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
		height: 1217px;
	}
	
	#headerForm{
		width: 100%;
		height: 175px;
	}
	
	#contentForm{
		width: 100%;
		height: 800px;
		padding-top: 40px;
	}
	
	#footerFrom{
		width: 100%;
		height: 242px;
	}
	
	
	/* faqWrqp*/

	#faqWrap
    {
        width: 100%;
        height: 900px;
    }
    
    #faqContentWrap
    {
        width: 70%;
        height: 70%;
        margin: 0 auto;
        box-shadow: 3px 3px 10px #aeaeae;
    }
    
    #title
    {
        width: 100%;
        height: 20%;
       
    }
    #faqHeader
    {
        font-size: 3.7vmin;
        font-weight: bold;
        position: relative;
        left: 41%;
        top: 25%;
        color:#3BBD5A;
    }
    
    #faqTypeArea
    {
        width: 6%;
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
        width: 94%;
        height: 10%;
        float: left;
        
        
    }
    #faqTitle
    {
        width: 100%;
        height: 50%;
        position: relative;
        top: 25%;
       
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
       
    }
  
    #btnArea
    {
        width: 100%;
        height: 10%;
    }
    
    .insertBtn
    {
        width: 4%;
        height: 40%;
        border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		border: none;
        position: relative;
        left: 43vw; 
        top: 2.5vh;
    }
    .listBtn
    {
        width: 4%;
        height: 40%;
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

<div id="warpForm" align="center">
	<div id="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	<div id="contentForm" align="left"><br>
    <div id="faqWrap">
        <div id="faqContentWrap" >
            <div id="title">
               <span id="faqHeader">자주 찾는 질문</span>
            </div>  
            <form action="/fqa/fqaBoardWrite.do" method="post" onSubmit="return true;">
	            <div id="faqTypeArea">
	                <select id="faqType" name="type">
		                  <option value="" disabled selected>분류</option>
		                  <option value="F-2">배송</option>
		                  <option value="F-3">환불</option>
		                  <option value="F-1">기타</option>
	                 </select>
		          </div>
		           <div id="faqTitleArea">
		                <input type="text" name="faqTitle" id="faqTitle" placeholder="제목을 입력하세요"/>
		           </div>
		           <div id="faqContentArea">
		                 <textarea style="resize:none" name="faqContent" id="faqContent"></textarea>
		           </div>
		        </div>
		        <div id="btnArea">
		            <button type="submit" class="insertBtn">등록</button>
				     <button type="button" class="listBtn">목록</button>
		        </div>
			</form> 
    </div>

	</div><br>
		
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

<!-- 등록 버튼 클릭 시 유효성 검사 -->
<script>
	$('.insertBtn').click(function(){
		
		  
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


<!-- 목록 버튼 클릭 시 -->
<script>
	$('.listBtn').click(function(){
		
		location.replace("/faq/faqListPage.do");
		
	});

</script>





</body>
</html>