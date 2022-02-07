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
<title>주문</title>
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
	height: 310px;
}
#content {
	width: 100%;
	height: 110vh;
	overflow: hidden;
	position: relative;
}

#leftSpace-left {
	width: 15%;
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
	margin-left: 37.7%;
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
#main2 {
    width: 27%;
    height: 500px;
    float: left;
    margin-left: 150px;
}

#main3 {
    width: 22%;
    height: 320px;
    float: left;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    background-color: white;
}

#td-1 {
    line-height: 50px;
    width: 380px;
    border: 1px solid #E9E9E9;
    font-size: 14px;
    box-shadow: 5px 5px 5px #E9E9E9;
    background-color: #EEF3EE;
}

#customer {
    display: block;
    float: left;
    margin-left: 15px;
    margin-right: 130px;
    font-weight: bold;
}

#customer-name {
    display: block;
    float: left;
    margin-left: 20px;
}

#main2-1 {
    width: 380px;
    height: 315px;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    margin-top: 10px;
}

.address-box {
    width: 100%;
    height: 50px;
}

#customer-addr {
    display: block;
    font-size: 14px;
    margin-left: 15px;
    font-weight: bold;
    margin-top: 20px;
}

.name {
    width: 30%;
    height: 100%;
    float: left;
}

.name-box {
    width: 69%;
    height: 100%;
    float: left;

}

.star {
    display: block;
    float: left;
    margin-left: 15px;
    margin-top: 15px;
}

.name-span {
    font-size: 14px;
    display: block;
    margin-left: 5px;
    margin-top: 15px;
    float: left;
}

.name-input {
    width: 97%;
    height: 75%;
    margin-top: 5px;
    border: 2px solid #E9E9E9;
    border-radius: 3px;
}

.addr-box {
    width: 30%;
    height: 75%;
    margin-top: 5px;
    border: 2px solid #E9E9E9;
    border-radius: 3px;
    margin-left: 6px;
}

#main2-2 {
    width: 380px;
    height: 205px;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    margin-top: 10px;
}

.farm-box {
    width: 100%;
    height: 50px;
    background-color: #EEF3EE;
}

.farm-name {
    display: block;
    font-size: 14px;
    margin-left: 15px;
    font-weight: bold;
    height: 100%;
    line-height: 50px;
}

.product-span {
    font-size: 14px;
    display: block;
    float: left;
    margin-left: 15px;
    margin-top: 15px;
    margin-right: 10px;
}

.count-span {
    font-size: 14px;
    display: block;
    float: left;
    margin-top: 15px;
}

.price-span {
    font-size: 14px;
    display: block;
    float: left;
    margin-top: 15px;
    margin-left: 225px;
    font-weight: bold;
}

.mount-span {
    font-size: 14px;
    display: block;
    float: left;
    margin-top: 15px;
    margin-left: 275px;
    font-weight: bold;
}

.pay-span {
    font-size: 15px;
    display: block;
    margin-top: 15px;
    font-weight: bold;
    text-align: center;
}

.pay-box {
    width: 80%;
    height: 35px;
    margin: 0 auto;
    border-bottom: 2px solid #3BBD5A;
}

.payment-box {
    width: 80%;
    height: 60px;
    margin: 0 auto;
    border-bottom: 2px solid #3BBD5A;
}

.payment-span {
    line-height: 30px;
    font-size: 14px;
    display: block;
    float: left;
    margin-top: 17px;
    margin-left: 85px;
    font-weight: bold;
}

.payspan {
    line-height: 30px;
    font-size: 14px;
    display: block;
    float: left;
    margin-top: 17px;
    margin-left: 5px;
}

.terms {
    width: 80%;
    height: 60px;
    margin: 0 auto;
    border: none;
    background-color: #F2F2F2;
    overflow: auto;
}

.terms-text {
    width: 80%;
    height: 30px;
    margin: 25px 0 0 38px;
    font-size: 13px;
    font-family: 'Nanum Gothic', sans-serif;
    color: #707070;
}
.terms-box{
    font-size: 12px;
    font-family: 'Nanum Gothic', sans-serif;
    color: #707070;
}
#pay-button{
    width: 80%;
    height: 35px;
    margin: 30px auto;
}
#payBtn{
    width: 90%;
    height: 100%;
    border-radius: 5px;
    background-color: #3BBD5A;
    border: none;
    color: white;
    font-size: 14px;
    font-family: 'NanumSquare';
    margin-left: 13px;
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
					<span>주문하기</span>
				</div>
			</div>
			<div id="leftSpace-footer"></div>
			 <div id="main2">
                 <form>
                     <table>
                         <tr>
                             <td id="td-1">
                             <span id="customer">주문고객</span>
                             <span id="customer-name">이현아(010-8910-3649)</span>
                             </td>
                         </tr>
                         <!--구매 로직-->
                         <tr>
                             <td>
                                 <div id="main2-1">
                                     <div class="farm-box">
                                         <span class="farm-name">주소 (배송지)</span>
                                     </div>
                                     <div class="address-box">
                                         <div class="name"><span class="star" style="color: darksalmon">*</span>
                                         <span class="name-span">받는분</span></div>
                                         <div class="name-box">
                                             <input type="text" name="userName" class="name-input" value="이현아" />
                                         </div>

                                         <div class="name"><span class="star" style="color: darksalmon">*</span>
                                         <span class="name-span">전화번호</span></div>
                                         <div class="name-box">
                                             <input type="text" name="userPhone" class="name-input" value="01011112222" />
                                         </div>

                                         <div class="name"><span class="star" style="color: darksalmon">*</span>
                                         <span class="name-span">주소</span></div>
                                         <div class="name-box">
                                             <input type="text" name="userPhone" class="addr-box" disabled="true" />
                                             <input type="button" class="addr-box" value="주소찾기" />
                                         </div>

                                         <div class="name"></div>
                                         <div class="name-box">
                                             <input type="text" name="addressMain" class="name-input" value="경기도 고양시 일산서구 일현로 120" />
                                         </div>

                                         <div class="name"></div>
                                         <div class="name-box">
                                             <input type="text" name="addressDetail" class="name-input" value="606동 301호" />
                                         </div>
                                     </div>
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <div id="main2-2">
                                     <div class="farm-box">
                                         <p class="farm-name">모닝팜</p>
                                         <div class="address-box">
                                             <span class="product-span">햇터 곶감</span><span class="count-span">1kg</span>
                                         </div>
                                         <div class="address-box">
                                             <span class="product-span">수량 : </span><span class="mount-span">1 개</span>
                                         </div>
                                         <div class="address-box">
                                             <span class="product-span">총 금액 : </span><span class="price-span">25000 원</span>
                                         </div>
                                     </div>
                                 </div>
                             </td>
                         </tr>
                     </table>
                 </form>
               </div>
               <div id="main3">
                   <tr>
                       <div class="pay-box">
                           <span class="pay-span">결제정보</span>
                       </div>
                       <div class="payment-box">
                           <span class="payspan">최종 결제 금액 </span><span class="payment-span">25000 원</span>
                       </div>
                       <p class="terms-text">결제 시 개인정보 제공에 동의합니다.</p>
                       <div class="terms">
                           <p class="terms-box" style="padding: 10px">
                                                                         ‣ 목적 : 판매자와 구매자 사이의 원활한 거래 진행, 상품의 배송을 위한 배송지 확인, 고객상담 및 불만처리 등
						       ‣ 정보 : 주문자 정보(성명, 연락처), 수령인 정보(성명, 연락처, 주소)
						       ‣ 보유기간 : 발송완료 후 15일
						     아이이디어스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 아이디어스는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
						     고객님께서는 개인정보 제공에 대하여 동의를 거부하실 수 있으나, 거부 시 상품 구매가 어렵습니다.
                           </p>
                            </div>
                       <div id="pay-button">
                           <input type="button" id="payBtn" value="51200원 카드결제"/>
                       </div>
                    </tr>
               </div>
            </div>
         </div>
	</div>
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
</div>

	<script>
	

	</script>





</body>
</html>