<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<style>
.countWrap{
	border:1px solid black;
	width:25%;
	height:50%;
	float:left;
	padding:5px;
}
.boardWrap{
	border:1px solid black;
	width:33.3%;
	height:50%;
	float:left;
	padding:5px;
}
.count-graphWrap{
	border:1px solid black;
	width:100%;
	height:70%;	
}
.count-textWrap{
	border:1px solid black;
	width:100%;
	height:30%;
}
</style>
</head>
<body>
<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp"/>
	<div id="bodyWrap">
<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp"></c:import>
<%-- mainContents --%>
		<div id="mainContents">
<%-- 카운트 요약 부분 --%>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
<%-- 보드 요약 부분 --%>
			<div class="boardWrap"></div>
			<div class="boardWrap"></div>
			<div class="boardWrap"></div>
		</div>
	</div>
	<script>
		$(function() {
			$('#mainUl>li').eq(0).css('background-color', 'white');
			$('#mainUl>li').eq(0).css('color', 'black');
			$('#mainUl>li').eq(0).css('font-weight','bolder');
		});
	</script>
</body>
</html>