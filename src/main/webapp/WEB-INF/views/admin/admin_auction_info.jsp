<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙찰 정보</title>
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
			<th>&nbsp;번호&nbsp;</th>
			<th>경매 번호</th>
			<th>낙찰 날짜</th>
			<th>판매 유무</th>
			<th>가져오기</th>
		</tr>
		<c:forEach items="${map.list }" var="bid" varStatus="i">
			<tr class="tbTr">
				<td>${i.count }</td>
				<td>${bid.auctionNo }</td>
				<td>${bid.BIDDate }</td>
				<td>${bid.BIDSellYN }</td>
				<td><button class="outputBtn" data="${bid.auctionNo }">가져오기</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center">${map.pageNavi }</td>
		</tr>
	</table>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
		var data = $(this).attr('data');
		var formNo = ${formNo};
		$(opener.location).attr('href','javascript:outputAucionInfo('+data+','+formNo+');');
		window.close();
	});
</script>
</body>
</html>