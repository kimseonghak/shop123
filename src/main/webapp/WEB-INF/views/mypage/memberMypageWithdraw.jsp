<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/resources/main/mypage/css/memberMypageWithdraw.css">

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
							<p class="title">회원탈퇴</p>
	                    </div>
	                    <div class="join-Form">
		                    <form action="/mypage/memberMypageWithdraw.do" method="post" onsubmit="return validationCheck();">
		                    	<p class="user-value-text">비밀번호</p>
		                    	<input type="password" class="input-style" name="userPwd" placeholder="비밀번호"><br>
								<p class="user-value-text">비밀번호 재확인</p>
								<input type="password" class="input-style" name="userPwd_re" placeholder="비밀번호 재확인"><br>
								<div class="withdraw">
									<p class="withdraw-main-text">탈퇴 유의사항</p>
									<p class="withdraw-sub-text">
									- 회원 탈퇴 시 유의사항을 확인 후 신중히 진행해 주시기 바랍니다. <br>
									- 회원 탈퇴와 함께 123상회에 등록된 모든 개인정보는 삭제 및 폐기 처리되며 복구가 불가능합니다. <br>
									- 회원탈퇴 시 동일 아이디와 이메일로 재가입하실 수 없습니다. <br>
									- 게시판형 서비스에 등록한 게시물 및 댓글은 탈퇴 후에도 삭제되지 않습니다. 반드시 탈퇴 전 직접 삭제하셔야 합니다.
									</p>
									<input type="checkbox" name="agree"><span class="withdraw-check-text">유의사항을 모두 확인하였으며, 이에 동의합니다.</span>
		                    	</div>
								<div class="submit-box">
									<input type="submit" class="btn-submit" value="회원 탈퇴">
									<input type="button" class="btn-cancle" value="돌아가기" onclick="history.back(-1);">
		                    	</div>
		                    </form>
	                    </div>
					</div>
				</div>
			</div>
			
			<script>
					
				var inval_Arr = new Array(3).fill(false);
				
				//유효성검사
				$('input[type=submit]').click(function() {
					
					var userPwd = $('input[name=userPwd]').val();
					var userPwd_re = $('input[name=userPwd_re]').val();
					var checkbox = $('input[name=agree]').prop('checked');
					
					if(userPwd==null || userPwd=="") {
						return;
						inval_Arr[0] = false;
					}
					if(userPwd_re==null || userPwd_re=="") {
						return;
						inval_Arr[1] = false;
					}
					if(!(userPwd_re==userPwd)) {
						return;
						inval_Arr[1] = false;
					}
					if(checkbox==false) {
						return;
						inval_Arr[2] = false;
					}
					inval_Arr[0] = true;
					inval_Arr[1] = true;
					inval_Arr[2] = true;
				});
				
				validationCheck = function() {
					var validAll = true;
					for(var i = 0; i < inval_Arr.length; i++){
						
						if(inval_Arr[i] == false){
							validAll = false;
						}
					}
					if(!validAll){
						alert('회원탈퇴에 실패했습니다. 입력하신 정보를 다시한번 확인해주세요.');
						return false;
					}					
				}
			
			</script>
			
			<c:import url="/WEB-INF/views/commons/footer.jsp"/>
		</div>
		
	</c:otherwise>
	
</c:choose>

	

</body>
</html>