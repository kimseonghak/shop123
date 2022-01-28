<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	background-color: #f0f0f0;
}

#footerFrom{
	width: 100%;
	height: 242px;
}

#questionWrap{
	width: 70%;
	height: 90%;
	border: none;
	border-radius: 5px;
	margin: 0 auto;
	background-color: white;
}

#question_name{
	width: 30%;
	height: 70px;
	text-align: center;
	font : normal bold 30px "Nanum Gothic",sans-serif;
	color: #08E200;
	margin: 0 auto;
}

#question_searchWrap{
	width: 80%;
	height: 40px;
	margin: 0 auto;
}

#question_search_textFrom{
	float: right;
	width: 300px;
	height: 40px;
}

#keyword{
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
}

#question_search_btnFrom{
	float: right;
	width: 70px;
	height: 40px;
	margin-left: 20px;
}

#searchbtn{
	width: 95%;
	height: 100%;
	border: none;
	color: #ffffff;
	border-radius: 5px;
	background-color: #3BBD5A;
	font-size: 20px;
	cursor: pointer;
}

#question_table_form{
	width: 80%;
	height: 60%;
	border: 2px solid black;
	border-radius: 5px;
	margin: 0 auto;
}

#question_pageNavi{
	width: 80%;
	height: 30px;
	margin: 0 auto;
}

table{
	border: 1px solid black;
}

/*table border값이 먹히지 않아 일단 대기 백단할때 하기
*/

#question_search_writeFrom{
	height: 40px;
	width: 80%;
	margin: 0 auto;
}

#write_btn{
	width: 120px;
	height: 100%;
	float: right;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	cursor: pointer;
	border: none;
}

</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
		
	<div id="contentForm" align="left"><br>
		<div id="questionWrap">
			<div id="question_name">
				문의 게시판
			</div>
			
			<!-- 검색 공간 -->
			<div id="question_searchWrap">
				<div id="question_search_btnFrom">
					<button id="searchbtn">검색</button>
				</div>
				
				<div id="question_search_textFrom">
					<input type="text" id="keyword"/>
				</div>
			</div><br>
			<!-- 검색 공간 -->
			
			<div id="question_table_form" align="center">
				<table>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
					</tr>	
				</table>
			</div><br>
			
			<!-- 페이지 네비게이션 -->
			<div id="question_pageNavi" align="center">
				페이지 네비바 들가는 공간
			</div>
			<!-- 글 쓰기 버튼 -->
			<div id="question_search_writeFrom">
				<button id="write_btn">글 쓰기</button>
			</div>
		</div>
	</div><br>
		
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>