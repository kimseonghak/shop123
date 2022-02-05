<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>

<link rel="stylesheet" type="text/css" href="/resources/main/member/css/findPwdSuccess.css">

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
                    <div class="info-Form">
						<p class="text-Info">이메일로 임시 비밀번호를 발송하였습니다.<br>
						 로그인 후 비밀번호를 변경해주세요.</p>
                    </div>
                    <button class="btn-submit"><a href="/member/memberLoginPage.do">로그인</a></button>
				</div>
			</div>
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>
</html>