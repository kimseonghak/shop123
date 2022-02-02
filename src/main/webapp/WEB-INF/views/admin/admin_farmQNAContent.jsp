<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/admin/css/common.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mainContents{
		padding: 0px;
	}
	#backgroundColor{
		border-top-left-radius:1vw;
		width:100%;
		height:100%;
		padding: 10px;
		padding-left:20px;
		padding-right:20px;
		background-color: rgba(72,187,120,0.1);
	}
	#titleSpace{
		border:1px solid #48bb78;
		width:10%;
		height:5vmin;
		text-align: center;
		border-radius: 10px;
		background-color: white;
		color:#48bb78;
		font-weight: bold;
	}
	#title{
		display:block;
		font-size: 3vmin;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	#qnaWrap{
		border:1px solid black;
		width:100%;
		height:60%;
	}
	#btnListWrap{
		border:1px solid black;
		width:100%;
		height:7vh;
		margin-top: -2vh;
		text-align: right;
		margin-bottom: 3vh;
	}
	#qnaAnswerWrap{
		border:1px solid black;
		width:100%;
		height:20%;
	}
	
</style>
</head>
<body>
	<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp" />
	<div id="bodyWrap">
		<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp" />
		<%-- mainContents --%>
		<div id="mainContents">
			<div id="backgroundColor">
				<div id="titleSpace">
					<span id="title">Farm QNA</span>
				</div>
				<div id="btnListWrap">
				
				</div>
				<div id="qnaWrap">
					
				</div>
				<div id="qnaAnswerWrap">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>