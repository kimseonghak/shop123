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
		padding:5px;
	}
	.auctionFormWrap{
		width:100%;
		height:33.33%;
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
		font-size: 2vmin;
		width:11vmin;
		height:2.2vim;
		text-align: center;
	}
	.auctionHalfWrap{
		width:50%;
		height:100%;
		float:left;
	}
	.auctionFieldset{
		width:100%;
		height:100%;
	}
	.auctionText{
		border-radius: 10px;
		background:linear-gradient(to top,#3cfc91,#09dbdb);
		display:block;
		height:10%;
		width:30%;
		font-size: 1.8vmin;
		overflow: hidden;
		text-align: center;
	}
	.auctionInput{
		width:80%;
		height:10%;
		display:block;
		margin: 2px auto;
	}
	#auctionYN{
		display: inline-block;
	}
	.auctionRadioText{
		font-size: 1.6vmin;
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
<%-- 경매 폼 1번 --%>
				<form action="/admin/auctionInput.do" method="post">
					<fieldset class="auctionFieldset">
						<legend>경매 1번</legend>
						<input type="hidden" name="auctionFormNo" value="1">
						<div class="auctionHalfWrap">
							<span class="auctionText">경매 상품</span>
							<input type="text" class="auctionInput" name="auctionProduct" readonly="readonly">
							<span class="auctionText" value="">시작 날짜</span>
							<input type="date" class="auctionInput" name="auctionStart" readonly="readonly">
							<span class="auctionText">종료 날짜</span>
							<input type="date" class="auctionInput" name="auctionEnd" readonly="readonly">
							<span class="auctionText">경매 가격</span>
							<input type="number" class="auctionInput" name="auctionPrice" readonly="readonly">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="N" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;" checked="checked"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="Y" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
						<div class="auctionHalfWrap">
							<span class="auctionText" >추가 농가2</span>
							<input type="number" class="auctionInput" name="farmNo2" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품2</span>
							<input type="number" class="auctionInput" name="auctionCount2" readonly="readonly" value="0">
							<span class="auctionText" >추가 농가3</span>
							<input type="number" class="auctionInput" name="farmNo3" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품3</span>
							<input type="number" class="auctionInput" name="auctionCount3" readonly="readonly" value="0">
							<button type="button" class="submitButton" number="0">입력</button>
						</div>
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
<%-- 경매 폼 2번 --%>
				<form action="/admin/auctionInput.do" method="post">
					<fieldset class="auctionFieldset">
						<legend>경매 2번</legend>
						<input type="hidden" name="auctionFormNo" value="2">
						<div class="auctionHalfWrap">
							<span class="auctionText">경매 상품</span>
							<input type="text" class="auctionInput" name="auctionProduct" readonly="readonly">
							<span class="auctionText" value="">시작 날짜</span>
							<input type="date" class="auctionInput" name="auctionStart" readonly="readonly">
							<span class="auctionText">종료 날짜</span>
							<input type="date" class="auctionInput" name="auctionEnd" readonly="readonly">
							<span class="auctionText">경매 가격</span>
							<input type="number" class="auctionInput" name="auctionPrice" readonly="readonly">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="N" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;" checked="checked"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="Y" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
						<div class="auctionHalfWrap">
							<span class="auctionText" >추가 농가2</span>
							<input type="number" class="auctionInput" name="farmNo2" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품2</span>
							<input type="number" class="auctionInput" name="auctionCount2" readonly="readonly" value="0">
							<span class="auctionText" >추가 농가3</span>
							<input type="number" class="auctionInput" name="farmNo3" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품3</span>
							<input type="number" class="auctionInput" name="auctionCount3" readonly="readonly" value="0">
							<button type="button" class="submitButton" number="0">입력</button>
						</div>
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
<%-- 경매 폼 3번 --%>
				<form action="/admin/auctionInput.do" method="post">
					<fieldset class="auctionFieldset">
						<legend>경매 3번</legend>
						<input type="hidden" name="auctionFormNo" value="3">
						<div class="auctionHalfWrap">
							<span class="auctionText">경매 상품</span>
							<input type="text" class="auctionInput" name="auctionProduct" readonly="readonly">
							<span class="auctionText" value="">시작 날짜</span>
							<input type="date" class="auctionInput" name="auctionStart" readonly="readonly">
							<span class="auctionText">종료 날짜</span>
							<input type="date" class="auctionInput" name="auctionEnd" readonly="readonly">
							<span class="auctionText">경매 가격</span>
							<input type="number" class="auctionInput" name="auctionPrice" readonly="readonly">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="N" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;" checked="checked"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="Y" name="auctionEndYN" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
						<div class="auctionHalfWrap">
							<span class="auctionText" >추가 농가2</span>
							<input type="number" class="auctionInput" name="farmNo2" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품2</span>
							<input type="number" class="auctionInput" name="auctionCount2" readonly="readonly" value="0">
							<span class="auctionText" >추가 농가3</span>
							<input type="number" class="auctionInput" name="farmNo3" readonly="readonly" value="1">
							<span class="auctionText" >추가 상품3</span>
							<input type="number" class="auctionInput" name="auctionCount3" readonly="readonly" value="0">
							<button type="button" class="submitButton" number="0">입력</button>
						</div>
					</fieldset>
				</form>
				</div>
			</div>
<%-- 판매 폼 시작 --%>
			<div class="auctionWrap">
				<div class="auctionFormWrap">
<%-- 판매 폼 1번 --%>
				<form>
					<fieldset class="auctionFieldset">
						<legend>판매 1번</legend>
						<div class="auctionHalfWrap">
							<span class="auctionText" >판매 상품</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >시작 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >종료 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >판매 가격</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="Y" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="N" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
						<div class="auctionHalfWrap">
							<span class="auctionText" >경매 번호</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >홍보 주소</span>
							<input type="text" class="auctionInput">
						</div>
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
<%-- 판매 폼 2번 --%>
				<form>
					<fieldset class="auctionFieldset">
						<legend>판매 2번</legend>
						<div class="auctionHalfWrap">
							<span class="auctionText" >판매 상품</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >시작 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >종료 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >판매 가격</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="Y" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="N" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
						<div class="auctionHalfWrap">
							<span class="auctionText" >경매 번호</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >홍보 주소</span>
							<input type="text" class="auctionInput">
						</div>
					</fieldset>
				</form>
				</div>
				<div class="auctionFormWrap">
<%-- 판매 폼 3번 --%>
				<form>
					<fieldset class="auctionFieldset">
						<legend>판매 3번</legend>
						<div class="auctionHalfWrap">
							<span class="auctionText" >판매 상품</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >시작 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >종료 날짜</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >판매 가격</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" id="auctionYN">종료 여부</span>
							<label><span class="auctionRadioText">시작</span><input type="radio" value="Y" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
							<label><span class="auctionRadioText">종료</span><input type="radio" value="N" name="auctionEnd" style="width:1.5vmin; height:1.5vmin;"></label>
						</div>
							<div class="auctionHalfWrap">
							<span class="auctionText" >경매 번호</span>
							<input type="text" class="auctionInput">
							<span class="auctionText" >홍보 주소</span>
							<input type="text" class="auctionInput">
						</div>
					</fieldset>
				</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
<%-- 사이드바 CSS --%>
		$(function() {
			$('#mainUl>li').eq(1).css('background-color', '#34734e');
			$('#mainUl>li').eq(1).css('color', 'white');
			$('#mainUl>li').eq(1).css('font-weight','bolder');
		});
<%-- 날짜 설정 --%>
		$(function(){
			
			$('input[name=auctionStart]').val(new Date().toISOString().substring(0,10));
			$('input[name=auctionEnd]').val(new Date().toISOString().substring(0,10));
		});
		$('.submitButton').click(function(){
			if($(this).html()=='입력'){
				$(this).html('입력완료');
				$(this).parents('form').find('.auctionInput').attr('readonly',false);
			}else{
				$(this).parents('form').eq($(this).attr('number')).submit();
			}
		});
	</script>
</body>
</html>