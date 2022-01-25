<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>123상회</title>

<style>

#content{
	width: 100%;
	margin: 0 auto;
}
.main {
	width: 100%;
	height: 100vh;
	overflow: hidden;
	position: relative;
}
.main-img {
	width: 100%;
}
.main-img>img {
	width: 110%;
	object-fit: cover;
	object-position: 0 170px;
}
.main-text {
	position: absolute;
	top: 40%;
	left: 5%;
	font-family: 'NanumSquare';
	font-size: 34px;
	font-weight: bold;
	line-height: 1.4;
}

.info {
	width: 72%;
	height: auto;
	overflow: hidden;
	margin: 0 auto;
	margin-top: 80px;
}
.farm {
	width: 45%;
	height: 40vw;
	float: left;
	border-radius: 20px;
	box-shadow: 3px 3px 10px #AEAEAE;
	margin-left: 10px;
}
.farm-askarea {
	width: 100%;
	height: 15%;
}
.farm-imgarea {
	width: 75%;
	height: 65%;
	margin: 0px auto;
}
 .farm-textarea {
 	width: 100%;
 	height: 20%;
 }
.farm-imgarea>img {
	width: 100%;
	object-fit: cover;
 }
 .farm-asktext {
 	font-family: 'NanumSquare';
	font-size: 34px;
	font-weight: bold;
	text-align: center;
	padding-top: 40px;
 }
 .farm-text {
  	font-family: 'NanumSquare';
	font-size: 24px;
	font-weight: bold;
	text-align: center;
	line-height: 1.7;
 }


.user {
	width: 45%;
	height: 40vw;
	float: right;
	border-radius: 20px;
	box-shadow: 3px 3px 10px #AEAEAE;
	margin-right: 10px;
}
.user-askarea {
	width: 100%;
	height: 15%;
}
.user-imgarea {
	width: 75%;
	height: 65%;
	margin: 0px auto;
}
 .user-textarea {
 	width: 100%;
 	height: 20%;
 }
.user-imgarea>img {
	width: 100%;
	object-fit: cover;
 }
 .user-asktext {
 	font-family: 'NanumSquare';
	font-size: 34px;
	font-weight: bold;
	text-align: center;
	padding-top: 40px;
 }
 .user-text {
  	font-family: 'NanumSquare';
	font-size: 24px;
	font-weight: bold;
	text-align: center;
	line-height: 1.7;
 }
 .promotion-area {
 	width: 100%;
 	height: 100px;
 	margin-top: 50px;
 	float: left;
 	text-align: center;
 }
 .promotion-btn {
	width: 400px;
    height: 80px;
    border: 0;
    border-radius: 20px;
    background-color: #3BBD5A;
    cursor: pointer;
    display: inline-block;
 }
.promotion-btn>a {
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-size: 20px;
}
 

.main2 {
	width: 100%;
	height: 82vh;
	overflow: hidden;
	position: relative;
}
.main2-img {
	width: 100%;
}
.main2-img>img {
	width: 100%;
	object-fit: cover;
}
.main2-text {
	position: absolute;
	bottom: 20%;
	right: 15%;
	font-family: 'NanumSquare';
	font-size: 34px;
	font-weight: bold;
	line-height: 1.4;
}
.main2-text>p {
	text-align: right;
}
.auction-area {
	position: absolute;
	bottom: 11%;
	right: 15%;
}
 .auction-btn {
	width: 170px;
    height: 60px;
    border: 0;
    border-radius: 20px;
    background-color: #3BBD5A;
    cursor: pointer;
    display: inline-block;
 }
 .auction-btn>a {
	color: #FFFFFF;
	font-family: 'NanumSquare';
	font-size: 20px;
}
</style>

</head>
<body>
		
		<div id="warm">
		
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		
		<div id="content">
		
			<div class="main">
				<div class="main-img">
					<img alt="메인사진" src="/resources/main/img/main1-1.jpg">
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
						<img alt="농가" src="/resources/main/img/farm.PNG">
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
						<img alt="소비자" src="/resources/main/img/user.PNG">
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
						<img alt="메인2" src="/resources/main/img/main2-1.jpg">
					</div>
					<div class="main2-text">
						<p>판매자와 구매자를 동시에 만족시키는<br>
						최저가 '경매' 의 역발상</p>
					</div>
					<div class="auction-area">
						<button class="auction-btn"><a href="">경매 확인하기</a></button>
					</div>
				</div>
			</div>
		
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
</body>
</html>