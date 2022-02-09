<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
	<input type="text" id="farmName">
	<button id="searchBtn">검색</button>
<table id="farmTbl">
	<tr>
		<th>농가 번호</th>
		<th>농가 이름</th>
		<th>입력</th>
	</tr>
</table>


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$('#searchBtn').click(function(){
		var farmName = $('#farmName').val();
		$('#farmTbl').empty();
		$('#farmTbl').append("<tr><th>농가 번호</th><th>농가 이름</th><th>입력</th></tr>");
		$.ajax({
			url:"/question/farmCheck.do",
			data:{farmName:farmName},
			type:"get",
			dataType:"json",
			success:function(farm){
				$.each(farm,function(index,item){
					var tr = "<tr><td>"+item.farmNo+"</td><td>"+item.farmName+"</td><td><button class='outputBtn' data='"+item.farmNo+"'>입력</button></td></tr>"
					console.log(tr);
					$('#farmTbl').append(tr);
				});
			},
			error:function(){
				alert('오류가 발생하였습니다.');
			}
		});
	});
	$('body').on('click','.outputBtn',function(event){
		var farmNo = $(this).attr('data');
		window.opener.document.getElementById('farmNo').value=farmNo;
		window.close();
	});
</script>		
</body>
</html>