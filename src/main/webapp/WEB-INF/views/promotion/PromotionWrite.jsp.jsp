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
	width: 25%;
	height: 60px;
	text-align: center;
	padding: 50px 20px 0px;
	margin: 5% 75% 5% 5%;
	color: #3BBD5A;
	font : normal bold 30px "Nanum Gothic",sans-serif;
}

.insert_zone{
	width: 80%;
	min-height: 900px;
}

.empty{
	width: 100%;
	height: 30px;
}

.optiontitle{
	min-width: 100px;
	height: 30px;
	color: #3BBD5A;
	font : normal bold 20px "Nanum Gothic",sans-serif;
	margin: 10px;
	text-align: left;
}

.option_form{
	width: 100%;
	height: 50px;
}

.option{
	min-width: 100px;
	height: 30px;
	border: none;
	text-align: left;
	font : normal bold 20px "Nanum Gothic",sans-serif;
	float: left;
	margin-left: 30px;
	outline: none;
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

.imgForm{
	width: 100%;
	height: 30px;
	text-align: left;
}

.btnform{
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 40px;
	text-align: center;
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
				<span>제목 입력</span>
			</div>
			
			<%-- 빈 공간 --%>		
			<div class="empty"></div>
			
			<%-- 입력 폼 --%>
			<div class="insert_zone">
			<form action="">
				
				<%-- 옵션 1 --%>
				<div class="optiontitle">옵션 내용 입력</div>
					<div class="option_form">
						<select class="option">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
					
				<%-- 옵션 2 --%>
				<div class="optiontitle">옵션 내용 입력</div>
					<div class="option_form">
						<select class="option">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
				
				<%-- 빈 공간 --%>		
				<div class="empty"></div>	
						
				<%-- 글 제목 입력 --%>
				<input type="text" class="title" placeholder="제목을 입력하시오"/>
				
				<%-- 글 제목 입력 --%>
				<div class="contextForm">
					<textarea class="content" placeholder="내용을 입력하시오"></textarea>
				</div>
				
				<%-- 빈 공간 --%>		
				<div class="empty"></div>
				
				<%-- 첨부파일 --%>
				<div class="imgForm">
					<input type="file" id="file_submit"/>
				</div>
				
				<%-- 빈 공간 --%>		
				<div class="empty"></div>
				
				<%-- 버튼 폼 --%>
				<div class="Btnform">
					<button type="button" class="listbtn">리스트</button>
					<button type="reset" class="resetbtn">다시 쓰기</button>
					<button type="submit" class="submitbtn">글 작성하기</button>
				</div>
				
			</form>
			
			</div>
		</div>
	</div>
	
	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>	

</div>

</body>
</html>