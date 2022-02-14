<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	
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

#subject-box {
	width: 100%;
	height: 8%;
	float: left;
}

#subject {
	width: 100%;
	height: 100%;
	text-align: center;
}

#subject>span {
	font-size: 3.9vmin;
	font-family: 'NanumSquare';
	color: #3BBD5A;
	font-weight: bold;
}

#leftSpace-footer {
	width: 84%;
	height: 70px;
	float: left;
}
#order-wrapBox {
    width: 50%;
    height: 100%;
    float: left;
    margin-left: 27%
}
#order-memberInfoBox{
	width : 53vh;
	height: 100%;
	float: left;
}
#order-payBox{
	width: 42vh;
	height: 100%;
	float: left;
	margin-left: 25px;
}

#payBox {
    width: 99%;
    height: 40%;;
    float: left;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    background-color: white;
}

#memberInfoBox {
    width: 99%;
    height : 6%;
    border: 1px solid #E9E9E9;
    font-size: 14px;
    box-shadow: 5px 5px 5px #E9E9E9;
    background-color: #EEF3EE;
}

#customer {
    display: block;
    float: left;
    font-weight: bold;
	margin: 15px 15px;
	margin-right: 37%;
	font-size: 2vmin;
}

#customer-name {
    display: block;
    float: left;
    margin-top: 4%;
    font-size: 2vmin;
}

#memberInputBox {
    width: 99%;
    height: 40%;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    margin-top: 2.5%;
}

.address-box {
    width: 100%;
    height: 16.3%;
}
.farmOrder-box {
    width: 100%;
    height: 23%;
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
    font-size: 2vmin;
    display: block;
    margin-left: 5px;
    margin-top: 15px;
    float: left;
}

.name-input {
    width: 97%;
    height: 75%;
    margin-top: 2.5%;
    border: 2px solid #E9E9E9;
    border-radius: 3px;
    padding-left: 5px;
}

.addr-box {
    width: 30%;
    height: 75%;
    margin-top: 5px;
    border: 2px solid #E9E9E9;
    border-radius: 3px;
    cursor:pointer;
}

#orderInfo {
    width: 99%;
    height: 23%;
    border: 1px solid #E9E9E9;
    box-shadow: 5px 5px 5px #E9E9E9;
    margin-top: 10px;
}

.farm-box {
    width: 100%;
    height: 25.5%;
    background-color: #EEF3EE;
}
.member-box{
	width: 100%;
    height: 15.5%;
    background-color: #EEF3EE;
}

.farm-name {
    display: block;
    font-size: 2vmin;
    margin-left: 15px;
    font-weight: bold;
    height: 100%;
    line-height: 50px;
    width: 40%;
    float: left;
}
.farm-nameBox {
    display: block;
    font-size: 2vmin;
    margin-left: 15px;
    font-weight: bold;
    height: 100%;
    line-height: 50px;
    width: 100%;
}
#checkbox{
	float: left;
}

.product-span {
    font-size: 2vmin;
    display: block;
    float: left;
    margin-left: 15px;
    margin-top: 15px;
    margin-right: 10px;
}

.count-span {
    font-size: 2vmin;
    display: block;
    float: left;
    margin-top: 15px;
}

.price-span {
    font-size: 2vmin;
    display: block;
    width : 72%;
    height : 100%;
    float: left;
    margin-top: 4%;
	text-align : right;
	padding-right : 2%;
    font-weight: bold;
}

.mount-span {
    font-size: 2vmin;
    display: block;
    float: left;
    margin-top: 4%;
    margin-left: 70%;
    font-weight: bold;
}

.pay-span {
    font-size: 2vmin;
    display: block;
    margin-top: 18px;
    font-weight: bold;
    text-align: center;
}

.pay-box {
    width: 80%;
    height: 11%;
    margin: 0 auto;
    border-bottom: 2px solid #3BBD5A;
}

.payment-box {
    width: 80%;
    height: 18%;
    margin: 0 auto;
    border-bottom: 2px solid #3BBD5A;
}

.payment-span {
    line-height: 30px;
    font-size: 2vmin;
    display: block;
    float: left;
    margin-top: 7%;
    width : 49%;
    padding-right : 1.5%; 	
    text-align : right;
    font-weight: bold;
}

.payspan {
    line-height: 30px;
    font-size: 2vmin;
    display: block;
    float: left;
    margin-top: 7%;
    margin-left: 5%;
}

.terms {
    width: 80%;
    height: 20%;
    margin: 0 auto;
    border: none;
    background-color: #F2F2F2;
    overflow: auto;
}

.terms-text {
    width: 80%;
    height: 10%;
    margin: 7% 0 0 17%;
    font-size: 1.8vmin;
    font-family: 'Nanum Gothic', sans-serif;
    color: #707070;
}
.terms-box{
    font-size: 1.7vmin;
    font-family: 'Nanum Gothic', sans-serif;
    color: #707070;
}
#pay-button{
    width: 80%;
    height: 12%;
    margin: 30px auto;
}
#payBtn{
    width: 46.5%;
    height: 100%;
    border-radius: 5px;
    background-color: #3BBD5A;
    border: none;
    color: white;
    font-size: 2vmin;
    font-family: 'NanumSquare';
	display: block;
	float: left;    
	margin-right: 15px;
	cursor:pointer;
	
}
#cancleBtn{
	width: 46.5%;
    height: 100%;
    border-radius: 5px;
    background-color: #ffff;
    border: 3px solid #3BBD5A;
    color: #3BBD5A;
    font-size: 2vmin;
    font-family: 'NanumSquare';
    display: block;
	float: left;    
	cursor:pointer;
}
#checkbox-box{
	width: 35%;
	height: 60%;
	float: left;
	font-family: 'NanumSquare';
	padding-top: 4.5%;
	padding-left: 18.8%;
	font-size: 1.9vmin;
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
					<span>주문하기</span>
				</div>
			</div>
			<div id="leftSpace-footer"></div>
			 <div id="order-wrapBox">
                <div id="order-memberInfoBox">
                	<div id="memberInfoBox">
                		<input type="hidden" name="userName" value="${requestScope.m.userName}"/>
                		<input type="hidden" name="userPhone" value="${requestScope.m.userPhone}"/>
                		<input type="hidden" name="addressMain" value="${requestScope.m.userAddressMain}"/>
                		<input type="hidden" name="addressSub" value="${requestScope.m.userAddressSub}"/>
                		
                		<span id="customer">주문고객</span>
                        <span id="customer-name">${requestScope.m.userName }&nbsp;( ${requestScope.m.userPhone } )</span>
                	</div>
                	
                	<div id="memberInputBox">
                        <div class="member-box">
                            <span class="farm-name">주소 (배송지)</span>
                            <div id="checkbox-box">
                            	<input type="checkbox" value="Y" id="checkbox"/>주문자 정보와 동일
                        	</div>
                        </div>
                        <div class="address-box">
                            <div class="name"><span class="star" style="color: darksalmon">*</span>
                            <span class="name-span">받는분</span></div>
                            <div class="name-box">
                                <input type="text" name="userName" class="name-input" id="name"/>
                            </div>

                            <div class="name"><span class="star" style="color: darksalmon">*</span>
                            <span class="name-span">전화번호</span></div>
                            <div class="name-box">
                                <input type="text" name="userPhone" class="name-input" id="phone"/>
                            </div>

                            <div class="name"><span class="star" style="color: darksalmon">*</span>
                            <span class="name-span">주소</span></div>
                            <div class="name-box">
                                <input type="text" name="userPhone" class="addr-box" disabled="true" />
                                <input type="button" class="addr-box" onclick="sample4_execDaumPostcode()" value="주소찾기" />
                            </div>

                            <div class="name"></div>
                            <div class="name-box">
                                <input type="text" name="addressMain" class="name-input address1" id="sample4_roadAddress"/>
                            </div>

                            <div class="name"></div>
                            <div class="name-box">
                                <input type="text" name="addressDetail" class="name-input" id="address2"/>
                            </div>
                        </div>
                   </div>
                   <div id="orderInfo">
                        <div class="farm-box">
                            <p class="farm-nameBox">${requestScope.f.farmName }</p>
                         </div>
                            <div class="farmOrder-box">
                                <span class="product-span" id="product">${requestScope.sf.auctionProduct }</span>
                            </div>
                            <div class="farmOrder-box">
                                <span class="product-span">수량 : </span><span class="mount-span">${requestScope.sf.auctionCount1 } 개</span>
                            </div>
                            <div class="farmOrder-box">
                                <span class="product-span">총 금액 : </span><span class="price-span totalMoney"></span>
                            </div>
                   </div>
               
               </div>
               <div id="order-payBox">
	               <div id="payBox">
	                      <div class="pay-box">
	                          <span class="pay-span">결제정보</span>
	                      </div>
	                      <div class="payment-box">
	                          <span class="payspan">최종 결제 금액 </span><span class="payment-span totalMoney"></span>
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
	                      	   <button id="payBtn" onclick="requestPay()">카드결제</button>
	                          <input type="button" id="cancleBtn" value="취소"/>
	                      </div>
					</div>
               </div>
             </div>
         </div>
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
</div>

<!-- 다음 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		
		            var roadAddr = data.roadAddress;
		            var extraRoadAddr = '';
		
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		           
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            
		            if(extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            document.getElementById("sample4_roadAddress").value = roadAddr;
		        
		        }
		    }).open();
		}


//
		$('#checkbox').click(function(){
			
			var name = $('input[name=userName]').val();
			var phone = $('input[name=userPhone]').val();
			var addressMain = $('input[name=addressMain]').val();
			var addressSub = $('input[name=addressSub]').val();
			
			if($(this).prop('checked')){
				$('#name').val(name);			
				$('#phone').val(phone);			
				$('.address1').val(addressMain);			
				$('#address2').val(addressSub);			
			}else{
				$('#name').val('');			
				$('#phone').val('');			
				$('.address1').val('');			
				$('#address2').val('');		
			}
		});

		
		
		var auctionPrice = ${requestScope.sf.auctionPrice };     
		var productCount = ${requestScope.sf.auctionCount1 };	 //수량
		var payAmount = auctionPrice * productCount;			 //총 금액
		//var payAmount = 100;
//총 금액 구해서 값 넣어주기
		$(function(){
				
			var totalMoney = $('.totalMoney').html(payAmount+" 원");
			
		});
		
//취소 버튼 누를 경우 구매 페이지로 이동
		$('#cancleBtn').click(function(){
			
		 	location.replace('/auction/auctionSalePage.do');
		})

	
//아임포트 API
        function requestPay() {
	
			var productCount = ${requestScope.sf.auctionCount1 };	 //수량    -> 총 금액 원래대로 바꿀 떄 삭제하기
			var productName = $('#product').html();					 //상품명
			var userNo = ${requestScope.m.userNo };					 //회원번호
			var farmNo = ${requestScope.f.farmNo };					 //농가번호
			var phone; 							 					 //폰번호
			var recipient;											 //받는 사람
			var address1;					 						 //메인 주소
			var address2;					 						 //서브 주소
			var orderNo = new Date().getTime();						 //주문번호
			var auctionNo = ${requestScope.sf.auctionNo}             //경매번호
			
			var payMethod = '';
		
			var IMP = window.IMP; // 생략 가능
	        IMP.init("imp95571012"); // 예: imp00000000
	
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param 자바스크립트 객체 key:value
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: orderNo,
                name: productName,
                amount: payAmount
                
                
            }, function(rsp) { // callback
            	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
           	        
           	        $.ajax({
           	            url: "/auction/orderPay.do", 
           	            method: "POST",
           	            data: {	"productCount": productCount,
           	               		"productName": productName,
           	               		"userNo" : userNo,
           	               		"farmNo" : farmNo,
           	               		"phone" : $('#phone').val(),
           	               		"address1" : $('.address1').val(),
           	               		"address2" : $('#address2').val(),
           	               		"payAmount" : payAmount,
           	               		"orderNo" : orderNo,
           	               		"payMethod" : rsp.pay_method,
           	               		"auctionNo" : auctionNo,
           	               		"recipient" : $('#name').val()
           	            },
           	            
           	     		success : function(result){
							if(result=="true"){
							
								alert('결제가 완료되었습니다.');
								location.href = "/auction/orderComplete.do"; 
							
							}else{
								
								alert('잘못된 접근입니다');
							}
						},
						error : function(){
							
							console.log('ajax 통신 실패');
						}
           	        })
           	      } else {
           	        alert( rsp.error_msg);
           	      }
            });
        }

    </script>




</body>
</html>