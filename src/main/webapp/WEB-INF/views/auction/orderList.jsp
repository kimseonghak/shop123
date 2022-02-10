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
	height: 190vh;
}
.background-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-color {
	margin: 200px auto;
	width: 58vw;
	height: 135vh;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 300px;
	box-shadow: 3px 3px 10px #aeaeae;
}
.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	color: #3BBD5A;
}
.btn-submit {
	width: 10%;
    height: 3.5vh;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 1.2vmin;
    border: none;
    border-radius: 18px;
    cursor: pointer;
    float: right;
    margin-right: 10px;
}
.mypage-main {
	width: 100%;
	height: 7%;
	border-bottom: 0.5px solid #ABABAB; 
}
#dateSelect-btn{
	width: 100%;
	height: 80px;
}
#recent {
    display: inline-block;
    position: relative;
    width: 90px;
    height: 30px;
    background-color: #3BBD5A;
    color: white;
    border: none;
    border-radius: 5px;
   	margin-left: 75%;
   	margin-top: 25px;
   	cursor:pointer;
}

#option {
    width: 90px;
    height: 30px;
    background-color: white;
    border: 2px solid #3BBD5A;
    border-radius: 5px;
    text-align: center;
    cursor:pointer;
}
.font {
    font-size: 13px;
}
#orderList-main{
	width : 100%;
	height: 700px;
}
.form{
	margin-bottom: 30px;
}
#table {
    font-size: 16px;
    font-family: 'NanumSquare';
    margin: 0 auto;
    line-height: 36px;
	width:600px;
}
.background {
    background-color: #D5D0D0;
    opacity: 0.9;
}
.data {
    line-height: 40px;
    margin-left: 20px;
    width: 50%;
    text-align: left;
}
.vertical-align {
    vertical-align: middle;
    width: 15%;
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
	padding-right: 25px;
}
#orderNo{
	width : 50px;
    color: black;
	height: 100%;
	
}
.text-align{
	text-align: center;
}

.width{
	width: 35%;
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
	height: 60px;
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
					<div id="dateSelect-btn">
						<input type="button" id="recent" class="font" onclick="" value="최근 6개월" />
						<select name='year' id="option">
                           <option value='2022' selected>2022</option>
                           <option value='2021'>2021</option>
                           <option value='2020'>2020</option>
                           <option value='2019'>2019</option>
                           <option value='2018'>2018</option>
                        </select>
					</div>
					<div id="orderList-main">
					<c:forEach items="${map.list }" var="pur">
						<form class="form">
							<table id="table">
							<tr>
                                <td colspan="4" class="data background font">
                                	<input type="button" disabled="true" class="background" style="border: none;" />
                                	<input type="button" disabled="true" style="border: none; " class="background" />${pur.purchaseDate }</td>
                                <td colspan="2" class="center background font" id="orderNo-td">
                                	 <a href="/auction/orderDetailPage.do" id="orderNo" class="text-align">${pur.orderNo } </a>
                                </td>
                            </tr>
                            <tr class="white">
                                <td colspan="1" class="data border font width">
                                	<input type="button" disabled="true" class="white" style="border: none;" />
                                	<input type="button" disabled="true" style="border: none; " class="background-1" />
                                	${pur.productName }
                                </td>
                                <td rowspan="2" class="center border vertical-align font text-align">${pur.payAmount }원</td>
                                <td rowspan="2" class="center border vertical-align font text-align">${pur.farmName }</td>
                                <td colspan="2" class="center border font text-align delivery">${pur.deliveryCompany }  &nbsp;&nbsp;&nbsp;&nbsp;${pur.deliveryNo }</td>
                            </tr>
                            <tr class="white">
                                <td colspan="1" class="data border font width">
                                	<input type="button" disabled="true" class="white" style="border: none;" />
                                	<input type="button" disabled="true" style="border: none; " class="background-1" />
                                	${pur.productCount }&nbsp; 상자
                                </td>
                                <td colspan="2" class="center border font text-align delivery">${pur.dName }</td>
                            </tr>
                          
							</table>
						</form>
					</c:forEach>
					<div id="navi">${map.pageNavi }</div>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
</div>
<script>
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
</script>
</body>
</html>