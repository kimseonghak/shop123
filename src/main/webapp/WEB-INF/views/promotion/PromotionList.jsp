<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	height: 100%;
}

.headerForm{
	width: 100%;
	height: 175px;
}

.contentForm{
	padding: 30px;
	width: 100%;
}

.footerForm{
	width: 100%;
	height: 242px;
}

.contentwrap{
	width: 65%;
	min-height: 67%;
	margin: 100px auto;
	background-color: white;
	border-radius: 5px/5px;
	box-shadow: 3px 3px 10px #aeaeae;
}

.page_name{
	width: 25%;
	height: 60px;
	text-align: center;
	padding: 65px 20px 0px;
	margin: 5% 75% 5% 5%;
	color: #3BBD5A;
	font : normal bold 30px "Nanum Gothic",sans-serif;
}

.page_search_zone{
	width: 90%;
	height: 80px;
	padding: 10px;
	text-align: right;
	font : normal bold 17px "Nanum Gothic",sans-serif;
	margin-right: 50px;
}

.search_select{
	width: 10%;
	height: 35px;
	margin: 5px auto;
	border: 0.5px solid #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	
}

.searchkeyword{
	width: 20%;
	height: 35px;
	margin: 5px auto;
	background-color: #f0f0f0;
	border: none;
}

.searchBtn{
	width: 130px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	cursor : pointer;
	margin-right: 30px;
}

.list_zone{
	width: 80%;
	min-height: 1000px;
	padding: 2px;
	border-radius: 15px;
}

.list{
	width: 100%;
	height: 20%;
	margin: 5px auto;
	box-shadow: 3px 3px 10px #aeaeae;
	border-radius: 10px;
	cursor: pointer;
}

.list_img{
	width:20%;
	height: 100%;
	float: left;
	border-radius: 10px;
}

.titleform1{
	width: 75%;
	height: 25%;
	float: left;
	text-align: left;
	margin-left: 30px;
	margin-top: 30px;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.titleform2{
	width: 75%;
	height: 60%;
	float: left;
	text-align: left;
	margin-left: 30px;
	font : normal 17.5px "Nanum Gothic",sans-serif;
}

.pageNavi{
	width: 100%;
	height: 50px;
	margin-top: 40px;
	text-align: center;
}

.naviArrow{
	text-decoration: none;
	display : inline-block;
	color: black;
	margin : 2px;
	width : 25px;
	height: 25px;
	font-weight: bolder;
	opacity: 0.3;
	line-height: 150%;
}
#currentNavi{
	text-decoration: none;
	display:inline-block;
	color: white;
	background-color:#48bb78;
	border : 1px solid #48bb78;
	width : 25px;
	height: 25px;
	margin : 1px;
	font-weight: bolder;
	line-height: 150%;
}
.otherNavi{
	text-decoration: none;
	display:inline-block;
	color: #48bb78;
	border : 1px solid #48bb78;
	width : 25px;
	height: 25px;
	margin : 1px;
	font-weight: bolder;
	line-height: 150%;
}
.otherNavi:hover{
	color: white;
	background-color:#48bb78;
	opacity: 0.3;
}

.buttonform{
	width: 95%;
	height: 40px;
	margin-top: 40px;
	margin-right: 40px;
	text-align: right;
}

.writeBtn{
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

.mainBtin{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 60px;
	cursor : pointer;
}

.empty{
	width: 100%;
	height: 50px;
}

</style>

</head>
<body>

<div class="wrapForm" align="center">
	<div class="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div class="contentForm">
		<div class="contentwrap">
			
			<%-- 제목 공간 --%>
			<div class="page_name">
				<span>홍보 게시판</span>
			</div>
			
			<%-- 검색 공간 --%>
			<form action="/promotion/promotionListPage.do" method="get">
				<div class="page_search_zone">
				
					<select name="type" class="search_select">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="all">제목+내용</option>
					</select>
					
					<input type="text" name="keyword" class="searchkeyword" placeholder=""/>

					<button class="searchBtn">글 검색</button>
				</div>
			</form>
			
			<div class="empty"></div>
			
			<%-- 리스트 공간 --%>
			<div class="list_zone">
				<c:forEach items="${map.list}" var="promotion">
				<div class="list" onclick="location.href='/promotion/promotionViewPage.do?promotionNo=${promotion.promotionNo}&currentPage=${currentPage}&type=${map.type}&keyword=${keyword}'">
					<div class="list_img">
						<img src="${promotion.promotionFilePath }" width="100%" height="100%" style="border-radius: 10px;" />
					</div>
					
					<div class="titleform1">
						<span>${promotion.promotionTitle}</span>
					</div>
					
					<div class="titleform2">
						<P>[ 작성일 : ${promotion.promotionRegdate} ]</P><br>
						<p>[ 조회수 : ${promotion.promotionCount} ]</p>
					</div>
					
				</div>
				</c:forEach>
				<%-- 5개만 처리 --%>
			
			</div>
			
			<%-- 네비 공간 --%>
			<div class="pageNavi" align="center">
				${map.pageNavi }
			</div>
			
			<%-- 버튼 공간 --%>
			
			<div class="buttonform">
				<c:if test="${farm != null && (farm.rating ne 'admin' and farm.rating ne 'root')}">					
					<input type="submit" value="글 쓰기" class="writeBtn" onclick="location.href='/promotion/promotionWritePage.do'">
				</c:if>
					<input type="button" value="메인으로" class="mainBtin" onclick="location.href='/'">
			</div>
			
			<div class="empty"></div>
			
		</div>
	</div>
	
	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

<script>
	<%-- 네비화살표 hover시 투명도 조절 --%>
	$('.naviArrow').hover(function() {
		$(this).css('opacity', '1');
	}, function() {
		$(this).css('opacity', '0.3');
	});
	<%-- 현재페이지가 10페이지 이하일 경우 이전 페이지목록 비활성화 --%>
	$(function() {
		var currentPage = ${currentPage};
		if (currentPage < 11) {
			$('#prev').removeAttr('href');
			$('#prev').unbind('mouseenter mouseleave');
		}
	});
</script>

</body>
</html>