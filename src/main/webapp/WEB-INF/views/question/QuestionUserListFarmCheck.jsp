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



<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$('#searchBtn').click(function(){
		var farmName = $('#farmName').val();
		$.ajax({
			url:"/question/farmCheck.do",
			data:{farmName:farmName},
			type:"get",
			dataType:"json",
			sucess:function(farm){
				$.each(farm,function(index,item){
					console.log(item);
				})
			},
			error:function(){
				
			}
		});
	});
	
</script>		
</body>
</html>