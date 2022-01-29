<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<style>
@charset "UTF-8";
.bg-color {
	width: 100%;
	height: 100vh;
	background-color: #F2F2F2;
	display: flex;
    align-items: center;
}
.box-white {
	margin: 0 auto;
	width: 400px;
	height: 360px;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 100px;
}
.input-style {
	height: 52px;
	width: 100%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	background-color: #F2F2F2;
	color: #000000;
	padding: 18px;
	margin-top: 10px;
	margin-bottom: 10px;
	border: 0.5px solid #E5E5E5;
}
.input-style-plusbtn {
	height: 52px;
	width: 75%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #000000;
	background-color: #F2F2F2;
	padding: 18px;
	margin-top: 30px;
	margin-bottom: 10px;
	border: 0.5px solid #E5E5E5;
}
.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}
.btn {
	display: inline-block;
	border: none;
	font-family: 'Nanum Gothic', sans-serif;
	height: 52px;
	width: 23%;
	cursor: pointer;
	border-radius: 20px;
}
.btn-submit {
	width: 100%;
    height: 55px;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: white;
    border: 0.5px solid #E5E5E5;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.findId-Select {
	width: 100%;
	height: 30%;
}
.login-Form {
	width: 100%;
	height: 50%;
}

.farmSelUl {
	display: none;
}

.userSelUl>li {
	border: 1px solid grey;
	float: left;
	width: 49.5%;
	height: 55px;
	text-align: center;
	font-size: 16px;
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #3BBD5A;
	color: #FFFFFF;
	border: 0.5px solid #3BBD5A;
}

.farmSelUl>li {
	border: 1px solid grey;
	float: left;
	width: 49.5%;
	height: 55px;
	text-align: center;
	font-size: 16px;
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #3BBD5A;
	color: #FFFFFF;
	border: 0.5px solid #3BBD5A;
}

.userSelUl>li:last-child {
	cursor: pointer;
	background-color: #FFFFFF;
	border: 0.5px solid #D4D4D4;
	color: #000000;
}

.farmSelUl>li:first-child {
	cursor: pointer;
	background-color: #FFFFFF;
	border: 0.5px solid #D4D4D4;
	color: #000000;
}

.userFindIdFormWrap {
	display: block;
	
}

.farmFindIdFormWrap {
	display: none;
}
.user{
	line-height: 54px;
}
.farm{
	line-height: 54px;
}


</style>

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="findId-Select">
						<p class="title">아이디 찾기</p>
						<ul class="userSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
	                    <ul class="farmSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
                    </div>
                    
                    <div class="userFindIdFormWrap">
	                    <form action="" method="post">
	                    	<input type="text" class="input-style-plusbtn" name="userEmail" placeholder="이메일 입력">
	                    	<input type="button" class="btn" value="인증하기"><br>
							<input type="password" class="input-style" name="userEmailCode" placeholder="인증번호 입력"><br>
							<input type="submit" class="btn-submit" value="일반 아이디 찾기"><br>
	                    </form>
                    </div>
                    
                    <div class="farmFindIdFormWrap">
	                    <form action="" method="post">
	                    	<input type="text" class="input-style-plusbtn" name="farmEmail" placeholder="이메일 입력">
	                    	<input type="button" class="btn" value="인증하기"><br>
							<input type="password" class="input-style" name="farmEmailCode" placeholder="인증번호 입력"><br>
							<input type="submit" class="btn-submit" value="농가 아이디 찾기"><br>
	                    </form>
                    </div>
				</div>
				
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	
	<script>
	
	$(".userSelUl>li:last-child").click(function() {
		$(".userSelUl").css("display", "none");
		$(".userFindIdFormWrap").css("display", "none");
		$(".farmSelUl").css("display", "block");
		$(".farmFindIdFormWrap").css("display", "block");
	});
	$(".farmSelUl>li:first-child").click(function() {
		$(".userSelUl").css("display", "block");
		$(".userFindIdFormWrap").css("display", "block");
		$(".farmSelUl").css("display", "none");
		$(".farmFindIdFormWrap").css("display", "none");
	});
	</script>

</body>
</html>

