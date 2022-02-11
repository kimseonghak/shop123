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
<title>123상회 환불 관리</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<style>
	*{
		box-sizing: border-box;
	}
/*  */
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
	table{
		width:100%;
		border-collapse: collapse;
		text-align: center;
		margin:0 auto;
		white-space: nowrap;
		border-spacing: 0px;
		table-layout: fixed;
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
	.tdTr:hover>td{
		background-color: rgb(240, 240, 240);
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
/* 승인 거절 CSS */
	.YNbtn{
		border-radius:3px;
		background-color: white;
		cursor: pointer;
		width:5vw;
		margin:1px;
		font-size:1.7vmin;
		overflow:hidden;
		text-overflow: ellipsis;
	}
	.Ybtn{
		border:1px solid #198754;
		color:#198754;
	}
	.Ybtn:hover{
		background-color: #198754;
		color:white;
	}
	.Nbtn{
		border:1px solid #87281A;
		color:#87281A;
	}
	.Nbtn:hover{
		background-color: #87281A;
		color:white;
	}
/* 승인상태 Span CSS */
	.YNspan{
		font-size:1.7vmin;
	}
	.Yspan{
		color:#198754;
	}
	.Nspan{
		color:#87281A;
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
				<span id="title">Refund</span>
			</div>
			<div id="searchWrap">
				<form action="/admin/adminRefundPage.do" method="get" style="widht:100%; height:100%;" id="searchForm">
					<button type="submit" id="searchBtn"><img alt="" src="/resources/admin/img/searchLeaf.png"></button>
					<input type="text" name="keyword" id="searchText"/>
					<select name="type" id="searchSelect">
						<option value="userNo">회원 번호</option>
						<option value="farmNo">농가 번호</option>
						<option value="orderNo">주문 번호</option>
					</select>
				</form>
			</div>
				<table>
					<tr id="thTr">
						<th width="10%">환불 번호</th>
						<th width="10%">문의 번호</th>
						<th width="10%">회원 번호</th>
						<th width="10%">농가 번호</th>
						<th width="20%">주문 번호</th>
						<th width="15%">환불 상태</th>
						<th width="25%">승인/취소</th>
					</tr>
					<c:forEach items="${map.list }" var="r">
						<tr class="tdTr">
							<td>${r.refundNo }</td>
							<td style="font-weight:bold; cursor:pointer;" class="questionUser">${r.questionUserNo }</td>
							<td style="font-weight:bold; cursor:pointer;" class="userNo">${r.userNo }</td>
							<td style="font-weight:bold; cursor:pointer;" class="farmNo">${r.farmNo }</td>
							<td>${r.orderNo }</td>
							<td>
								<c:choose>
									<c:when test="${String.valueOf(r.adminYN) eq 'X' }">
										가승인
									</c:when>
									<c:when test="${String.valueOf(r.adminYN) eq 'Y' }">
										<span class="YNspan Yspan">환불승인</span>
									</c:when>
									<c:when test="${String.valueOf(r.adminYN) eq 'N' }">
										<span class="YNspan Nspan">환불거절</span>
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${String.valueOf(r.adminYN) eq 'X'}">
										<button class="YNbtn Ybtn" data="${r.refundNo }" data2="Y">승인</button>
										<button class="YNbtn Nbtn" data="${r.refundNo }" data2="N">거절</button>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8" align="center">${map.pageNavi }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous">
	</script>
	<script>
<%-- 사이드바 선택 표시 --%>
		$(function() {
			$('#mainUl>li').eq(4).css('background-color', '#34734e');
			$('#mainUl>li>a').eq(4).css('color', 'white');
			$('#mainUl>li>a').eq(4).css('font-weight','bolder');
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
<%-- 해당 페이지 최초 페이지 이동 --%>
		$('#title').click(function(){
			location.replace('/admin/adminRefundPage.do');
		});
<%-- 환불  --%>
		$('.YNbtn').click(function(){
			var refundNo = $(this).attr('data');
			var adminYN = $(this).attr('data2');
			var result;
			
			if(adminYN=='Y'){
				result = window.confirm("환불을 승인하시겠습니까?")
			}else if(adminYN=='N'){
				result = window.confirm("환불을 거절하시겠습니까?");
			}
			
			if(result==true){
				$.ajax({
					url:"/admin/adminRefundUpdate.do",
					data:{refundNo:refundNo,
						adminYN:adminYN},
					type:"get",
					dataType:"json",
					success:function(result){
						if(result){
							alert('환불 상태가 변경되었습니다.');
							location.reload();
						}
					},
					error:function(){
						alert("오류가 발생하였습니다.");
					}
				});
			}else{
				alert('취소하였습니다.');
			}
		});
<%-- 문의 번호 클릭시 해당 게시글 팝업 --%>
	$('.questionUser').click(function(){
		var questionUserNo=$(this).html();
		window.open("/question/questionViewPage.do?questionUserNo="+questionUserNo,'_blank','width=1000px,height=800px');
	});
<%-- 유저 번호 클릭시 해당 유저 정보 창 띄우기 --%>
	$('.userNo').click(function(){
		var userNo = $(this).html();
		window.open("/admin/adminMemberInfoPage.do?userNo="+userNo,"_blank","width=500px, height=430px");
	});
<%-- 농가 번호 클릭시 해당 농가 정보 창 띄우기 --%>
	$('.farmNo').click(function(){
		var farmNo = $(this).html();
		window.open("/admin/adminFarmInfoPage.do?farmNo="+farmNo,"_blank","width=500px, height=430px");
	});
	</script>
</body>
</html>