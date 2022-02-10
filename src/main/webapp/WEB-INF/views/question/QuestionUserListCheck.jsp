<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		box-sizing: border-box;
	}
	table{
		width:100%;
		border-spacing : 0px;
		text-align: center;
		margin:0 auto;
	}
	.naviArrow{
		text-decoration: none;
		display : inline-block;
		color: black;
		border : 1px solid black;
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
		background-color:black;
		border : 1px solid black;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
	}
	.otherNavi{
		text-decoration: none;
		display:inline-block;
		color: black;
		border : 1px solid black;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
	}
	.otherNavi:hover{
		color: white;
		background-color:black;
		opacity: 0.3;
	}
	#thTr th{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
</style>
</head>
<body>
	<table>
		<tr id="thTr">
			<th>구매 번호</th>
			<th>상품 이름</th>
			<th>구매 농가</th>
			<th>구매 수량</th>
			<th>구매 가격</th>
			<th>구매 날짜</th>
			<th>정보 입력</th>
		</tr>
		<c:forEach items="${map.list }" var="p">
			<tr>
				<td>${p.buyNo }</td>
				<td>${p.productName }</td>
				<td>${p.farmNo }</td>
				<td>${p.productCount }</td>
				<td>${p.payAmount }</td>
				<td>${p.purchaseDate }</td>
				<td><button class="outputBtn" data="${p.orderNo }" data2="${p.farmNo }">입력하기</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" align="center">${map.pageNavi }</td>
		</tr>
	</table>
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
	$('.outputBtn').click(function(){
		var orderNo=$(this).attr('data');
		var farmNo=$(this).attr('data2');
		window.opener.document.getElementById('GoodsNo').value=orderNo;
		window.opener.document.getElementById('farmNo').value=farmNo;
		window.close();
	});
</script>
</body>
</html>