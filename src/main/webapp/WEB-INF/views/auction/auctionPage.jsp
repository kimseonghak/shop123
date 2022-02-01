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
<style>
<
link
 
rel
="preconnect"href="https
:
//fonts
.googleapis
.com
"
>
<
link
 
rel
="preconnect"href="https
:
//fonts
.gstatic
.com
"crossorigin
>
<
link
 
href
="https
:
//fonts
.googleapis
.com
/css2?family=Atkinson
+
Hyperlegible
:ital
@1&family=Lobster&family=Nanum
+
Gothic
&family=Nanum
+
Myeongjo
:wght
@700&family=Noto
+
Sans
+
KR
:wght
@700&family=Pacifico&display=swap"rel="stylesheet"
>
 @charset "UTF-8";

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

.box1 {
	width: 15%;
	height: 100%;
	float: left;
}

#main {
	width: 70%;
	height: 100%;
	float: left;
}

#box2 {
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

#box3 {
	width: 100%;
	height: 70px;
}

.auction-box {
	width: 100%;
	height: 365px;
	display: flex;
	flex-direction: row;
	justify-content :center;
	gap: 120px;
}

#box4 {
	width: 100%;
	height: 184px;
}

.high {
	width: 130%;
	height: 20%;
	border-radius: 10px 10px 0 0;
	background-color: #3BBD5A;
}

.row {
	width: 130%;
	height: 79.9%;
	border-radius: 0 0 10px 10px;
	background-color: #E4FFF8;
}

.row-1 {
	width: 100%;
	height: 79.9%;
	border-radius: 0 0 10px 10px;
	background-color: #E4FFF8;
}

#high-1 {
	width: 100%;
	height: 40%;
}

#high-1>span {
	font-size: 16px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	height: 100%;
	display: block;
	margin-left: 10px;
	line-height: 30px;
}

#high-2 {
	width: 100%;
	height: 59%;
}

#high-2>span {
	font-size: 25px;
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-weight: bold;
	display: block;
	text-align: center;
	margin-top: -5px;
}

.table {
	font-size: 16px;
	font-family: 'NanumSquare';
	margin: 0 auto;
	line-height: 36px;
}

.info {
	text-align: center;
}

.data {
	text-align: center;
}

.data1 {
	text-align: center;
}

.input {
	text-align: center;
	line-height: 60px;
}

.center {
	text-align: center;
}
.length{
	width : 150px;
}
.text{
	font-weight: bold;
}

#line {
	line-height: 30px;
	color: #E4FFF8;
}

#btn {
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
	margin-top: -242px;
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

		<div id="box"></div>
		<div id="content">
			<div class="box1"></div>
			<div id="main">
				<div id="box2"></div>
				<div id="subject-box">
					<div id="subject">
						<span>이달의 경매 현황</span>
					</div>
				</div>
				<div id="box3"></div>

				<div class="test">
					<div class="auction-box">
					
					
					<jsp:useBean id="now" class="java.util.Date" />

					<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="today" />  
						
					


				
						<c:choose>
							<c:when test="${!requestScope.list.isEmpty() }">
								<c:forEach items="${requestScope.list }" var="auc" varStatus="i">
									
									<div>
										<div class="high">
											<!-- 경매 폼 로직-->
											<div id="high-1">
												<span>경매 중</span>
											</div>
											<div id="high-2">
												<span>${auc.auctionProduct }</span>
											</div>
										</div>
										<div class="row">
											<!-- 경매 폼 로직-->
											<form>
												<table class="table">
													<tr>
														<td colspan="2" id="line">ss</td>
													</tr>
								
													<tr>
														<td class="center">시작일 :</td>
														<td class="data length">${auc.auctionStart }</td>
													</tr>
													<tr>
														<td class="center">종료일 :</td>
														<td class="data1 length">${auc.auctionEnd }</td>
													</tr>
													
													<tr>
														<td class="center">남은 시간 :</td>
														<td class="data1 length text" style="color: #FE0011"><span class="count"></span> </td>
													</tr>
													<tr>
														<td class="center">현재 수량 :</td>
														<td class="data length text" style="color: #009A41">${auc.auctionCount1 }</td>
													</tr>
													<tr>
														<td class="center">현재 최저가 :</td>
														<td class="data length text" style="color: #009A41">${auc.auctionPrice }원</td>
													</tr>
													<tr>
														<td colspan="2" class="info"><input type="button"
															style="color: white" id="btn" value="입찰하기" /></td>
													</tr>
												</table>
											</form>
										</div>
									</div>
								
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div id="box4"></div>
		</div>
		<div class="box1"></div>
		<c:import url="/WEB-INF/views/commons/footer.jsp" />
	</div>
	

<script>
	function counter(){
		
		var startDay = $('.data').html();
		var year = ""+startDay.substring(0,4);
		var mon = ""+startDay.substring(5,7)-1;
		var day = ""+startDay.substring(8,10);
		
		
		var endDay = $('.data1').html();
		var endYear = ""+endDay.substring(0,4);
		var endMon = ""+endDay.substring(5,7)-1;
		var endDay = ""+endDay.substring(8,10);
		var dDay = new Date(endYear,endMon,endDay).getTime();
		
		var today_day = new Date().getDate();
		var today_month = new Date().getMonth();
		var today_year = new Date().getFullYear();
	
		
			function timer(){
		
				var now = new Date(); //현재 날짜 가져오기
				var distance = dDay - now;
				
				var d = Math.floor(distance / (1000 * 60 * 60 * 24));
				var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
				var s = Math.floor((distance % (1000 * 60)) / 1000);
				var view = '';
				if(s < 10){
					s = '0'+s;
				}
				if (distance<0) {
					$('.count').html('마감되었습니다.');
				} else {
					if (d>0) {
						view = view+d+'일 ';
					}
					if (h>0) {
						view = view+h+'시간 ';
					}
					if (m>0) {
						view = view+m+'분 ';
					}
					$('.count').html(view+s+'초');
					
				}
				
			}
			
		if(day==today_day&&mon==today_month&&year==today_year){
			
			setInterval(timer,1000);
		}else{
			$('#count').html('경매 준비중입니다.');
		}
		
		
	}
	counter();
	
	//-----------------------------> 입찰하기 누를 시 window.open
	
	
	$('#btn').click(function(){
		
		var url = window.open("/auction/auctionWindow.do","width=430px, height=455px");
		
		$.ajax({
			url : url,
			data : {},
			type : "post",
			success : function(result){
				if(result=="true"){
					alert('비밀번호 변경 성공');
				}else{
					alert('비밀번호 변경 실패-기존 비밀번호를 확인해주세요');
				}
				$('#pass>input').val(''); //div(#pass) 안에 input 태그들의 값을 비워라
			},
			error : function(){
				console.log('ajax 통신 실패');
			}
			
		});
	});
	
</script>
	
	
	
	
	
</body>
</html>