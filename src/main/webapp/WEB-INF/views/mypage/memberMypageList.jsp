<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>


<style>

#content {
	width: 100%;
	height: 100vh;
}
.background {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-color {
	margin: 200px auto;
	width: 58vw;
	height: 50vh;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 300px;
	box-shadow: 3px 3px 10px #aeaeae;
}
.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	color: #3BBD5A;
}
.btn-submit {
	width: 10%;
    height: 3.5vh;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 1.2vmin;
    border: none;
    border-radius: 18px;
    cursor: pointer;
    float: right;
    margin-right: 10px;
}
.btn-submit>a {
   color: white;
}
.mypage-main {
	width: 100%;
	height: 15%;
}
.mypage-sub {
	width: 100%;
	height: 85%;
}
.mypage-sub-list {
	height: 25%;
	border-top: 0.5px solid #ABABAB; 
}
.main-text {
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 2vmin;
    font-weight: bold;
    padding: 10px;
    color: #2A2A2A;
}
.sub-text {
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 1.6vmin;
    padding-left: 15px;
    color: #2A2A2A;
}

</style>

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="background">
				<div class="box-color">
					<div class="mypage-main">
						<p class="title">마이페이지</p>
                    </div>
					<div class="mypage-sub">
						<div class="mypage-sub-list">
							<p class="main-text">주문목록</p>
							<p class="sub-text">회원님께서 주문하신 목록을 확인해보세요.</p>
							<button class="btn-submit"><a href="/mypage/memberMypageOrderListPage.do">이동하기</a></button>
						</div>
						
						<div class="mypage-sub-list">
							<p class="main-text">회원정보수정</p>
							<p class="sub-text">회원님의 정보를 수정해주세요.</p>
							<button class="btn-submit"><a href="/mypage/memberMypageModifyPage.do">이동하기</a></button>
						</div>
						
						<div class="mypage-sub-list">
							<p class="main-text">비밀번호변경</p>
							<p class="sub-text">계정의 보호를 위해 정기적으로 비밀번호를 변경해주세요.</p>
							<button class="btn-submit"><a href="/mypage/memberMypageChangePwdPage.do">이동하기</a></button>
						</div>
						
						<div class="mypage-sub-list">
							<p class="main-text">회원탈퇴</p>
							<p class="sub-text">123상회의 이용을 원치 않으신가요?</p>
							<button class="btn-submit"><a href="/mypage/memberMypageWithdrawPage.do">이동하기</a></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>
</html>