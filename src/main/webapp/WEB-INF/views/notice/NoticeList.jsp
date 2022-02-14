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
	height: 1617px;
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
	height: 65%;
	margin: 100px auto;
	border-radius: 15px;
	box-shadow: 3px 3px 10px #aeaeae;
}

.page_name{
	width: 25%;
	height: 60px;
	text-align: center;
	padding: 80px 20px 0px;
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

.table_zone{
	width: 80%;
	height: 50%;
	border: 1px solid #2a2a2a;
	border-radius: 15px;

}

.table>thead{
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.view{
	cursor: pointer;
}

.boardtitle{
	font : normal bold 1rem "Nanum Gothic",sans-serif;
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

.empty{
	width: 100%;
	height: 30px;
}

.buttonform{
	width: 95%;
	height: 40px;
	margin-top: 40px;
	margin-right: 100px;
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

</style>
<!-- 위 오른쪽 아래 왼쪽 순 -->
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
				<span>공지 사항</span>
			</div>
			
			<%-- 검색 공간 --%>
			<form action="" method="get">
				<div class="page_search_zone">
				
					<select name="type" class="search_select">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="all">제목+내용</option>
					</select>
					
					<input type="text" name="keyword" class="searchkeyword" placeholder=""/>

					<button class="searchBtn">글 검색</button>
				</div>
			</form>
			
			<%-- 빈 공간 --%>		
			<div class="empty"></div>
			
			<%-- 테이블 공간 --%>
			<div class="table_zone" align="center">
				<table class="table">
					 <thead>
					    <tr>
					      <th scope="col">글 번호</th>
					      <th scope="col">대상</th>
					      <th scope="col">분류</th>
					      <th scope="col">글 제목</th>
					      <th scope="col">작성일</th>
					      <th scope="col">조회수</th>
					    </tr>
					  </thead>
					<!-- 반복문 -->
					<c:forEach items="${map.list}" var="notice">				
						<tr class="view" onclick="location.href='/notice/NoticeView.do?noticeNo=${notice.noticeNo}&currentPage=${currentPage}&type=${map.type}&keyword=${keyword}'">
					      <th scope="row">${notice.noticeNo}</th>
					      <td>${notice.noticeCode}</td>
					      <c:choose>
						      <c:when test="${notice.noticeCategory eq 'Category-1' }">					
								  <td>[기타]</td>
							  </c:when>
							  <c:when test="${notice.noticeCategory eq 'Category-2' }">					
								  <td>[회원가입]</td>
							  </c:when>
							  <c:when test="${notice.noticeCategory eq 'Category-3' }">					
								  <td>[경매]</td>
							  </c:when>
							  <c:otherwise></c:otherwise>
						  </c:choose>
					      <td class="boardtitle">${notice.noticeTitle}</td>
					      <td>${notice.noticeRegdate}</td>
					      <td>${notice.noticeCount}</td>
					    </tr>
					</c:forEach>				
				</table>
			</div>
			
			<%-- 네비 공간 --%>
			<div class="pageNavi" align="center">
				${map.pageNavi}
			</div>
			
			<%-- 버튼 공간 --%>
			
			<div class="buttonform">
				<c:if test="${farm != null && (farm.rating eq 'admin' or farm.rating eq 'root')}"> 
					<input type="submit" value="글 쓰기" class="writeBtn" onclick="location.href='/notice/noticeWritePage.do'">
				</c:if> 
					<input type="button" value="메인으로" class="mainBtin" onclick="location.href='/'">
			</div>
			
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