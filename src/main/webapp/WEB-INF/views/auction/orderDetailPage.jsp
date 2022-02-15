<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<style>
wrap {
	width: 100%;
	margin: 0 auto;
}

#content {
	width: 100%;
	height: 160vh;
}
.background-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-color {
	margin: 0 auto;
	width: 58vw;
	height: 90vh;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 19.77%;
	box-shadow: 3px 3px 10px #aeaeae;
}
.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 4vmin;
	font-weight: bold;
	text-align: center;
	color: #3BBD5A;
}

.mypage-main {
	width: 100%;
	height: 11.6%;
	border-bottom: 0.5px solid #ABABAB; 
}
.font {
    font-size: 2vmin;
}
#orderList-main{
	width : 100%;
	height: 80%;
	margin-top: 5%;
}
.form{
	margin-bottom: 5.5%;
}
#table {
    font-family: 'NanumSquare';
    margin: 0 auto;
	width:65%;
	border: 0.5px solid rgba(213,208,208,0.7);
}
.background {
    background-color: #D5D0D0;
    opacity: 0.9;
}
.data {
    line-height: 6vh;
    margin-left: 20px;
    width: 50%;
    padding-left: 4%;
}
.vertical-align {
    vertical-align: middle;
    width: 17%;
}
.background-1 {
    background-color: white;
}

.border {
    border: 0.5px solid rgba(213,208,208,0.7);
}

.text-align{
	text-align: center;
}
.width{
	width: 30%;
}
.delivery{
	width : 35%;
}
#memberInfo-box{
	width:65%;
	height: 60%;
	margin : 0 auto;
	border-top: 2px solid #3BBD5A;
}
#delivery-box{
	width: 100%;
	height: 20%;
	padding-top: 6%;
}
#deliveryInfo{
	width: 100%;
	height: 95%;
	padding-top : 5px;
}
.span-box{
	display : block;
	float : left;
	width: 13%;
	height: 10%;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	margin-bottom: 3%;
	padding-left: 8%;
	margin-top: 1.8%;
	font-size: 2.2vmin;
}
.input-box{
	width: 68%;
	height: 10%;
	color: #2A2A2A;
	padding: 18px;
	border: 0.5px solid #E5E5E5;
	font-family: 'Nanum Gothic', sans-serif;
	margin-bottom: 4.8%;
	margin-left: 5%;
	font-size: 2vmin;
}
#orderNo-td{
	text-align: right;
	padding-right: 4%;
}
</style>
</head>
<body>
<div id="wrap">
		<c:import url="/WEB-INF/views/commons/header.jsp" />
		<div id="leftSpace-top"></div>
		<div id="content">
			<div class="background-box">
				<div class="box-color">
					<div class="mypage-main">
						<p class="title">주문 상세</p>
                    </div>
					<div id="orderList-main">
						<form class="form">
							<table id="table">
							<tr>
                                <td colspan="4" class="data background font">
                                	${pur.purchaseDate }</td>
                                <td colspan="2" class="center background font" id="orderNo-td">
                                	 <span id="align-right">${pur.orderNo } </span>
                                </td>
                            </tr>
                            <tr class="white">
                                <td colspan="1" class="data border font width">
                                	${pur.productName }
                                </td>
                                <td rowspan="2" class="center border vertical-align font text-align">${pur.payAmount }원</td>
                                <td rowspan="2" class="center border vertical-align font text-align">${pur.farmName }</td>
                                <td colspan="2" class="center border font text-align delivery">${pur.deliveryCompany }  &nbsp;&nbsp;&nbsp;&nbsp;${pur.deliveryNo }</td>
                            </tr>
                            <tr class="white">
                                <td colspan="1" class="data border font width">
                                	${pur.productCount }&nbsp; 상자
                                </td>
                                 <c:choose>
	                                <c:when test="${String.valueOf(pur.refundYN) eq 'N'}">
	                                <td colspan="2" class="center border font text-align delivery">
		                                <span class="dName">${pur.dName }</span>
	                                </td>
		                            </c:when>
		                            <c:otherwise>
		                            <td colspan="2" class="center border font text-align delivery">
		                               <span class="dName">환불완료</span>
	                                </td>
		                            </c:otherwise>
		                            </c:choose>
                            </tr>
                          
							</table>
						</form>
						<div id="memberInfo-box">
							<div id="delivery-box">
								<p class="title">배송지 정보</p>
							</div>
							<div id="deliveryInfo">
                            	<span class="span-box">이름</span>
                            	<input type="text" class="input-box" disabled="true" value="${pur.recipient }"/>
                                
                                <span class="span-box">연락처</span>
                                <input type="text" class="input-box" disabled="true" value="${pur.phone }"/>
                                
                                <span class="span-box">주소</span>
                                <input type="text" class="input-box" disabled="true" value="${pur.address1 }"/>
                               
                                <span class="span-box">상세 주소</span>
                                <input type="text" class="input-box" disabled="true" value="${pur.address2 }"/> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
</div>
</body>
</html>