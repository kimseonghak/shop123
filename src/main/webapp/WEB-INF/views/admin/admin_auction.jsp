<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<style>
	.auctionWrap{
		width:50%;
		height:100%;
		float:left;
		border:1px solid black;
	}
	.auctionFormWrap{
		width:100%;
		height:33.33%;
		border:1px solid black;
		padding-top: 5px;
	}
	.sellFormWrap{
		width:100%;
		height:33.33%;
		border:1px solid black;
	}
	legend{
		border:1px solid black;
		border-radius: 5px;
		font-size: 1.1vw;
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
			<div class="auctionWrap">
				<div class="auctionFormWrap">
				<form>
					<fieldset>
						<legend>경매 1번</legend>
						asdf
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
				<form>
					<fieldset>
						<legend>경매 2번</legend>
						
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
				<form>
					<fieldset>
						<legend>경매 3번</legend>
						
					</fieldset>
				</form>
				</div>
			</div>
			<div class="auctionWrap">
				<div class="sellFormWrap"></div>
				<div class="sellFormWrap"></div>
				<div class="sellFormWrap"></div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$('#mainUl>li').eq(1).css('background-color', 'white');
			$('#mainUl>li').eq(1).css('color', 'black');
			$('#mainUl>li').eq(1).css('font-weight','bolder');
		});
	</script>
</body>
</html>