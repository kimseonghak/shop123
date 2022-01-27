<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>

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
	height: 300px;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 100px;
}

.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
}
.text-welcome {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 30px;
	margin-bottom: 20px;
	color: #2A2A2A;
	text-align: center;
}

.text-welcomeInfo {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #2A2A2A;
	margin-bottom: 20px;
	text-align: center;
}
.join-Success {
	width: 100%;
	height: 70px;
}
.btn-submit {
	width: 100%;
    height: 55px;
    background-color: #5EB656;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.btn-submit>a {
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: white;
}

</style>

</head>
<body>

	<div id="warm">
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="join-Success">
						<p class="title">회원가입 성공</p>
                    </div>
                    <div class="login-Form">
	                   	<p class="text-welcome"><span style="font-weight: bold">user11</span>님<br>회원가입을 환영합니다.</p>
						<p class="text-welcomeInfo">지금 바로 로그인하여<br>123상회의 다양한 기능을 이용해보세요.</p>
                    </div>
                    
                    <button class="btn-submit"><a href="/">홈으로 이동</a></button>
				</div>
				
				
			</div>
		
		</div>
	
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
	


</body>
</html>

