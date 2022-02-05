<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>123상회</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" type="text/css" href="/resources/main/main/css/index.css">

</head>
<body>
		
	<div id="warm">
		
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
		
			<div class="main">
				<div class="main-img">
					<img alt="메인사진" src="/resources/main/main/img/main1-1.jpg">
				</div>	
				<div class="main-text">
					<p>전국 산지의 제철 특산물,<br>
					농가에서 직접 배송받아 믿을 수 있는<br>
					123상회에서 만나보세요.</p>
				</div>
			</div>
			
			<div class="info">
				<div class="farm">
					<div class="farm-askarea">
						<p class="farm-asktext">사업자이신가요?</p>
					</div>
					<div class="farm-imgarea">
						<img alt="농가" src="/resources/main/main/img/farm.PNG">
					</div>
					<div class="farm-textarea">
						<p class="farm-text">간소화 된 유통을 통한 이익 창출<br>
						복잡한 절차 없이 손쉬운 판매<br>
						판매 경로의 다양성 확보</p>
					</div>
				</div>
				<div class="user">
					<div class="user-askarea">
						<p class="user-asktext">일반회원이신가요?</p>
					</div>
					<div class="user-imgarea">
						<img alt="소비자" src="/resources/main/main/img/user.PNG">
					</div>
					<div class="user-textarea">
						<p class="user-text">신선한 제철 상품의 구매<br>
						최저가 경매를 통해 저렴한 농산물 구매<br>
						농가와의 직접적인 소통</p>
					</div>
				</div>
				<div class="promotion-area">
					<button class="promotion-btn"><a href="">우리 농가 홍보하기 /제철 상품 홍보하기</a></button>
				</div>
				
			</div>
			
			<div>
				<div class="main2">
					<div class="main2-img">
						<img alt="메인2" src="/resources/main/main/img/main2-1.jpg">
					</div>
					<div class="main2-text">
						<p>판매자와 구매자를 동시에 만족시키는<br>
						최저가 '경매' 의 역발상</p>
					</div>
					<div class="auction-area">
						<button class="auction-btn"><a href="/auction/auctionPage.do">경매 확인하기</a></button>
					</div>
				</div>
			</div>
			
			<!-- 메인페이지 접속 시 count DB에 ++ 되는 ajax 로직 (결과값 무시)-->
			<!-- Spring 은 controller에서 리턴값을 적어줘야 404 오류가 뜨지 않음
			controller를 지나면서 자동으로 결과값을 만들어버리기 때문 -->
			<script>
				$(function(){
					$.get("/admin/countInput.do");
				});
			</script>
		
		</div>
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</body>
</html>