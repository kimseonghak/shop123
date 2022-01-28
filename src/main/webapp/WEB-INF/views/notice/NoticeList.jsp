<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

*{
	
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1617px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	padding: 20px;
	width: 100%;
	height: 1200px;
	background-color: #f0f0f0;
}

#footerFrom{
	width: 100%;
	height: 242px;
}

#noticeWrap{
	width: 60%;
	height: 65%;
	margin: 100px auto;
	background-color: white;
	border-radius: 5px/5px;
}

#notice_name{
	width: 20%;
	height: 50px;
	text-align: center;
	margin: 0 auto;
	color: #08E200;
}

#notice_table_form{
	width: 100%;
	height: 65%;
	margin: 0 auto;
	margin-top: 10px;
	border: 1px solid rgba(0, 0, 0, .15);
}

#notice_pageNavi{
	width: 100%;
	height: 50px;
	margin: 0 auto;

}


#notice_searchWrap{
	
	width: 100%;
	height: 40px;
}

#notice_search_textFrom{
	float: right;
	width: 300px;
	height: 40px;
}


/*버튼 폼*/
#submitBtn{
	width: 130px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	cursor : pointer;
	margin-left: -70px;
}

#notice_search_btnFrom{
	float: right;
	width: 140px;
	height: 40px;
}

#notice_search_writeFrom{
	float: right;
	width: 100px;
	height: 30px;
	
}

#serachBtn{
	width: 100px;
	height: 30px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	cursor : pointer;
}
/*버튼 폼끝*/

#keyword{
	width: 300px;
	height: 30px;
	font-size: 20px;
}


</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	
	<div id="contentForm" align="left">
		<div id="noticeWrap"><br>
			<div id="notice_name">
				<span style="font-size: 30px; color: #3BBD5A;">공지 사항</span>
			</div>
			
			<!-- 검색 공간 -->
			<div id="notice_searchWrap">
				<div id="notice_search_btnFrom" align="center">
					<button id="serachBtn">글 검색</button>
				</div>
				
				<div id="notice_search_textFrom">
					<input type="text" id="keyword"/>
				</div>
			</div>
			<!-- 검색 공간 -->
			

			<div id="notice_table_form" align="center">
				
			</div>
			

			<!-- 페이지 네비게이션 -->
			<div id="notice_pageNavi" align="center">
				페이지 네비바 들가는 공간
			</div>
			<!-- 글 쓰기 버튼 -->
			<div id="notice_search_writeFrom">
					<button id="submitBtn">글 쓰기</button>
			</div>
		</div>
	</div>
	
	
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>