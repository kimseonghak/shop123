<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	margin-top: 15px;
	margin-bottom: 5px;
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
	margin-bottom: 5px;
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
.check-msg {
	font-size: 12px;
}
.check-time-msg {
	font-size: 14px;
	float: right;
}
</style>
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
								<c:forEach items="${userResult }" var="item">
									아이디 : ${item.userId }
								</c:forEach>
								<c:forEach items="${farmResult }" var="item">
									아이디 : ${item.farmId }
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