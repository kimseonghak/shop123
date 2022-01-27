<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>

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
	height: 250px;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 100px;
}

.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	text-align: center;
}
.text-Info {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	margin-bottom: 20px;
	color: #2A2A2A;
	text-align: center;
}

.find-Success {
	width: 100%;
	height: 90px;
}
.btn-submit {
	width: 100%;
    height: 55px;
    background-color: #5EB656;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 40px;
    margin-bottom: 20px;
}
.btn-submit>a {
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: white;
}
.info-Form {
	height: 60px;
	width: 100%;
}

</style>

</head>
<body>

	<div id="warm">
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="find-Success">
						<p class="title">인증에 성공하였습니다.</p>
                    </div>
                    <div class="info-Form">
						<p class="text-Info">이메일로 임시 비밀번호를 발송하였습니다.<br>
						 로그인 후 비밀번호를 변경해주세요.</p>
                    </div>
                    
                    <button class="btn-submit"><a href="/member/memberLoginPage.do">로그인</a></button>
				</div>
				
				
			</div>
		
		</div>
	
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>

</body>
</html>