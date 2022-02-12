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
<title>123상회 Member관리</title>
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
/* 페이지 Navi CSS */
	.naviArrow{
		text-decoration: none;
		display : inline-block;
		color: black;
		margin : 2px;
		width : 3.5vmin;
		height: 3.5vmin;
		font-weight: bolder;
		opacity: 0.3;
		line-height: 200%;
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
		line-height: 200%;
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
		line-height: 200%;
	}
	.otherNavi:hover{
		color: white;
		background-color:#48bb78;
		opacity: 0.3;
	}
/* table CSS */
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
/* title CSS */
	#titleSpace{
		border:1px solid #198754;
		width:10%;
		height:5vmin;
		text-align: center;
		border-radius: 10px;
		background-color: white;
		color:#198754;
		font-weight: bold;
	}
	#title{
		display:block;
		font-size: 3vmin;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		cursor: pointer;
	}
	.tdTr:hover>td{
		background-color: rgb(240, 240, 240);
	}
/* 검색바 CSS */
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
/* 유저 정보 커서 효과 */
	.userInfo{
		cursor: pointer;
	}
/* 탈퇴 복구 버튼 CSS */
	.endYNbtn{
		font-size:1.7vmin;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.endYNN{
		width:80%;
		height:100%;
		border:1px solid #198754;
		border-radius:3px;
		background-color: white;
		cursor: pointer;
		color: #198754;
	}
	.endYNN:hover{
		background-color: #198754;
		color: white;
	}
	.endYNY{
		width:80%;
		height:100%;
		border:1px solid #87281A;
		border-radius:3px;
		background-color: white;
		cursor: pointer;
		color: #87281A;
	}
	.endYNY:hover{
		background-color: #87281A;
		color: white;
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
				<span id="title">Member</span>
			</div>
			<div id="searchWrap">
					<form action="/admin/adminMemberPage.do" method="get" style="widht:100%; height:100%;" id="searchForm">
						<button type="submit" id="searchBtn"><img alt="" src="/resources/admin/img/searchLeaf.png"></button>
						<input type="text" name="keyword" id="searchText" />
						<select name="type" id="searchSelect">
							<option value="userNo">회원 번호</option>
							<option value="userName">회원 이름</option>
							<option value="userNick">회원 닉네임</option>
							<option value="all">회원 이름+닉네임</option>
						</select>
					</form>
			</div>
				<table>
					<tr id="thTr">
						<th width="10%">회원 번호</th>
						<th width="20%">회원 ID</th>
						<th width="10%">회원 이름</th>
						<th width="20%">회원 닉네임</th>
						<th width="30%">회원 이메일</th>
						<th width="10%">탈퇴 여부</th>
					</tr>
					<c:forEach items="${map.list }" var="m">
					<tr class="tdTr">
						<td>${m.userNo }</td>
						<td class="userInfo" style="font-weight:bold;">${m.userId }</td>
						<td>${m.userName }</td>
						<td>${m.userNick }</td>
						<td>${m.userEmail }</td>
						<c:if test="${String.valueOf(m.userEndYN) eq 'N'}">
							<td class="endYNtd"><button class="endYNbtn endYNN" data="${m.userEndYN }">탈퇴</button></td>
						</c:if>
						<c:if test="${String.valueOf(m.userEndYN) eq 'Y'}">
							<td class="endYNtd"><button class="endYNbtn endYNY" data="${m.userEndYN }">복구</button></td>
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
			$('#mainUl>li').eq(6).css('background-color', '#34734e');
			$('#mainUl>li>a').eq(6).css('color', 'white');
			$('#mainUl>li>a').eq(6).css('font-weight','bolder');
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
<%-- 검색아이콘 클릭시 서브밋 --%>
		$('#searchIcon').click(function(){
			$(this).parents('form').submit();
		});
<%-- 아이디 클릭시 해당 회원 정보 창 출력 --%>
		$('.userInfo').click(function(){
			var userNo = $(this).prev().html();
			window.open("/admin/adminMemberInfoPage.do?userNo="+userNo,"_blank","width=500px, height=430px");
		});
<%-- 회원 탈퇴/복구 버튼 로직 --%>
		$('.endYNbtn').click(function(){
			var endYN = $(this).attr('data');
			var userNo = $(this).parent().siblings().eq(0).html();
			var currentPage = ${currentPage };
			
			location.replace("/admin/adminMemberEndYNUpdate.do?endYN="+endYN+"&userNo="+userNo+"&currentPage="+currentPage);
		});
<%-- 해당 페이지 최초 페이지 이동 --%>
		$('#title').click(function(){
			location.replace('/admin/adminMemberPage.do');
		});
	</script>
</body>
</html>