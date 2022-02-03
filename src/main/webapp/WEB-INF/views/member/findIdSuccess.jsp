<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>

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
	height: 70px;
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
.id-Info {
	border: 0.5px solid #CECECE;
	height: 80px;
	width: 90%;
	margin: 0 auto;
}
.id-Info-text {
	text-align: center;
	margin-top: 30px;
}

</style>

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="find-Success">
						<p class="title">인증에 성공하였습니다.</p>
                    </div>
                    <div class="login-Form">
	                   	<p class="text-Info">입력하신 정보와 일치하는 정보입니다.</p>
						<div class="id-Info">
							<p class="id-Info-text">
								<c:forEach items="${result }" var="item">
									아이디 : ${item.userId } 
								</c:forEach>
							</p>
						</div>
                    </div>
                    
                    <button class="btn-submit"><a href="/member/memberLoginPage.do">로그인</a></button>
				</div>
				
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>
</html>