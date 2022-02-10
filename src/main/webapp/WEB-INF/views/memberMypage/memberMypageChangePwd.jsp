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

<link rel="stylesheet" type="text/css" href="/resources/main/mypage/css/memberMypageChangePwd.css">

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
				<div class="bg-color">
					<div class="box-white">
						<div class="join-Select">
							<p class="title">비밀번호변경</p>
	                    </div>
	                    <div class="join-Form">
		                    <form action="/memberMypage/memberMypageChangePwd.do" method="post" onsubmit="return validationCheck();">
		                    	<p class="user-value-text">현재 비밀번호</p>
		                    	<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
								<p class="user-value-text">신규 비밀번호</p>
		                    	<input type="password" class="input-style" name="userNewPwd" placeholder="신규 비밀번호"><br>
								<p class="user-value-text">신규 비밀번호 재확인</p>
								<input type="password" class="input-style" name="userNewPwd_re" placeholder="신규 비밀번호 재확인"><br>
		                    
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
		
		//유효성검사
		$('input[type=submit]').click(function() {
			
			var userPwd = $('input[name=userPwd]').val();
			var userNewPwd = $('input[name=userNewPwd]').val();
			var userNewPwd_re = $('input[name=userNewPwd_re]').val();
			var pwdCheck = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);

			
			if(userPwd==null || userPwd=="") {
				return;
				inval_Arr[0] = false;
			}
			if(userNewPwd==null || userNewPwd=="") {
				return;
				inval_Arr[1] = false;
			}
			if (!pwdCheck.test($('input[name=userNewPwd]').val())) {
				return;
				inval_Arr[1] = false;
			}
			if(userNewPwd_re==null || userNewPwd_re=="") {
				return;
				inval_Arr[2] = false;
			}
			if (!pwdCheck.test($('input[name=userNewPwd_re]').val())) {
				return;
				inval_Arr[2] = false;
			}
			if(!(userNewPwd==userNewPwd_re)) {
				return;
				inval_Arr[2] = false;
			}
			inval_Arr[0] = true;
			inval_Arr[1] = true;
			inval_Arr[2] = true;
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
				alert('비밀번호 변경에 실패했습니다. 입력하신 정보를 다시한번 확인해주세요.');
				return false;
			}					
		}
		
		</script>
		
	</c:otherwise>

</c:choose>


	

</body>
</html>