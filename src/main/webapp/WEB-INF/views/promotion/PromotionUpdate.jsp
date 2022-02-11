<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%-- jstl 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<%-- 폰트 설정 라이브러리 --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<%-- 부트스트랩 라이브러리 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%-- css import --%>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

*{
	box-sizing: border-box;
}

html {
	height: 100%;
}
body {
	height: 100%;
}

.wrapForm{
	width: 100%;
	min-height: 100%;
}

.headerForm{
	width: 100%;
	height: 175px;
}

.contentForm{
	padding: 30px;
	width: 100%;
	background-color: #f0f0f0;
	
}

.footerForm{
	width: 100%;
	height: 242px;
}

.contentwrap{
	width: 90%;
	height: 80%;
	margin: 100px auto;
	padding: 10px;
	background-color: white;
	border-radius: 5px/5px;
}

.page_name{
	width: 40%;
	height: 60px;
	text-align: center;
	padding: 50px 20px 0px;
	margin: 5% 75% 5% 5%;
	color: #3BBD5A;
	font : normal bold 30px "Nanum Gothic",sans-serif;
}

.insert_zone{
	width: 80%;
	min-height: 700px;
}

.empty{
	width: 100%;
	height: 30px;
}



.title{
	width: 100%;
	height: 40px;
	border-radius: 5px / 5px;
	border: none;
	background-color: #f0f0f0;
	font : normal 20px "Nanum Gothic",sans-serif;
	outline: none;
}

.contextForm{
	width: 100%;
	min-height: 400px;
	margin-top: 30px;
	
}

.content{
	width: 100%;
	min-height: 400px;
	text-align: left;
	border: none;
	resize: none;
	font : normal 20px "Nanum Gothic",sans-serif;
	background-color: #f0f0f0;
	outline: none;
}

.imgCheck{
	width: 100%;
	height: 30px;
	text-align: left;
}

.imgForm{
	width: 100%;
	height: 30px;
	text-align: left;
	font : normal 20px "Nanum Gothic",sans-serif;
}

.btnform{
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 40px;
	text-align: center;
}

#img_Submit{
	float: right;
	width: 100px;
	height: 30px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 15px;
	border : none;
	cursor : pointer;
}

.listbtn{
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: gray;
	color: white;
	margin: 15px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.resetbtn{
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: gray;
	color: white;
	margin: 15px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.submitbtn{
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	margin: 15px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

</style>

<body>

<div id="wrapForm" align="center">
	
	<div class="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div class="contentForm">
		<div class="contentwrap">
			
			<%-- 제목 공간 --%>
			<div class="page_name">
				<span>홍보게시판 수정하기</span>
			</div>
			
			<%-- 빈 공간 --%>		
			<div class="empty"></div>
			
			<%-- 입력 폼 --%>
			<div class="insert_zone">
			<form action="/promotion/promotionUpdate.do" method="post" id="textWrite">
				
				<%-- 데이터를 보내주기 위한 Hidden --%>
						
				<%-- 글 제목 입력 --%>
				<input type="text" class="title" placeholder="제목을 입력하시오" value="${map.promotion.promotionTitle }"/>
				
				<%-- 글 내용 입력 --%>
				<div class="contextForm">
					<textarea class="content" placeholder="내용을 입력하시오">${map.promotion.promotionContent }</textarea>
				</div>
			
			</form>
			
				<%-- 빈 공간 --%>		
				<div class="empty"></div>
				
				<%-- 첨부파일 유무 확인 영역 --%>		
				<div class="imgCheck">
				<c:if test="${map.promotion.promotionPhotoNo==1 }">
					<p> 현재 첨부파일이 없습니다 </p>
				</c:if>
				<c:if test="${map.promotion.promotionPhotoNo!=1 }">
					<p> 현재 첨부파일 : ${map.promotion.promotionPhotoOriginal }</p>
				</c:if>
				</div>
				
				<%-- 첨부파일 --%>
				<div class="imgForm">
					<input type="file" id="file_submit"/>
					<button id="img_Submit">업로드하기</button>
				</div>
				
				<%-- 빈 공간 --%>		
				<div class="empty"></div>
				
				<%-- 버튼 폼 --%>
				<div class="Btnform">
					<button type="button" class="listbtn">리스트</button>
					<button type="reset" class="resetbtn">다시 쓰기</button>
					<button type="submit" class="submitbtn">글 작성하기</button>
				</div>
			
			</div>
		</div>
	</div>
	
	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>	

</div>

<script>
<%-- 글쓰기 버튼 --%>
	$('.submitbtn').click(function(){
		$("#textWrite").submit();
	});

<%-- 리스트 돌아가기 버튼 --%>
	$('.listBtn').click(function(){
		location.replace("/promotion/promotionListPage.do.do");
	});
</script>

</body>
</html>