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
	height: 100%;
	margin: 0 auto;
}
#leftSpace-top {
	width: 100%;
	height: 310px;
}
#content {
	width: 100%;
	height: 100%;
}

#leftSpace-left {
	width: 12.5%;
	height: 875px;
	float: left;
}

#subject-box {
	width: 84%;
	height: 59px;
	float: left;
}

#subject {
	width: 100%;
	height: 37px;
	margin-top: 13px;
	margin-left: 37.5%;
}

#subject>span {
	font-size: 28px;
	font-family: 'NanumSquare';
	color: #3BBD5A;
	font-weight: bold;
}

#leftSpace-footer {
	width: 84%;
	height: 70px;
	float: left;
}

#auctionSale-wrapBox {
	width: 84%;
	height: 400px;
	float: left;
}

.auctionSale-box {
	width: 27%;
	height: 385px;
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
	font-size: 16px;
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
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-weight: bold;
	display: block;
	text-align: center;
	margin-top: -5px;
}

.auctionSale-info {
	width: 100%;
	height: 305px;
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
	width: 33%;
	height: 30px;
	text-align:right;
	margin-top:10px;
	float : left;
	font-size: 16px;
	font-family: 'NanumSquare';
}
.spanRight{
	width: 65%;
	height: 30px;
	text-align: center;
	margin-top:10px;
	float : left;
	font-size: 16px;
	font-family: 'NanumSquare';
}
.auctionSaleBox-leftSpace{
	width : 100%;
	height: 7%;
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
   width: 65%;
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
	width: 29%;
	height: 30px;
	margin-top:10px;
	float : left;
	font-size: 16px;
	font-family: 'NanumSquare';
	text-align: left;
	padding-left: 10px;
}

.margin-bottom{
	margin-bottom: 14px;
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
}

.font-style{
	color : #3BBD5A;
	font-weight: bold;
}
.margin{
	margin-right: 14px;
}
.block {
	width: 100%;
	height: 305px;
	background-color: black;
	margin-top: -305px;
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
			<div id="leftSpace-left"></div>
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
			<c:when test="${map.au.auctionSaleStart>today }">
			<%--1번 폼 구매 중이 아닌 경우 --%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>구매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 구매 폼 로직-->
							<span class="spanLeft">현재 판매 수량 :</span>
							<span class="spanRight">200</span>
							<span class="spanLeft">낙찰된 가격 :</span>
							<span class="spanRight">5500원</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">-</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin" value="0"/>
		                    </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionSalePrice" class="auctionSaleCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
					</div>
					<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 1번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>경매 중</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au1.auctionSaleProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<input type="hidden" name="auctionSaleFormNo" value="${map.au1.auctionSaleFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionSaleProduct" value="${map.au1.auctionSaleProduct }"/>
							<input type="hidden" name="currentPrice" value="${map.au1.auctionSalePrice }"/>
							<input type="hidden" name="auctionSaleCount1" value="${map.au1.auctionSaleCount1 }"/>
							<input type="hidden" name="auctionSaleStart" value="${map.au1.auctionSaleStart }"/>
							<input type="hidden" name="auctionSaleEnd" value="${map.au1.auctionSaleEnd }"/>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight auctionSaleStart">${map.au1.auctionSaleStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au1.auctionSaleEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionSaleCount" class="auctionSaleCount-input margin" value="${map.au1.auctionSaleCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionSalePrice" class="auctionSaleCount-input" value="${map.au1.auctionSalePrice }"/>원
		                    </span> 
		                     <input type="submit" class="btn" value="입찰하기"/>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
				
			<c:choose>
			<c:when test="${map.au.auctionSaleStart>today }">
			<%--2번 폼 경매 중이 아닌 경우 --%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>경매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">2022-02-02</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanRight">2022-02-05 23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">2 : 6 : 33 : 35</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin" value="0"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" min="0" name="auctionSalePrice" class="auctionSaleCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
						</div>
					<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 2번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span class="auctionSaleProduct">경매 중</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au2.auctionSaleProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<input type="hidden" name="auctionSaleFormNo" value="${map.au2.auctionSaleFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionSaleProduct" value="${map.au2.auctionSaleProduct }"/>
							<input type="hidden" name="currentPrice" value="${map.au2.auctionSalePrice }"/>
							<input type="hidden" name="auctionSaleCount1" value="${map.au2.auctionSaleCount1 }"/>
							<input type="hidden" name="auctionSaleStart" value="${map.au2.auctionSaleStart }"/>
							<input type="hidden" name="auctionSaleEnd" value="${map.au2.auctionSaleEnd }"/>
					
							
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">${map.au2.auctionSaleStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au2.auctionSaleEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionSaleCount" class="auctionSaleCount-input margin" value="${map.au2.auctionSaleCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionSalePrice" class="auctionSaleCount-input" value="${map.au2.auctionSalePrice }"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${map.au.auctionSaleStart>today }">
			<%--3번 폼 경매 중이 아닌 경우 --%>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>경매 예정</span>
						</div>
						<div class="auctionSaleProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">2022-02-02</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanRight">2022-02-05 23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">2 : 6 : 33 : 35</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionSaleCount" class="auctionSaleCount-input margin" value="0"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionSalePrice" class="auctionSaleCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
						</div>
						<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 3번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auctionSale-box">
					<div class="auctionSaleStatus-box">
						<div class="auctionSaleStatus">
							<span>경매 중</span>
						</div>
						<div class="auctionSaleProduct">
							<span>${map.au3.auctionSaleProduct }</span>
						</div>
					</div>
						<div class="auctionSale-info">
							<div class="auctionSaleBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<input type="hidden" name="auctionSaleFormNo" value="${map.au3.auctionSaleFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionSaleProduct" value="${map.au3.auctionSaleProduct }"/>
							<input type="hidden" name="auctionSalePrice" value="${map.au3.auctionSalePrice }"/>
							<input type="hidden" name="auctionSaleCount1" value="${map.au3.auctionSaleCount1 }"/>
							<input type="hidden" name="auctionSaleStart" value="${map.au3.auctionSaleStart }"/>
							<input type="hidden" name="auctionSaleEnd" value="${map.au3.auctionSaleEnd }"/>
							<input type="hidden" name="currentPrice" value="${map.au3.auctionSalePrice }"/>
							
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">${map.au3.auctionSaleStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au3.auctionSaleEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionSaleCount" class="auctionSaleCount-input margin" value="${map.au3.auctionSaleCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionSalePrice" class="auctionSaleCount-input" value="${map.au3.auctionSalePrice }"/>원
		                    </span> 
		                    <input type="button" class="btn" value="입찰하기"/>
						</div>
				</div>
			</c:otherwise>
			</c:choose>
				
			</div>
		</div>
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

	<script>
	

	</script>





</body>
</html>