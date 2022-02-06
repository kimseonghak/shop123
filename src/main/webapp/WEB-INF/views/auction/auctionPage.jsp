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
<title>경매</title>
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

#auction-wrapBox {
	width: 84%;
	height: 400px;
	float: left;
}

.auction-box {
	width: 27%;
	height: 385px;
	float: left;
	margin-right: 50px;
}

.auctionStatus-box {
	width: 100%;
	height: 18%;
	border-radius: 10px 10px 0 0;
	background-color: #3BBD5A;
}

.auctionStatus {
	width: 100%;
	height: 40%;
}

.auctionStatus span {
	font-size: 16px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	height: 100%;
	display: block;
	margin-left: 10px;
	line-height: 30px;
}

.auctionProduct {
	width: 100%;
	height: 59%;
}

.auctionProduct>span {
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-weight: bold;
	display: block;
	text-align: center;
	margin-top: -5px;
}

.auction-info {
	width: 100%;
	height: 305px;
	border-radius: 0 0 10px 10px;
	background-color: #E4FFF8;
}

.auctionCount-input {
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
.auctionBox-leftSpace{
	width : 100%;
	height: 7%;
}
.fontWeight{
	font-weight: bold;
}
.auctionCount-input{
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
					<span>이달의 경매 현황</span>
				</div>
			</div>
			<div id="leftSpace-footer"></div>
			<div id="auction-wrapBox">
			
			<jsp:useBean id="toDay" class="java.util.Date" />
			<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today" />
		
			<c:choose>
			<c:when test="${map.au.auctionStart>today }">
			<%--1번 폼 경매 중이 아닌 경우 --%>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span>경매 예정</span>
						</div>
						<div class="auctionProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">2022-02-02</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanRight">2022-02-05 23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">-</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionCount" class="auctionCount-input margin" value="0"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionPrice" class="auctionCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
					</div>
					<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 1번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span>경매 중</span>
						</div>
						<div class="auctionProduct">
							<span>${map.au1.auctionProduct }</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<input type="hidden" name="auctionFormNo" value="${map.au1.auctionFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionProduct" value="${map.au1.auctionProduct }"/>
							<input type="hidden" name="currentPrice" value="${map.au1.auctionPrice }"/>
							<input type="hidden" name="auctionCount1" value="${map.au1.auctionCount1 }"/>
							<input type="hidden" name="auctionStart" value="${map.au1.auctionStart }"/>
							<input type="hidden" name="auctionEnd" value="${map.au1.auctionEnd }"/>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight auctionStart">${map.au1.auctionStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au1.auctionEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionCount" class="auctionCount-input margin" value="${map.au1.auctionCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au1.auctionPrice }"/>원
		                    </span> 
		                     <input type="submit" class="btn" value="입찰하기"/>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
				
			<c:choose>
			<c:when test="${map.au.auctionStart>today }">
			<%--2번 폼 경매 중이 아닌 경우 --%>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span>경매 예정</span>
						</div>
						<div class="auctionProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">2022-02-02</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanRight">2022-02-05 23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">2 : 6 : 33 : 35</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionCount" class="auctionCount-input margin" value="0"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" min="0" name="auctionPrice" class="auctionCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
						</div>
					<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 2번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span class="auctionProduct">경매 중</span>
						</div>
						<div class="auctionProduct">
							<span>${map.au2.auctionProduct }</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<input type="hidden" name="auctionFormNo" value="${map.au2.auctionFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionProduct" value="${map.au2.auctionProduct }"/>
							<input type="hidden" name="currentPrice" value="${map.au2.auctionPrice }"/>
							<input type="hidden" name="auctionCount1" value="${map.au2.auctionCount1 }"/>
							<input type="hidden" name="auctionStart" value="${map.au2.auctionStart }"/>
							<input type="hidden" name="auctionEnd" value="${map.au2.auctionEnd }"/>
					
							
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">${map.au2.auctionStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au2.auctionEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionCount" class="auctionCount-input margin" value="${map.au2.auctionCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au2.auctionPrice }"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${map.au.auctionStart>today }">
			<%--3번 폼 경매 중이 아닌 경우 --%>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span>경매 예정</span>
						</div>
						<div class="auctionProduct">
							<span>레몬</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">2022-02-02</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanRight">2022-02-05 23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight" style="color: #FE0011">2 : 6 : 33 : 35</span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" name="auctionCount" class="auctionCount-input margin" value="0"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionPrice" class="auctionCount-input" value="5500"/>원
		                    </span> 
		                    <input type="submit" class="btn" value="입찰하기"/>
						</div>
						<div class="block"></div>
				</div>
				</c:when>
							
			<%--경매 3번 폼 경매 중인 경우 --%>
			<c:otherwise>
				<div class="auction-box">
					<div class="auctionStatus-box">
						<div class="auctionStatus">
							<span>경매 중</span>
						</div>
						<div class="auctionProduct">
							<span>${map.au3.auctionProduct }</span>
						</div>
					</div>
						<div class="auction-info">
							<div class="auctionBox-leftSpace"></div>
							<!-- 경매 폼 로직-->
							<input type="hidden" name="auctionFormNo" value="${map.au3.auctionFormNo }"/>
							<input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
							<input type="hidden" name="auctionProduct" value="${map.au3.auctionProduct }"/>
							<input type="hidden" name="auctionPrice" value="${map.au3.auctionPrice }"/>
							<input type="hidden" name="auctionCount1" value="${map.au3.auctionCount1 }"/>
							<input type="hidden" name="auctionStart" value="${map.au3.auctionStart }"/>
							<input type="hidden" name="auctionEnd" value="${map.au3.auctionEnd }"/>
							<input type="hidden" name="currentPrice" value="${map.au3.auctionPrice }"/>
							
							<span class="spanLeft">시작일 :</span>
							<span class="spanRight">${map.au3.auctionStart }</span>
							<span class="spanLeft">종료일 :</span>
							<span class="spanmiddel endDate">${map.au3.auctionEnd  }</span>
							<span class="spanLast">23:59:59</span>
							<span class="spanLeft">남은시간 :</span>
							<span class="spanRight fontWeight remainTime" style="color: #FE0011"></span>
							<span class="spanLeft">판매수량 :</span>
							<span class="spanRight-test">
		                          <input type="number" min="0" name="auctionCount" class="auctionCount-input margin" value="${map.au3.auctionCount1 }"/>
		                     </span> 
		                    <span class="spanLeft">현재 최저가 :</span>
		                    <span class="spanRight-test margin-bottom font-style">
		                          <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au3.auctionPrice }"/>원
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
	
	//입찰하기 버튼 누를 시, 최저가/수량 비교해 로직 처리
	$('.btn').click(function(){
		
		var auctionCount1 = $(this).parent().find('input[name=auctionCount]').val();     //수량
		var auctionFormNo = $(this).parent().find('input[name=auctionFormNo]').val();    //경매 폼 번호
		var auctionStart = $(this).parent().find('input[name=auctionStart]').val();      //시작일
		var auctionPrice = $(this).parent().children().find('input[name=auctionPrice]').val();      //입력한 가격
		var auctionEnd = $(this).parent().find('input[name=auctionEnd]').val();     	 //종료일
		var auctionProduct = $(this).parent().find('input[name=auctionProduct]').val();  //상품
		var farmNo = $(this).parent().find('input[name=farmNo]').val();     			 //농가번호
		var currentPrice = $(this).parent().find('input[name=currentPrice]').val();      //현재 최저가
		
		console.log(currentPrice);
		console.log(auctionPrice);
		console.log(auctionCount1);
		console.log(auctionFormNo);
		console.log(auctionStart);
		console.log(auctionEnd);
		console.log(auctionProduct);
		
		//회원인지 유효성 검사
		if(farmNo==''){
			alert('로그인 후  이용 가능합니다.');
			return false;
		}
		//수량, 최저가 유효성 검사
		if(auctionCount1<0 || auctionCount1==0){
			alert('최소 판매 수량 1개 이상 입력해주세요.');
			return false;
		}
		if(auctionPrice>currentPrice || auctionPrice==currentPrice){
			alert('현재 최저가보다 낮은 금액을 입력해주세요.');
			return false;
		}
		
		if(confirm("최저가 입찰하시겠습니까?")){
			$.ajax({
				url : "/auction/auctionInputPrice.do",
				data : {"auctionPrice" : auctionPrice,
						"auctionCount1" : auctionCount1,
						"auctionStart" : auctionStart,
						"auctionEnd" : auctionEnd,
						"farmNo" : farmNo,
						"auctionFormNo" : auctionFormNo,
						"auctionProduct" : auctionProduct,
						"currentPrice" : currentPrice },  
				type : "post",
				success : function(result){
					if(result=="true"){
						alert('최저가로 입찰되었습니다.');
						currentPrice.html(auctionPrice);
					}else{
						alert('잘못된 접근입니다');
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			});
		};
	});

	
	//남은 시간 카운트 다운
	$(function(){
		const offset = new Date().getTimezoneOffset() * 60000;
		var date = new Date();
		$.each($(".endDate"),function(index, item){
			var ele = $(this);
			var date3 = new Date($(item).html());
			date3.setDate(date3.getDate()+1);
			date3.setHours(date3.getHours()-9);
			var currentTime = date.getTime();
			var endTime = date3.getTime();
			if(endTime-currentTime>0){
				var interval = endTime-currentTime;
				
				setInterval(function(){
					interval-=1000;
					var remainingDays = parseInt(interval/(1000*60*60*24));
					var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
					var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
					var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
					$('.remainTime').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
				},1000);
				
			}else{
				ele.parents('table').find('.remainTime').html('마감되었습니다.');
			}
		});
});
	</script>





</body>
</html>