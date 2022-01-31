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
<style>
	*{
		box-sizing: border-box;
	}
	table{
		width:100%;
		border-spacing : 0px;
		text-align: center;
		margin:0 auto;
		white-space: nowrap;
	}
	.naviArrow{
		text-decoration: none;
		display : inline-block;
		color: black;
		border : 1px solid black;
		margin : 2px;
		width : 25px;
		height: 25px;
		font-weight: bolder;
		opacity: 0.3;
	}
	#currentNavi{
		text-decoration: none;
		display:inline-block;
		color: white;
		background-color:black;
		border : 1px solid black;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
	}
	.otherNavi{
		text-decoration: none;
		display:inline-block;
		color: black;
		border : 1px solid black;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
	}
	.otherNavi:hover{
		color: white;
		background-color:black;
		opacity: 0.3;
	}
	#thTr th{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	table td,th{
		text-overflow: ellipsis;
	}
</style>
<link rel="stylesheet" href="/resources/admin/css/common.css">
</head>
<body>
	<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp" />
	<div id="bodyWrap">
		<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp" />
		<%-- mainContents --%>
		<div id="mainContents">
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
				<tr>
					<td>${q.questionFarmNo }</td>
					<td>${q.questionFarmTitle }</td>
					<td>${q.farmNo }</td>
					<td>${q.farmName }</td>
					<td>${q.questionFarmRegdate }</td>
					<td>${q.questionFarmAnswerYN }</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center">${map.pageNavi }</td>
				</tr>
			</table>
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
			var currentPage = $
			{
				currentPage
			}
			;
			if (currentPage < 11) {
				$('#prev').removeAttr('href');
				$('#prev').unbind('mouseenter mouseleave');
			}
		});
	</script>
</body>
</html>