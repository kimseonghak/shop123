<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<style>
	*{
		box-sizing: border-box;
	}
	table{
		width:100%;
		border-collapse: collapse;
		text-align: center;
		margin:0 auto;
		white-space: nowrap;
		border-spacing: 0px;
	}
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
	.naviArrow{
		text-decoration: none;
		display : inline-block;
		color: black;
		border : 1px solid black;
		margin : 2px;
		width : 3.5vmin;
		height: 3.5vmin;
		font-weight: bolder;
		opacity: 0.3;
		line-height: 150%;
	}
	#currentNavi{
		text-decoration: none;
		display:inline-block;
		color: white;
		background-color:black;
		border : 1px solid black;
		width : 3.5vmin;
		height: 3.5vmin;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi{
		text-decoration: none;
		display:inline-block;
		color: black;
		border : 1px solid black;
		width : 3.5vmin;
		height: 3.5vmin;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi:hover{
		color: white;
		background-color:black;
		opacity: 0.3;
	}
	table td,th{
		text-overflow: ellipsis;
		font-size:2vmin;
	}
	table tr:not(:last-child)>td{
		background-color: white;
		box-shadow: 0.3vmin 0.2vmin rgba(0,0,0,0.5);
	}
	table tr{
		widht:100%;
		height:6vmin;
	}
	.listSpace{
		width:100%;
		height:0.5vmin
	}
	#titleSpaece{
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
		font-size: 3vmin;
	}
	.tdTr:hover{
		cursor: pointer;
	}
	.tdTr:hover>td{
		background-color: rgb(240, 240, 240);
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
			<div id="titleSpaece">
				<span id="title">Farm QNA</span>
			</div>
				<table>
					<tr id="thTr">
						<th width="10%">문의 번호</th>
						<th width="40%">문의 제목</th>
						<th width="10%">농가 번호</th>
						<th width="15%">농가 이름</th>
						<th width="15%">문의 날짜</th>
						<th width="10%">진행 상황</th>
					</tr>
					<c:forEach items="${map.list }" var="q">
					<tr class="tdTr">
						<td>${q.questionFarmNo }</td>
						<td style="font-weight:bolder;">${q.questionFarmTitle }</td>
						<td>${q.farmNo }</td>
						<td style="font-weight:bolder;">${q.farmName }</td>
						<td>${q.questionFarmRegdate }</td>
						<td>${q.questionFarmAnswerYN }</td>
					</tr>
					<tr class="listSpace"></tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="center">${map.pageNavi }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script>
		$('.naviArrow').hover(function() {
			$(this).css('opacity', '1');
		}, function() {
			$(this).css('opacity', '0.3');
		});
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