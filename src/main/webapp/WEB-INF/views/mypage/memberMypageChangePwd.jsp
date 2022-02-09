<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>

#content {
	width: 100%;
	height: 1400px;
}
.bg-color {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-white {
	margin: 200px auto;
	background-color: white;
	border-radius: 20px;
	padding: 40px;
	margin-top: 300px;
	box-shadow: 3px 3px 10px #aeaeae;
	width: 58vw;
}
.input-style {
	height: 52px;
	width: 40%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #2A2A2A;
	padding: 18px;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0.5px solid #E5E5E5;
	display: inline-block;
}
.btn {
	display: inline-block;
	font-family: 'Nanum Gothic', sans-serif;
	height: 52px;
	width: 10%;
	cursor: pointer;
	border-radius: 20px;
	border: 2px solid #198754;
	margin-left: 30px;
	font-weight: bold;
	color: #198754;
	background-color: white;
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
    color: white;
    border: none;
    border-radius: 18px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.btn-cancle {
	width: 10%;
    height: 3.5vh;
    background-color: #3BBD5A;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 1.2vmin;
    color: white;
    border: none;
    border-radius: 18px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
}
.join-Select {
	width: 100%;
	height: 100px;
	border-bottom: 0.5px solid #ABABAB;
}

.check-msg {
	font-size: 12px;
}
.user-value-text {
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	display: inline-block;
	width: 14%;
	font-weight: bold;
}
.submit-box {
	text-align: right;
	border-top: 0.5px solid #ABABAB;
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
						<p class="title">비밀번호변경</p>
                    </div>
                    <div class="join-Form">
	                    <form action="/member/memberJoin.do" method="post" onsubmit="return validationCheck();">
	                    	<p class="user-value-text">현재 비밀번호</p>
	                    	<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
							<p class="user-value-text">신규 비밀번호</p>
	                    	<input type="password" class="input-style" name="userPwd_new" placeholder="신규 비밀번호"><br>
							<p class="user-value-text">신규 비밀번호 재확인</p>
							<input type="password" class="input-style" name="userPwd_new_re" placeholder="신규 비밀번호 재확인"><br>
	                    
							<div class="submit-box">
								<input type="submit" class="btn-submit" value="변경완료">
								<input type="button" class="btn-cancle" value="돌아가기" onclick="history.back(-1);">
	                    	</div>
	                    </form>
                    </div>
				</div>
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	
	<script>
	
	var inval_Arr = new Array(3).fill(false);
	
	//Pwd
	$('input[name=userPwd]').blur(function() {
		//영문 대소문자+숫자+특수문자 8~15자
		var pwdCheck = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);
		
		if ($('input[name=userPwd]').val()==null || $('input[name=userPwd]').val()=='') {
			return;
			inval_Arr[0] = false;
		} else if (!pwdCheck.test($('input[name=userPwd]').val())) {
			return;
			inval_Arr[0] = false;
		} else {
			inval_Arr[0] = true;
		}
	});
	
	//Pwd_new
	$('input[name=userPwd_new]').blur(function() {
		//영문 대소문자+숫자+특수문자 8~15자
		var pwdCheckNew = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);
		
		if ($('input[name=userPwd_new]').val()==null || $('input[name=userPwd_new]').val()=='') {
			return;
			inval_Arr[1] = false;
		} else if (!pwdCheckNew.test($('input[name=userPwd_new]').val())) {
			return;
			inval_Arr[1] = false;
		} else if(!($('input[name=userPwd_new]').val()==$('input[name=userPwd_new_re]').val())) {
			return;
			inval_Arr[1] = false;
		} else {
			inval_Arr[1] = true;
		}
	});
	
	//Pwd_new_re
	$('input[name=userPwd_new_re]').blur(function() {
		//영문 대소문자+숫자+특수문자 8~15자
		var pwdCheckNewRe = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);
		
		if ($('input[name=userPwd_new_re]').val()==null || $('input[name=userPwd_new_re]').val()=='') {
			return;
			inval_Arr[2] = false;
		} else if (!pwdCheckNewRe.test($('input[name=userPwd_new_re]').val())) {
			return;
			inval_Arr[2] = false;
		} else if(!($('input[name=userPwd_new]').val()==$('input[name=userPwd_new_re]').val())) {
			return;
			inval_Arr[2] = false;
		} else {
			inval_Arr[2] = true;
		}
	});
	
	//submit 버튼 클릭시 입력값 유효성 검사
	validationCheck = function() {
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		if(!validAll){
			alert(비밀번호 변경에 실패했습니다. 입력하신 정보를 다시한번 확인해주세요.');
			return false;
		}					
	}
	
	</script>
	

</body>
</html>