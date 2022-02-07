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
<title>${m.userId }님의 정보</title>
<style>
	*{
		font-family: 'Nanum Gothic', 'sans-serif';
	}
	table{
		width:100%;
		text-align: center;
		border-spacing: 0px;
	}
	#close{
		position: absolute;
		top:380px;
		right:10px;
		width: 100px;
		height: 30px;
		border: 1px solid #198754;
		color:#198754;
		background-color: white;
		border-radius: 5px;
		cursor: pointer;
	}
	table tr{
		height:30px;
		font-size:16px;
	}
	table td{
		border-bottom: 1px solid rgba(0,0,0,0.1);
	}
	table tr:last-child>td {
		border-bottom: 1px solid black;
	}
	table tr:first-child>td {
		border-top: 1px solid black;
	}
}
</style>
</head>
<body>
<h1>${m.userId }님의 정보</h1>
<table>
	<tr>
		<td>유저 번호</td>
		<td>${m.userNo }</td>
	</tr>
	<tr>
		<td>유저 ID</td>
		<td>${m.userId }</td>
	</tr>
	<tr>
		<td>유저 이름</td>
		<td>${m.userName }</td>
	</tr>
	<tr>
		<td>email</td>
		<td>${m.userEmail }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${m.userPhone }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${m.userAddressMain }</td>
	</tr>
	<tr>
		<td>상세주소</td>
		<td>${m.userAddressSub }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td>${m.userEnrollDate }</td>
	</tr>
</table>
<button id="close">닫기</button>
<script>
	$('#close').click(function(){
		window.close();
	});
</script>
</body>
</html>