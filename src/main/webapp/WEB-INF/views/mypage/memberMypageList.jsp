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

<link rel="stylesheet" type="text/css" href="/resources/main/mypage/css/memberMypageList.css">


</head>
<body>

<c:choose>

	<c:when test="${sessionScope.member eq null} ">
		location.href = "/"
	</c:when>
	
	<c:otherwise>
	
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
								<button class="btn-submit"><a href="/auction/orderListPage.do?userNo=${sessionScope.member.userNo }">이동하기</a></button>
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
	
	</c:otherwise>

</c:choose>


</body>
</html>