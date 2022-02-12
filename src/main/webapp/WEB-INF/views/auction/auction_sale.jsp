<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"rel="stylesheet">
<style>
#wrap {
	width: 100%;
	margin: 0 auto;
}
#leftSpace-top {
	width: 100%;
	height: 42%;
}
#content {
	width: 100%;
	height: 100vh;
	overflow: hidden;
	position: relative;
}

#subject-box {
	width: 100%;
	height: 8%;
}

#subject {
	width: 12.8%;
	height: 100%;
	margin: 0 auto;
}

#subject>span {
	display : block;
  	width : 100%;
    height : 100%;
    font-size: 28px;
    text-align : center;
	font-family: 'NanumSquare';
	color: #3BBD5A;
	font-weight: bold;
}

#leftSpace-footer {
	width: 100%;
	height: 8%;
}

#auctionSale-wrapBox {
	width: 84%;
	height: 70%;
	margin-left: 12.5%;
}

.auctionSale-box {
	width: 27%;
	height: 85%;
	float: left;
	margin-right: 50px;
}

.auctionSaleStatus-box {
	width: 100%;
	height: 18%;
	border-radius: 10px 10px 0 0;
	background-color: #3BBD5A;
}

.auctionSaleStatus {
	width: 100%;
	height: 40%;
}

.auctionSaleStatus span {
	font-size: 100%;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	height: 100%;
	display: block;
	margin-left: 10px;
	line-height: 30px;
}

.auctionSaleProduct {
	width: 100%;
	height: 59%;
}

.auctionSaleProduct>span {
	display: block;
	height : 100%;
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-weight: bold;
	text-align: center;
	margin-top: -5px;
}

.auctionSale-info {
	width: 100%;
	height: 86.1%;
	border-radius: 0 0 10px 10px;
	background-color: #E4FFF8;
}

.auctionSaleCount-input {
	width: 50%;
	height: 30px;
	border: none;
	text-align: center;
	border-radius: 5px;
	font-weight: bold;
	color: #3BBD5A;
	font-size: 15px;
}
.spanLeft{
	width: 35%;
	height: 30px;
	text-align:right;
	margin-top:10px;
	float : left;
	font-size: 16px;
	font-family: 'NanumSquare';
	
}
.spanRight{
	width: 63%;
	height: 30px;
	text-align: center;
	margin-top:10px;
	float : left;
	font-size: 16px;
	font-family: 'NanumSquare';
}
.auctionSaleBox-leftSpace{
	width : 100%;
	height: 4%;
}
.fontWeight{
	font-weight: bold;
}
.auctionSaleCount-input{
   width : 120px;
   height: 30px;
   border : none;
   text-align: center;
   border-radius: 5px;
   font-weight: bold;
   color : #3BBD5A;
   font-size: 15px;
   padding-left : 16px;
}
.spanRight-test {
   width: 63%;
   height: 37px;
   text-align: center;
   margin-top:6px;
   float : left;
   font-size: 16px;
   font-family: 'NanumSquare';
}
.spanmiddel{
   width: 35%;
   height: 30px;
   text-align: center;
   margin-top:10px;
   float : left;
   font-size: 16px;
   font-family: 'NanumSquare';
   text-align: right;
}
.spanLast{
   width: 25%;
   height: 30px;
   margin-top:10px;
   float : left;
   font-size: 16px;
   font-family: 'NanumSquare';
   text-align: left;
   padding-left: 10px;
}
.btn{
   width : 150px;
   height: 35px;
   border : none;
   text-align: center;
   border-radius: 10px;
   font-weight: bold;
   color : #ffff;
   font-size: 15px;
   background-color: #3BBD5A;
   display: block;
   margin: 0 auto;
   cursor:pointer;
}

.promotionBtn{
   width : 150px;
   height: 35px;
   border : 3px solid #3BBD5A;
   text-align: center;
   border-radius: 10px;
   font-weight: bold;
   color : #3BBD5A;
   font-size: 15px;
   display: block;
   margin: 0 auto;
   margin-top: 10px;
   cursor:pointer;
}

.font-style{
	color : #3BBD5A;
	font-weight: bold;
}
.margin{
	margin-right: 14px;
}

.margin-bottom{
	margin-bottom: 10px;
}
.block {
	width: 100%;
	height: 86.1%;
	background-color: black;
	margin-top: -107.3%;
	border-radius: 0 0 10px 10px;
	opacity: 0.65;
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/commons/header.jsp" />
		<div id="leftSpace-top"></div>
		<div id="content">
			<div id="subject-box">
				<div id="subject">
					<span>이달의 판매 현황</span>
				</div>
			</div>
			<div id="leftSpace-footer"></div>
			<div id="auctionSale-wrapBox">
			<jsp:useBean id="toDay" class="java.util.Date" />
         	<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today" />
      		
         	<c:choose>
        	<c:when test="${map.au1.sellStart>today }">
				<div class="auctionSale-box">
			<%--1번 폼 판매 예정인 경우 --%>
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au1.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au1.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel">${map.au1.sellEnd}</span>
                            <span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au1.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au1.auctionPrice}&nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" value="구매하기"/> 
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			</c:when>
			<%--1번 폼 데이터가 null 일 경우 --%>
			<c:when test="${map.au1.sellStart==null}">
			<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au1.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au1.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate2">${map.au1.sellEnd}</span>
                     		<span class="spanLast"></span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au1.auctionCount1}&nbsp;</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au1.auctionPrice}&nbsp;</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" id="aucBtn1" value="구매하기"/>
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			
			</c:when>
			<c:otherwise>
			<%--1번 폼 구매 가능--%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span class="status1">구매 가능</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au1.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<form action="/auction/orderPage.do" method="post">
							
							<input type="hidden" name="endYN1" value="${map.au1.sellEndYN }"/>
							<input type="hidden" name="currentCount" id="count1" value="${map.au1.auctionCount1 }"/>
							<input type="hidden" name="userId" value="${sessionScope.member.userId }"/>
							<input type="hidden" name="userPwd" value="${sessionScope.member.userPwd }"/>
							<input type="hidden" name="auctionProduct" value="${map.au1.auctionProduct }"/>
							<input type="hidden" name="auctionPrice" value="${map.au1.auctionPrice }"/>
							<input type="hidden" name="farmNo" value="${map.au1.farmNo }"/>
							<input type="hidden" name="no" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionNo" value="${map.au1.auctionNo }"/>
							<input type="hidden" name="boardNo" value="${map.au1.boardNo }"/>
							
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au1.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate1">${map.au1.sellEnd}</span>
                            <span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight remainTime1" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style auctionCount1">${map.au1.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au1.auctionPrice}&nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" min="0" name="auctionCount1" class="auctionSaleCount-input margin" value="0"/>
		                    </span> 
		                    <input type="button" class="btn" value="구매하기"/> 
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
							</form>
					</div>
					<div class="block" id="block1" style="display:none"></div>
				</div>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
        	<c:when test="${map.au2.sellStart>today }">
        	<%--2번 폼 판매 예정인 경우 --%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au2.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au2.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel">${map.au2.sellEnd}</span>
                     		<span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au2.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au2.auctionPrice}&nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" value="구매하기"/> 
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			</c:when>
			<%--2번 폼 데이터가 null 일 경우 --%>
			<c:when test="${map.au2.sellStart==null}">
			<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au2.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au2.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate2">${map.au2.sellEnd}</span>
                     		<span class="spanLast"></span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au2.auctionCount1}&nbsp;</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au2.auctionPrice}&nbsp;</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" id="aucBtn2" value="구매하기"/>
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			
			</c:when>
			<c:otherwise>
			<%--2번 폼 구매 가능--%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span class="status2">구매 가능</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au2.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<form action="/auction/orderPage.do" method="post">
							<input type="hidden" name="endYN2" value="${map.au2.sellEndYN }"/>
							<input type="hidden" name="currentCount" id="count2" value="${map.au2.auctionCount1 }"/>
							<input type="hidden" name="userId" value="${sessionScope.member.userId }"/>
							<input type="hidden" name="userPwd" value="${sessionScope.member.userPwd }"/>
							<input type="hidden" name="auctionProduct" value="${map.au2.auctionProduct }"/>
							<input type="hidden" name="auctionPrice" value="${map.au2.auctionPrice }"/>
							<input type="hidden" name="farmNo" value="${map.au2.farmNo }"/>
							<input type="hidden" name="no" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionNo" value="${map.au2.auctionNo }"/>
							<input type="hidden" name="boardNo" value="${map.au2.boardNo }"/>
							
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au2.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel  endDate2">${map.au2.sellEnd}</span>
                            <span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight remainTime2" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style auctionCount2">${map.au2.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au2.auctionPrice}&nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" min="0" name="auctionCount1" class="auctionSaleCount-input margin" value="0"/>
		                    </span> 
		                    <input type="button" class="btn" value="구매하기"/> 
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
							</form>
					</div>
					<div class="block" id="block2" style="display:none"></div>
				</div>
			</c:otherwise>
			</c:choose>
				
			<c:choose>
        	<c:when test="${map.au3.sellStart>today}">
        	<%--3번 폼 판매 예정인 경우 --%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au3.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au3.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate2">${map.au3.sellEnd}</span>
                     		<span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au3.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au3.auctionPrice}&nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" id="aucBtn3" value="구매하기"/>
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			</c:when>
			<%--3번 폼 데이터가 null 일 경우 --%>
			<c:when test="${map.au3.sellStart==null}">
			<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>판매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au3.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au3.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate2">${map.au3.sellEnd}</span>
                     		<span class="spanLast"></span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight" style="color: #FE0011"></span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style">${map.au3.auctionCount1}&nbsp;</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au3.auctionPrice}&nbsp;</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin"/>
		                    </span> 
		                    <input type="button" class="btn" id="aucBtn3" value="구매하기"/>
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
					</div>
					<div class="block"></div>
				</div>
			</c:when>
			<c:otherwise>
			<%--3번 폼 구매 가능--%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span class="status3">구매 가능</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au3.auctionProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<form action="/auction/orderPage.do" method="post">
							<input type="hidden" name="endYN3" value="${map.au3.sellEndYN }"/>
							<input type="hidden" name="currentCount" id="count3" value="${map.au3.auctionCount1 }"/>
							<input type="hidden" name="userId" value="${sessionScope.member.userId }"/>
							<input type="hidden" name="userPwd" value="${sessionScope.member.userPwd }"/>
							<input type="hidden" name="auctionProduct" value="${map.au3.auctionProduct }"/>
							<input type="hidden" name="auctionPrice" value="${map.au3.auctionPrice }"/>
							<input type="hidden" name="farmNo" value="${map.au3.farmNo }"/>
							<input type="hidden" name="no" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionNo" value="${map.au3.auctionNo }"/>
							<input type="hidden" name="boardNo" value="${map.au3.boardNo }"/>
							
							<span class="spanLeft">시작일 :</span>
                     		<span class="spanRight">${map.au3.sellStart}</span>
                    		<span class="spanLeft">종료일 :</span>
                     		<span class="spanmiddel endDate3">${map.au3.sellEnd}</span>
                            <span class="spanLast">23:59:59</span>
                     		<span class="spanLeft">남은시간 :</span>
                     		<span class="spanRight fontWeight remainTime3" style="color: #FE0011">-</span>
							<span class="spanLeft">현재 상품 수량 :</span>
							<span class="spanRight font-style auctionCount3">${map.au3.auctionCount1}&nbsp;상자</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight font-style">${map.au3.auctionPrice} &nbsp;원</span>
							<span class="spanLeft">구매 수량 :</span>
							<span class="spanRight-test margin-bottom">
		                    	<input type="number" min="0" name="auctionCount1" class="auctionSaleCount-input margin" value="0"/>
		                    </span> 
		                    <input type="button" class="btn" id="aucBtn3" value="구매하기"/> 
		                    <input type="button" class="promotionBtn" value="홍보 게시판"/> 
							</form>
					</div>
					<div class="block" id="block3" style="display:none"></div>
				</div>
			</c:otherwise>
			</c:choose>
			
			</div>
		</div>
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

	<script>
	
	
	
	
//구매하기 버튼 눌렀을 경우 호출
	$('.btn').click(function(){
		
			var currentCount = parseInt($(this).parent().find('input[name=currentCount]').val());
			var auctionCount1 = parseInt($(this).parent().find('input[name=auctionCount1]').val());
			var userNo = $(this).parent().find('input[name=userNo]').val();
			var auctionProduct = $(this).parent().find('input[name=auctionProduct]').val();
			var farmNum = $(this).parent().find('input[name=no]').val();
			var auctionNo = $(this).parent().find('input[name=auctionNo]').val();
			
			//회원인지 ,수량 제대로 입력했는지 유효성 검사
			if(farmNum!=''){	
				alert('일반 회원만 이용 가능합니다.');
				return false;
			}else if(userNo==''){
				alert('로그인 후 이용 가능합니다.');
				return false;
			}else if(auctionCount1==0){
				alert('수량을 입력해주세요.');
				return false;
			}else if(currentCount<auctionCount1){
				alert(currentCount+'상자까지 입력 가능합니다.');
				return false;
			}else{
				
				if(confirm(auctionProduct+' '+auctionCount1+'상자 주문하시겠습니까?')){
					$(this).parents('form').submit();
				}
									
			}
	});
	
//홍보 게시판 버튼 눌렀을 경우
	$('.promotionBtn').click(function(){
		
		var boardNo = $(this).parent().find('input[name=boardNo]').val();
		
		if(boardNo==0){
			alert('현재 홍보 게시글이 존재해지 않습니다.');
			return false;
		}
	});
	
	
//1 남은 시간 카운트 다운
	   $(function(){
		   
		   var endYN = $('input[name=endYN1]').val();
		   var count = $('#count1').val();
		   
	      const offset = new Date().getTimezoneOffset() * 60000;
	      var date = new Date();
	      $.each($(".endDate1"),function(index, item){
	         var ele = $(this);
	         var date3 = new Date($(item).html());
	         date3.setDate(date3.getDate()+1);
	         date3.setHours(date3.getHours()-9);
	         var currentTime = date.getTime();
	         var endTime = date3.getTime();
	         if(endTime-currentTime>0 &&endYN=='N' && count>0){
	            var interval = endTime-currentTime;
	            
	            setInterval(function(){
	               interval-=1000;
	               var remainingDays = parseInt(interval/(1000*60*60*24));
	               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
	               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
	               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
	               $('.remainTime1').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
	            },1000);
	            
	         }else{
	            $('.remainTime1').html('마감되었습니다.');
	            $('.status1').html('판매종료');
	            $('.auctionCount1').html('품절되었습니다.');
	            $('#block1').css('display','block');
	         }
	      });
	   });
	   
//2 남은 시간 카운트 다운
	   $(function(){
		   
		   var endYN = $('input[name=endYN2]').val();
		   var count = $('#count2').val();
		   
		   
	      const offset = new Date().getTimezoneOffset() * 60000;
	      var date = new Date();
	      $.each($(".endDate2"),function(index, item){
	         var ele = $(this);
	         var date3 = new Date($(item).html());
	         date3.setDate(date3.getDate()+1);
	         date3.setHours(date3.getHours()-9);
	         var currentTime = date.getTime();
	         var endTime = date3.getTime();
	         if(endTime-currentTime>0 && endYN=='N' && count>0){
	            var interval = endTime-currentTime;
	            
	            setInterval(function(){
	               interval-=1000;
	               var remainingDays = parseInt(interval/(1000*60*60*24));
	               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
	               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
	               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
	               $('.remainTime2').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
	            },1000);
	            
	         }else{
	            $('.remainTime2').html('마감되었습니다.');
	            $('.status2').html('판매종료');
	            $('.auctionCount2').html('품절되었습니다.');
	            $('#block2').css('display','block');
	         }
	      });
	   });
	   
//3 남은 시간 카운트 다운
	   $(function(){
		   
		   var endYN = $('input[name=endYN3]').val();
		   var count = $('#count3').val();
		   
	      const offset = new Date().getTimezoneOffset() * 60000;
	      var date = new Date();
	      $.each($(".endDate3"),function(index, item){
	         var ele = $(this);
	         var date3 = new Date($(item).html());
	         date3.setDate(date3.getDate()+1);
	         date3.setHours(date3.getHours()-9);
	         var currentTime = date.getTime();
	         var endTime = date3.getTime();
	         if(endTime-currentTime>0 && endYN=='N' && count>0){
	            var interval = endTime-currentTime;
	            
	            setInterval(function(){
	               interval-=1000;
	               var remainingDays = parseInt(interval/(1000*60*60*24));
	               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
	               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
	               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
	               $('.remainTime3').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
	            },1000);
	            
	         }else{
	            $('.remainTime3').html('마감되었습니다.');
	            $('.status3').html('판매종료');
	            $('.auctionCount3').html('품절되었습니다.');
	            $('#block3').css('display','block');
	            $('.auctionCount3').html('');
	         }
	      });
	   });

	</script>





</body>
</html>