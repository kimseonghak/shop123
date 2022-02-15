<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!--구글 아이콘-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<style>
#wrap {
	width: 100%;
	margin: 0 auto;
}

#content {
	width: 100%;
	height: 210vh;
}
.background-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-color {
	margin: 0 auto;
	width: 58vw;
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
	height: 5%;
	border-bottom: 0.5px solid #ABABAB; 
}
#dateSelect-btn{
	width: 100%;
	height: 4%;
	padding-top : 2.5%;
	padding-left : 10%;
	font-size: 2vmin;
}
#mypageBtn{
	width: 10.5%;
    height: 55%;
	color : white;
    border: none;
    border-radius: 5px;
    background-color: #3BBD5A;
    text-align: center;
    cursor:pointer;
    font-size: 2vmin;
    margin-right: 46.5%;
}
#option {
    width: 10.5%;
    height: 55%;
    background-color: white;
    border: 2px solid #3BBD5A;
    margin-right : 5px;
    border-radius: 5px;
    text-align: center;
    cursor:pointer;
    font-size: 2vmin;
}
#optionBtn{
	width: 10.5%;
    height: 55%;
	color : white;
    border: none;
    border-radius: 5px;
    background-color: #3BBD5A;
    text-align: center;
    cursor:pointer;
    font-size: 2vmin;
}

#orderList-main{
	width : 100%;
}

#table {
    font-size: 1.9vmin;
    font-family: 'NanumSquare';
    margin: 0 auto;
    line-height: 100%;
	width: 65%;
	margin-bottom: 3.5%;
	
}
.background {
    background-color: #D5D0D0;
    opacity: 0.9;
}
.data {
    line-height: 5.5vh;
    margin-left: 20px;
    width: 50%;
    padding-left: 4%;
}
.vertical-align {
    vertical-align: middle;
    width: 20%;
}
.background-1 {
    background-color: white;
}

.border {
    border: 0.5px solid rgba(213,208,208,0.7);
}
#box1{
	width: 70%;
	height: 100%;
	float: left;
	border: 1px solid black;
}
#box2{
	width: 28%;
	height: 100%;
	float: left;
}
#orderNo-td{
	text-align: right;
	padding-left: 4.5%;
}
#orderNo{
	width : 100%;
    color: black;
	height: 100%;
	border: none;
	background-color: #D5D0D0;
	cursor: pointer;
	font-size: 2vmin;
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
#direction.img{
	position: absolute;
	top: 20px;
}
#navi{
	padding-top : 15px;
	width: 100%;
	height: 4%;
	text-align: center;
}
.naviArrow{
	text-decoration: none;
	display : inline-block;
	color: black;
	border : 1px solid #3BBD5A;
	margin : 2px;
	width : 25px;
	height: 25px;
	font-weight: bolder;
	opacity: 0.3;
}
#currentNavi{
	text-decoration: none;
	display:inline-block;
	color: white;
	background-color:#3BBD5A;
	border : 1px solid #3BBD5A;
	width : 25px;
	height: 25px;
	margin : 1px;
	font-weight: bolder;
}
.otherNavi{
	text-decoration: none;
	display:inline-block;
	color: #3BBD5A;
	border : 1px solid #3BBD5A;
	width : 25px;
	height: 25px;
	margin : 1px;
	font-weight: bolder;
}
.otherNavi:hover{
	color: white;
	background-color:#3BBD5A;
	opacity: 0.4;
}
#thTr th{
	border-top: 1px solid #3BBD5A;
	border-bottom: 1px solid #3BBD5A;
}
#infoEmptyBox{
	width: 100%;
	height: 20%;
	margin-top : 15%;
	text-align: center;
	font-size: 3.5vmin;
	font-family: 'NanumSquare';
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
						<p class="title">주문 목록</p>
                    </div>
				 <form action="/auction/orderListPage.do" method="get">
				 	<input type="hidden" name="userNo" value="${sessionScope.member.userNo }"/>
					<div id="dateSelect-btn">
						<input type="button" onclick="myPage()" id="mypageBtn" value="목록"/>
						<select name='type' id="option">
                           <option value='2022' >2022</option>
                           <option value='2021' >2021</option>
                           <option value='2020' >2020</option>
                           <option value='2019' >2019</option>
                           <option value='2018'>2018</option>
                        </select>
                        <input type="submit" id="optionBtn" value="조회">
					</div>
				 </form>
				 <form action="/auction/orderDetailPage.do" method="post">
					<div id="orderList-main">
					<c:choose>
					<c:when test="${!map.list.isEmpty() }">
					<c:forEach items="${map.list }" var="pur">
							<table id="table">
								<tr>
	                                <td colspan="4" class="data background">
	                                	${pur.purchaseDate }</td>
	                                <td colspan="2" class="center background font" id="orderNo-td">
	                                	<input type="submit" id="orderNo" name="orderNo" class="text-align" value="${pur.orderNo }">
	                                </td>
	                            </tr>
	                            <tr class="white">
	                                <td colspan="1" class="data border width">
	                                	${pur.productName }
	                                </td>
	                                <td rowspan="2" class="center border vertical-align font text-align">${pur.payAmount }원</td>
	                                <td rowspan="2" class="center border vertical-align font text-align">${pur.farmName }</td>
	                                <td colspan="2" class="center border font text-align delivery">${pur.deliveryCompany }  &nbsp;&nbsp;&nbsp;&nbsp;${pur.deliveryNo }</td>
	                            </tr>
	                            <tr class="white">
	                            
	                                <td colspan="1" class="data border width">
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
					</c:forEach>
					</c:when>
					<c:otherwise>
					<div id="infoEmptyBox">
						주문 내역이 존재하지 않습니다.
					</div>
					</c:otherwise>
					</c:choose>
					</div>
				   </form>
				  <div id="navi">${map.pageNavi }</div>
				</div>
			  </div>
			</div>
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>  
</div>
<script>
//navi css
	$('.naviArrow').hover(function(){
		$(this).css('opacity','1');
		},function(){
			$(this).css('opacity','0.3');
		});
	$(function(){
		var currentPage = ${currentPage};
		if(currentPage<11){
			$('#prev').removeAttr('href');
			$('#prev').unbind('mouseenter mouseleave');
		}
	});
		
	});
	
	$('#mypageBtn').click(function(){
		
		location.replace('/memberMypage/memberMypageListPage.do');
	});

</script>
</body>
</html>