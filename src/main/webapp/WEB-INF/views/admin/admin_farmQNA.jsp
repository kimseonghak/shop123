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
		table-layout: fixed;
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
		background-color:#48bb78;
		border : 1px solid #48bb78;
		width : 3.5vmin;
		height: 3.5vmin;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi{
		text-decoration: none;
		display:inline-block;
		color: #48bb78;
		border : 1px solid #48bb78;
		width : 3.5vmin;
		height: 3.5vmin;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi:hover{
		color: white;
		background-color:#48bb78;
		opacity: 0.3;
	}
	table td,th{
		overflow:hidden;
		text-overflow: ellipsis;
		font-size:1.7vmin;
		font-family: 'Nanum Gothic', 'sans-serif';
	}
	table tr:not(:last-child)>td{
		background-color: white;
	}
	table tr:not(:first-child,:last-child,:nth-child(2n-1)){
		border: 1px solid rgb(93 154 113 / 10%)
	}
	table tr{
		width:100%;
		height:6vmin;
	}
	.listSpace{
		width:100%;
		height:0.5vmin
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
	.tdTr:hover{
		cursor: pointer;
	}
	.tdTr:hover>td{
		background-color: rgb(240, 240, 240);
	}
	#searchWrap{
		width:100%;
		height:4vh;
		text-align: right;
		margin-bottom: 3vh;
		margin-top: -2vh;
	}
	#searchSelect{
		display:block;
		height:100%;
		border:none;
		box-shadow: 1vmin 1vmin 10px #48bb78;
		float:right;
	}
	#searchSelect:focus{
		outline: none;
		border: none;
	}
	#searchText{
		height:100%;
		display:block;
		width: 30vw;
		border:none;
		box-shadow: 1vmin 1vmin 10px #48bb78;
		position:relative;
		z-index:1;
		float:right;
	}
	#searchText:focus {
		outline: none;
	}
	#searchBtn{
		display:block;
		height:100%;
		width: 8vmin;
		font-size: 2vmin;
		background-color: white;
		border-style:none;
		box-shadow: 1vmin 1vmin 10px #48bb78;
		position:relative;
		z-index:2;
		float:right;
		padding-top: 
	}
	#searchBtn>img{
		height:100%;
	}
	.answerImgTd{
		padding:0.5vmin;
		line-height: 100%;
	}
	.answerImg{
		width:60%;
		height:60%;
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
			<div id="searchWrap">
					<form action="/admin/adminFarmQNASearch.do" method="get" style="widht:100%; height:100%;" id="searchForm">
						<button type="submit" id="searchBtn"><img alt="" src="/resources/admin/img/searchLeaf.png"></button>
						<input type="text" name="keyword" id="searchText" />
						<select name="type" id="searchSelect">
							<option value="title">제목</option>
							<option value="name">농가 이름</option>
							<option value="content">내용</option>
							<option value="all">제목+내용</option>
						</select>
					</form>
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
					<tr class="tdTr" qFarmNo=${q.questionFarmNo }>
						<td>${q.questionFarmNo }</td>
						<td style="font-weight:bolder;">${q.questionFarmTitle }</td>
						<td>${q.farmNo }</td>
						<td style="font-weight:bolder;">${q.farmName }</td>
						<td>${q.questionFarmRegdate }</td>
						<c:if test="${String.valueOf(q.questionFarmAnswerYN) eq 'N'}">
							<td class="answerImgTd"><img class="answerImg" alt="" src="/resources/admin/img/답변 대기.png"></td>
						</c:if>
						<c:if test="${String.valueOf(q.questionFarmAnswerYN) eq 'Y'}">
							<td class="answerImgTd"><img class="answerImg" alt="" src="/resources/admin/img/문의 종료.png"></td>
						</c:if>
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
<%-- 사이드바 선택 표시 --%>
		$(function() {
			$('#mainUl>li').eq(2).css('background-color', '#34734e');
			$('#mainUl>li>a').eq(2).css('color', 'white');
			$('#mainUl>li>a').eq(2).css('font-weight','bolder');
		});
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
<%-- 글 tr 클릭시 해당 글 내용으로 이동하는 스크립트 --%>
		$('.tdTr').click(function(){
			var qFarmNo = $(this).attr('qFarmNo');
			var currentPage = ${currentPage};
			location.replace('/admin/adminFarmQNAContent.do?currentPage='+currentPage+'&questionFarmNo='+qFarmNo);
		});
<%-- 검색아이콘 클릭시 서브밋 --%>
		$('#searchIcon').click(function(){
			$(this).parents('form').submit();
		});
	</script>
</body>
</html>