<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<style>

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
	height: 475px;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 100px;
}
.input-style {
	height: 52px;
	width: 100%;
	border: none;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	background-color: #F2F2F2;
	color: #000000;
	padding: 18px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}
.btn-submit {
	width: 100%;
    height: 55px;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.login-Select {
	width: 100%;
	height: 30%;
}
.login-Form {
	width: 100%;
	height: 50%;
}
.link-search {
	width: 100%;
	height: 20%;
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 14px;
	margin-top: 25px;
}
.link-search>a {
	margin: 20px;
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

.userLoginFormWrap {
	display: block;
	
}

.farmLoginFormWrap {
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
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="login-Select">
						<p class="title">로그인</p>
						<ul class="userSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
	                    <ul class="farmSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
                    </div>
                    
                    <div class="userLoginFormWrap">
	                    <form action="" method="post">
	                    	<input type="text" class="input-style" name="userId" placeholder="아이디"><br>
							<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
							<input type="submit" class="btn-submit" value="로그인"><br>
	                    </form>
                    </div>
                    
                    <div class="farmLoginFormWrap">
	                    <form action="" method="post">
	                    	<input type="text" class="input-style" name="farmId" placeholder="농가 아이디"><br>
							<input type="password" class="input-style" name="farmPwd" placeholder="농가 비밀번호"><br>
							<input type="submit" class="btn-submit" value="농가 로그인"><br>
	                    </form>
                    </div>
                    
                    <div class="link-search">
						<a href="/member/memberFindIdPage.do">아이디 찾기</a>
						<a href="/member/memberFindPwdPage.do">비밀번호 찾기</a>
						<a href="/member/memberJoinPage.do">회원가입</a><br><br>
						<a href="/farm/farmJoinPage.do">사업자 회원가입</a>
						<a href="/member/memberTestPage.do">테스트</a>
					</div>
				</div>
				
				
			</div>
		
		</div>
	
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
	
	<script>
	
	$(".userSelUl>li:last-child").click(function() {
		$(".userSelUl").css("display", "none");
		$(".userLoginFormWrap").css("display", "none");
		$(".farmSelUl").css("display", "block");
		$(".farmLoginFormWrap").css("display", "block");
	});
	$(".farmSelUl>li:first-child").click(function() {
		$(".userSelUl").css("display", "block");
		$(".userLoginFormWrap").css("display", "block");
		$(".farmSelUl").css("display", "none");
		$(".farmLoginFormWrap").css("display", "none");
	});
	</script>

</body>
</html>

