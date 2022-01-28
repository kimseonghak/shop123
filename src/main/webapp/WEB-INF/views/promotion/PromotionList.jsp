<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홍보 게시판 조회</title>

<style type="text/css">

*{
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1417px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 1000px;
	padding: 10px;
	margin: 10px auto;
}

#footerFrom{
	width: 100%;
	height: 242px;
}


#promotionName{
	width: 200px;
	height: 70px;
	text-align: center;
	margin: 0 auto;
}

#promotion_searchWrap{
	width: 90%;
	height: 40px;
	margin: 0 auto;
}

#promotion_search_textFrom{
	float: right;
	width: 300px;
	height: 40px;
}


#promotion_search_btnFrom{
	float: right;
	width: 70px;
	height: 40px;
}

#promotion_search_writeFrom{
	float: right;
	width: 100px;
	height: 40px;
}

#promotion_listForm{
	width: 90%;
	height: 75%;
	margin: 0 auto;
	padding: 2px;
}

#submitBtn{
	width: 95px;
	height: 40px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}


#promotion_pageNavi{
	width: 90%;
	height: 50px;
	border: 1px solid black;
	margin: 0 auto;
}


/*홍보게시판 리스트 안에 디자인*/
.img_Form{
	width: 20%;
	height: 200px;
	float: left;
}

.promotion_titleFrom{
	width: 80%;
	height: 200px;
	float: right;
}
/*홍보게시판 리스트 안에 디자인 끝*/


#keyword{ 
	width: 98%;
	height: 100%;
	outline: none;
}

#searchBtn{
	width: 100%;
	height: 100%;
	background-color: #08E200;
	border: none;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 5px / 5px;	
	cursor : pointer;
	margin: 0 auto;
}
</style>


</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>	
	
	<div id="contentForm" align="left">
		<div id="promotionName" >
		<span></span>
			<span style="font-size: 30px; color: #3BBD5A; font-family: 'Nanum Gothic', sans-serif;">홍보 게시판</span>
		</div><br>
		
			<!-- 검색 공간 -->
			<div id="promotion_searchWrap">
				<div id="promotion_search_btnFrom">
					<button id="searchBtn">검색</button>
				</div>
				
				<div id="promotion_search_textFrom">
					<input type="text" id="keyword">
				</div>

				<div id="promotion_search_writeFrom">
					<button id="submitBtn">글 쓰기</button>
				</div>
			</div><br>
			<!-- 검색 공간 -->
			
				<div id="promotion_listForm">
					<!-- 리스트 글 갯수for문 돌릴시 나오는 게시글 형태 4개씩 나오도록 할것-->
					<div class="img_Form">
						<img alt="" src="" width="100%" height="100%">
					</div>
					
					<div class="promotion_titleFrom">
						<span>[ 이천 쌀 ]</span>
						<hr>
						<span>[ 작성일 : 2022-01-27 ]</span><br>
						<span>[ 조회수 : 22 ]</span>
					</div>
					<!-- 리스트 글 갯수for문 돌릴시 나오는 게시글 형태 -->
				</div><br>
		
		
			<!-- 페이지 네비게이션 -->
			<div id="promotion_pageNavi" align="center">
				페이지 네비바 들가는 공간
			</div>
			<!-- 페이지 네비게이션 -->
	</div>
	
	<div id="footerFrom">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>