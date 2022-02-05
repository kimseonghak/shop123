<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" type="text/css" href="/resources/main/member/css/login.css">

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
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
	                    <form action="/member/memberLogin.do" method="post">
	                    	<input type="text" class="input-style" name="userId" placeholder="아이디"><br>
							<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
							<input type="submit" class="btn-submit" value="로그인"><br>
	                    </form>
                    </div>
                    
                    <div class="farmLoginFormWrap">
	                    <form action="/farm/farmLogin.do" method="post">
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
					</div>
				</div>
				
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
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

