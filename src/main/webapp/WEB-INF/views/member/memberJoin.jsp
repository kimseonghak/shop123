<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
<style>
@charset "UTF-8";
#content {
	width: 100%;
	height: 1700px;
}
.bg-color {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background-color: #EEEEEE;
}
.box-white {
	margin: 200px auto;
	width: 400px;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 300px;
}
.input-style {
	height: 52px;
	width: 100%;
	border: none;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #000000;
	background-color: #F2F2F2;
	padding: 18px;
	margin-top: 20px;
	margin-bottom: 15px;
}
.input-style-plusbtn {
	height: 52px;
	width: 75%;
	border: none;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #000000;
	background-color: #F2F2F2;
	padding: 18px;
	margin-top: 18px;
	margin-bottom: 18px;
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

.title {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
}
.btn-submit {
	width: 100%;
    height: 55px;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.join-Select {
	width: 100%;
	height: 30%;
}
.login-Form {
	width: 100%;
	height: 50%;
}
.user {
	width: 49.3%;
	height: 55px;
	background-color: #3BBD5A;
	float: left;
	text-align: center;
	margin-top: 25px;
	margin-right: 1px;
	color: #FFFFFF;
	font-family: 'Nanum Gothic', sans-serif;
	border: 0.5px solid #3BBD5A;
	font-size: 16px;
	line-height: 54px;
}
.farm {
	width: 49.3%;
	height: 55px;
	background-color: #FFFFFF;
	float: left;
	text-align: center;
	margin-top: 25px;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	border: 0.5px solid #D4D4D4;
	line-height: 54px;
}
.terms {
	width: 100%;
	height: 130px;
	border: none;
	background-color: #F2F2F2;
	overflow:auto;
}
.terms-text {
	font-size: 14px;
	font-family: 'Nanum Gothic', sans-serif;
	margin-top: 10px;
	margin-bottom: 10px;
}


</style>

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="join-Select">
						<p class="title">일반 회원가입</p>
						<ul>
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
                    </div>
                    <div class="join-Form">
	                    <form action="" method="post">
	                    	<input type="text" class="input-style" name="userId" placeholder="아이디"><br>
							<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
							<input type="password" class="input-style" name="userPwd_re" placeholder="비밀번호 재확인"><br>
							<input type="text" class="input-style" name="userName" placeholder="이름"><br>
							<input type="text" class="input-style" name="userNick" placeholder="닉네임"><br>
							<input type="email" class="input-style" name="userEmail" placeholder="이메일" disabled>
							<input type="text" class="input-style" name="userPhone" placeholder="전화번호"><br>
							<input type="text" class="input-style-plusbtn" name="userAddressMain" placeholder="주소">
							<input type="button" class="btn" value="주소찾기"><br>
							<input type="text" class="input-style" name="userAddressSub" placeholder="상세주소"><br>
							<p class="terms-text">이용약관 및 개인정보 취급방침</p>
							<div class="terms">
								<p class="terms-text" style="padding: 8px">
								제 1 조 (목적)<br><br>
								1. 본 약관은 123상회 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 123상회 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
								제 2 조 (약관의 효력과 변경)<br><br>
								1. 123상회 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br><br>
								2. 123상회 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 123상회 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.<br><br>
								이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.<br><br>
								제 3 조 (약관 외 준칙)<br><br>
								1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.<br><br>
								(이하생략)</p>
							</div>
							<input type="checkbox"><span class="terms-text">약관에 동의하시겠습니까?</span>
							<input type="submit" class="btn-submit" value="회원가입"><br>
	                    </form>
                    </div>
				</div>
				
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>
</html>