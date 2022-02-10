<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

.titleform1{
	width: 95%;
	height: 50px;
	border-bottom: 1px solid black;
	position: relative;
	padding: 10px;
	margin-top: 20px;
	margin-botton: 50px;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.tag-select{
	text-align: left;
	float: left;
	
}

.title{
	width: 75%;
	text-align: left;
	float: left;
	margin-left: 10px;
}

.user{
	float: right;
}

.titleform2{
	width: 95%;
	height: 40px;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.icon{
	width:17.5px;
	height:17.5px;
}

.time{
	text-align: left;
	float: left;
	margin-left: 20px;
	margin-top:5px;
}

.hit{
	float: left;
	margin-left: 20px;
	margin-top:5px;
}

.img{
	width: 60%;
	height: 500px;
	margin-top: 50px;
	border-radius: 15px;
}

.context{
	width: 85%;
	min-height: 200px;
	margin-top: 50px;
}

.empty{
	width: 100%;
	height: 50px;
}

.btnform{
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 40px;
	text-align: center;
}

.promotionBtn{
	width: 130px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	cursor : pointer;
}

.mainBtn{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	cursor : pointer;
}

.deleteBtn{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	cursor : pointer;
}

.updateBtn{
	width: 130px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	cursor : pointer;
}

</style>

<body>

<div id="wrapForm" align="center">
	<div class="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>

	<div class="contentForm">
		<div class="contentwrap">
		
			<%-- 태그, 제목, 작성자 영역 --%>
			<div class="titleform1">
				<div class="tag-select">
					<span>[홍보]</span>
				</div>
				<div class="title">
					<span>${map.promotion.promotionTitle }</span>
				</div>
				<div class="user">
					<span>${map.promotion.farmName }</span>
				</div>
			</div>
			
			<%-- 작성일, 조회수 영역 --%>
			<div class="titleform2">
				<div class="time">
					<img class="icon" src="/resources/icon/clock_icon.png"/>
					<span>${map.promotion.promotionRegdate }</span>
				</div>
				<div class="hit">
					<img class="icon" src="/resources/icon/hit_icon.png"/>
					<span>${map.promotion.promotionCount }</span>
				</div>
			</div>
			
			<%-- 게시글 영역 --%>
			<div class="content_zone">
				<div class="img">
					<img src="${map.promotion.PromotionFilePath}"/>
				</div>
				<div class="context">
					<p>${map.promotion.promotionContent }</p>
				</div>
			</div>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
			<%-- 버튼 영역 --%>
			<div class="btnForm">
				<c:if test="${farm != null && (farm.rating ne 'admin' or farm.rating ne 'root')}">
					<button type="button" class="promotionBtn">홍보요청</button>
					<button type="button" class="deleteBtn">글 삭제</button>
					<button type="submit" class="updateBtn">글 수정</button>
				</c:if>
				<button type="button" class="mainBtn">메인으로</button>
			</div>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
		</div>
	</div>

	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>	
</div>


</body>
</html>