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
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<style>
#wrap {
	width: 100%;
	margin: 0 auto;
}

/* 콘텐츠 */
#content {
	width: 100%;
	height: 1000px;
	background-color: #fafafa;
}

.leftSpace-left {
	width: 15%;
	height: 100%;
	float: left;
}

#main {
	width: 70%;
	height: 100%;
	float: left;
}

#leftSpace-header {
	width: 100%;
	height: 295px;
}

#subject-box {
	width: 100%;
	height: 59px;
}

#subject {
	width: 220px;
	height: 37px;
	margin-top: 10px;
	margin-left: 43%;
}

#subject>span {
	font-size: 28px;
	font-family: 'NanumSquare';
	color: #3BBD5A;
	font-weight: bold;
}

#leftSpace-footer {
	width: 100%;
	height: 70px;
}

.auction-box {
	width: 100%;
	height: 365px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	gap: 120px;
}

#box4 {
	width: 100%;
	height: 184px;
}

.auctionStatus-box {
	width: 130%;
	height: 20%;
	border-radius: 10px 10px 0 0;
	background-color: #3BBD5A;
}

.auction-info {
	width: 130%;
	height: 79.9%;
	border-radius: 0 0 10px 10px;
	background-color: #E4FFF8;
}

#auctionStatus {
	width: 100%;
	height: 40%;
}

#auctionStatus>span {
	font-size: 16px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	height: 100%;
	display: block;
	margin-left: 10px;
	line-height: 30px;
}

#auctionProduct {
	width: 100%;
	height: 59%;
}

#auctionProduct>span {
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-weight: bold;
	display: block;
	text-align: center;
	margin-top: -5px;
}

.auctionTable {
	font-size: 16px;
	font-family: 'NanumSquare';
	margin: 0 auto;
	line-height: 36px;
}

.input {
	text-align: center;
	line-height: 60px;
}

.textAlign-center {
	text-align: center;
}

.fontWeight {
	font-weight: bold;
}
.tdLength{
	width : 170px;
}


.auctionNo {
	line-height: 30px;
	color: #E4FFF8;
}

.btn {
	display: inline-block;
	position: relative;
	height: 37px;
	width: 140px;
	border-radius: 10px;
	background-color: #3BBD5A;
	border: none;
	font-size: 17px;
	top: 10px;
}

.block {
	width: 100%;
	height: 100%;
	background-color: black;
	margin-top: -247px;
	border-radius: 0 0 10px 10px;
	opacity: 0.65;
}

.block>span {
	display: block;
	line-height: 270px;
	text-align: center;
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
}
</style>
</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/commons/header.jsp" />

		<div id="leftSpace-top"></div>
		<div id="content">
			<div class="leftSpace-left"></div>
			<div id="main">
				<div id="leftSpace-header"></div>
				<div id="subject-box">
					<div id="subject">
						<span>이달의 경매 현황</span>
					</div>
				</div>
				<div id="leftSpace-footer"></div>
					<div class="auction-box">

					<%--경매 1번 폼 경매 중이 아닌 경우 --%>
					<jsp:useBean id="toDay" class="java.util.Date" />
					<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today" />

						<c:choose>
							<c:when test="${map.au1.auctionStart>today }">
									<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 예정</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au1.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au1.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au1.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au1.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span>-</span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" disabled="true" class="btn" value="입찰예정" /></td>
													</tr>
												</table>
											</form>
											<div class="block">
												<span>경매 예정</span>
											</div>
										</div>
									</div>
							</c:when>
							
						<%--경매 1번 폼 경매 중인 경우 --%>
							<c:otherwise>
								<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 중</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au1.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au1.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au1.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au1.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span
															class="remainTime"></span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au1.auctionCount1 }</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au1.auctionPrice }원</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" class="btn" data="1" value="입찰하기" /></td>
													</tr>
												</table>
											</form>
										</div>
									</div>
							</c:otherwise>
						</c:choose>
						
						<%--경매 2번 폼 경매 중이 아닌 경우 --%>
						<c:choose>
							<c:when test="${map.au2.auctionStart>today }">
									<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 예정</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au2.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au2.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au2.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au2.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span>-</span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" disabled="true" class="btn" value="입찰예정" /></td>
													</tr>
												</table>
											</form>
											<div class="block">
												<span>경매 예정</span>
											</div>
										</div>
									</div>
							</c:when>
							
						<%--경매 2번 폼 경매 중인 경우 --%>
							<c:otherwise>
								<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 중</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au2.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au2.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au2.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au2.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span
															class="remainTime"></span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au2.auctionCount1 }</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au2.auctionPrice }원</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" class="btn" data="2" value="입찰하기" /></td>
													</tr>
												</table>
											</form>
										</div>
									</div>
							</c:otherwise>
						</c:choose>
						
						<%--경매 3번 폼 경매 중이 아닌 경우 --%>
						<c:choose>
							<c:when test="${map.au3.auctionStart>today }">
									<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 예정</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au3.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au3.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au3.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au3.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span>-</span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">-</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" disabled="true" class="btn" value="입찰예정" /></td>
													</tr>
												</table>
											</form>
											<div class="block">
												<span>경매 예정</span>
											</div>
										</div>
									</div>
							</c:when>
							
						<%--경매 3번 폼 경매 중인 경우 --%>
							<c:otherwise>
								<div>
										<div class="auctionStatus-box">
											<!-- 경매 폼 로직-->
											<div id="auctionStatus">
												<span>경매 중</span>
											</div>
											<div id="auctionProduct">
												<span>${map.au3.auctionProduct }</span>
											</div>
										</div>
										<div class="auction-info">
											<!-- 경매 폼 로직-->
											<form>
												<table class="auctionTable">
													<tr>
														<td colspan="2" class="auctionNo">${map.au3.auctionNo }</td>
													</tr>

													<tr>
														<td class="textAlign-center">시작일 :</td>
														<td class="textAlign-center startDate">${map.au3.auctionStart }</td>
													</tr>
													<tr>
														<td>종료일 :</td>
														<td><div class="tdLength"><span class="endDate">${map.au3.auctionEnd  }</span>  23:59:59</div></td>
													</tr>

													<tr>
														<td class="textAlign-center">남은 시간 :</td>
														<td class="textAlign-center fontWeight" style="color: #FE0011"><span
															class="remainTime"></span></td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 수량 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au3.auctionCount1 }</td>
													</tr>
													<tr>
														<td class="textAlign-center">현재 최저가 :</td>
														<td class="textAlign-center fontWeight" style="color: #009A41">${map.au3.auctionPrice }원</td>
													</tr>
													<tr>
														<td colspan="2" class="textAlign-center"><input type="button"
															style="color: white" class="btn" data="3" value="입찰하기" /></td>
													</tr>
												</table>
											</form>
										</div>
									</div>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
			<div id="box4"></div>
		</div>
		<div class="leftSpace-left"></div>
		<c:import url="/WEB-INF/views/commons/footer.jsp" />
	</div>


	<script>
	
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
					ele.parents('table').find('.remainTime').html(remainingDays+" : "+remainingHours+" : "+remainingMins+" : "+remainingSec);
				},1000);
				
			}else{
				
			}
		});
});

	//입찰하기 window.open
		$('.btn').click(function(){
			
			var auctionFormNo = $(this).attr('data');
			window.open("/auction/auctionWindow.do?auctionFormNo="+auctionFormNo,"_blank","width=430px, height=305px");
			
		});
	
	
	</script>





</body>
</html>