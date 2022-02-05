<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>

<link rel="stylesheet" type="text/css" href="/resources/main/member/css/findIdSuccess.css">

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