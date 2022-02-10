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
	height : 300px;
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
	margin-bottom: 90px;
}

.btn-submit {
	width: 48%;
    height: 55px;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    border: 0.5px solid #E5E5E5;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
    float : left;
    margin-right: 10px;
}
.mainBtn{
	width: 48%;
    height: 55px;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    border: 0.5px solid #E5E5E5;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
    float : left;
}

.login-Form {
	width: 100%;
	height: 34%;
}
.order-Info{
	height: 30px;
	font-size: 20px;
	font-family: 'NanumSquare';
	text-align: center;
}


</style>
<body>
<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="find-Success">
						<p class="title">주문을 완료하였습니다.</p>
                    </div>
                    <div class="login-Form">
	                   	<p class="order-Info">구매하신 목록은 아래의 주문 목록 버튼을 <br> 누르시면 확인하실 수 있습니다.</p>
						
                    </div>
                    <button class="btn-submit"><a href="/auction/orderListPage.do?userNo=${sessionScope.member.userNo }" style="color: white">주문목록</a></button>
                    <button class="mainBtn"><a href="/" style="color: white">홈으로 이동</a></button>
				</div>
			</div>
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	
	

	
</body>
</html>