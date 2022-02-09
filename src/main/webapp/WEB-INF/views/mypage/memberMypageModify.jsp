<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>

#content {
	width: 100%;
	height: 1500px;
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
	margin-top: 30px;
	margin-bottom: 10px;
	border: 0.5px solid #E5E5E5;
	display: inline-block;
}
.input-style-plusbtn {
	height: 52px;
	width: 40%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #2A2A2A;
	padding: 18px;
	margin-top: 30px;
	margin-bottom: 10px;
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
.login-Form {
	width: 100%;
	height: 50%;
}
.check-msg {
	font-size: 12px;
	display: block;
	padding-left: 15%;
}
.check-time-msg {
	font-size: 14px;
	display: block;
	padding-left: 48%;
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
#address_sub_msg {
	padding-bottom: 30px;
}
</style>

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
							<p class="title">회원정보수정</p>
	                    </div>
	                    <div class="join-Form">
		                    <form action="/mypage/memberMypageModify.do" method="post" onsubmit="return validationCheck();">
		                    	<input type="hidden"name="userNo" value="${sessionScope.member.userNo}">
		                    	<p class="user-value-text">아이디</p>
		                    	<input type="text" class="input-style" name="userId" value="${sessionScope.member.userId}" disabled="disabled"><br>
		                    	<p class="user-value-text">이름</p>
								<input type="text" class="input-style" name="userName" value="${sessionScope.member.userName}"><br>
								<span class="check-msg" id="name_msg"></span>
								<p class="user-value-text">닉네임</p>
								<input type="text" class="input-style" name="userNick" value="${sessionScope.member.userNick}"><br>
								<span class="check-msg" id="nick_msg"></span>
								<p class="user-value-text">이메일</p>
								<input type="email" class="input-style-plusbtn" name="userEmail" value="${sessionScope.member.userEmail}">
								<input type="button" class="btn" id="mail_check_btn" value="인증하기"><br>
								<span class="check-msg" id="email_msg"></span><span class="check-time-msg" id="timer"></span>
								<p class="user-value-text">이메일 인증번호</p>
								<input type="text" class="input-style" name="userEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
								<span class="check-msg" id="email_check_msg"></span>
								<p class="user-value-text">전화번호</p>
								<input type="text" class="input-style" name="userPhone" value="${sessionScope.member.userPhone}"><br>
								<span class="check-msg" id="phone_msg"></span>
								<p class="user-value-text">주소</p>
								<input type="text" class="input-style-plusbtn" id="sample4_roadAddress" name="userAddressMain" value="${sessionScope.member.userAddressMain}">
								<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
								<span class="check-msg" id="address_main_msg"></span>
								<p class="user-value-text">상세주소</p>
								<input type="text" class="input-style" name="userAddressSub" value="${sessionScope.member.userAddressSub}"><br>
								<span class="check-msg" id="address_sub_msg"></span>
								<div class="submit-box">
									<input type="submit" class="btn-submit" value="정보수정">
									<input type="button" class="btn-cancle" value="돌아가기" onclick="history.back(-1);">
		                    	</div>
		                    </form>
	                    </div>
					</div>
					
				</div>
			
			</div>
			
			<script>
			
				var inval_Arr = new Array(7).fill(false);
				
				//Name
				$('input[name=userName]').blur(function() {
					
					//한글 2~5자
					var nameCheck = RegExp(/^[가-힣]{2,5}$/);
					
						if ($('input[name=userName]').val()==null || $('input[name=userName]').val()=='') {
							$("#name_msg").html("이름을 입력해주세요.").css("color","red");
							return;
							inval_Arr[0] = false;
						}
						if (!nameCheck.test($('input[name=userName]').val())) {
							$("#name_msg").html("이름은 2~5자의 한글만 입력 가능합니다.").css("color","red");
							return;
							inval_Arr[0] = false;
						} else {
							$("#name_msg").html("이름은 상품 배송 시 이용됩니다.").css("color", "black");
							inval_Arr[0] = true;
						} 
						
					
				});
				
				//Nick
				$('input[name=userNick]').blur(function() {
					//한글+영문 대소문자 4~15 자
					//DB 수정하기
					var nickCheck = RegExp(/^[가-힣a-zA-Z0-9]{4,15}$/);
					var userNick = $('input[name=userNick]').val();
					var sessionNick = '${sessionScope.member.userNick}';
					
					if(sessionNick != $('input[name=userNick]').val()) {
						
						if ($('input[name=userNick]').val()==null || $('input[name=userNick]').val()=='') {
							$("#nick_msg").html("닉네임을 입력해주세요.").css("color","red");
							return;
							inval_Arr[1] = false;
						}
								
						if (!nickCheck.test($('input[name=userNick]').val())) {
							$("#nick_msg").html("닉네임은 4~15자 한글과 영문 대소문자와 숫자만 입력 가능합니다.").css("color","red");
							return;
							inval_Arr[1] = false;
						}
		
						$.ajax({
							url : "/member/memberNickCheck.do",
							data : {"userNick" : userNick},
							type : "get",
							success : function(result) {
								if (result == 1) {
									$("#nick_msg").html("중복되는 닉네임입니다.").css("color", "red");
									return;
									inval_Arr[1] = false;
								} else {
									$("#nick_msg").html("사용 가능한 닉네임입니다.").css("color", "green");
									inval_Arr[1] = true;
								}
							},
							error : function() {
								console.log("ajax 통신 실패")
							}
						});
						
					} else {
						$("#nick_msg").html("회원님의 사용중인 닉네임입니다.").css("color","black");
						inval_Arr[1] = true;
					}
	
				});
				
				//Email
				$('input[name=userEmail]').blur(function() {
					
					var userEmail = $('input[name=userEmail]').val();
					var emailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
					var sessionEmail = '${sessionScope.member.userEmail}';
					
					if(sessionEmail != $('input[name=userEmail]').val()) {
						
						
						if ($('input[name=userEmail]').val()==null || $('input[name=userEmail]').val()=='') {
							$("#email_msg").html("이메일을 입력해주세요.").css("color","red");
							return;
							inval_Arr[2] = false;
						} else if (!emailCheck.test($('input[name=userEmail]').val())) {
							$("#email_msg").html("올바른 이메일 형식을 입력해주세요.").css("color","red");
							return;
							inval_Arr[2] = false;
						}
						
						$.ajax({
							url : "/member/memberEmailCheck.do",
							data : {"userEmail" : userEmail},
							type : "get",
							success : function(result) {
								if (result == 1) {
									$("#email_msg").html("이미 사용중인 이메일입니다.").css("color", "red");
									return;
									inval_Arr[2] = false;
								} else {
									$("#email_msg").html("사용 가능한 이메일입니다.").css("color", "green");
									inval_Arr[2] = true;
								}
							},
							error : function() {
								console.log("ajax 통신 실패")
							}
						});
						
					} else {
						$("#email_msg").html("회원님의 사용중인 이메일입니다.").css("color","black");
						inval_Arr[2] = true;
					}
					
					
				});
				
				//Email 인증번호 발송 
				var code = ""; 
				$("#mail_check_btn").click(function() {
					var email = $('input[name=userEmail]').val();
					var emailCheck = $('input[name=userEmailCheck]');
					if(email == null || email=='') {
						alert("인증번호는 이메일 입력 후 발송 가능합니다.");
						return;
					} else if(inval_Arr[2] == false) {
						alert("이메일을 다시 확인해주세요.");
						return;
					} else {
					
						// 타이머 시작
						timer();
						$.ajax({
					        type : "GET",
					        url : "/member/memberMailCheck.do?email=" + email,
					        success : function(data){
								alert("인증번호가 발송되었습니다. 작성하신 이메일을 통해 확인 후 입력해주세요.");
					        	emailCheck.attr("disabled", false);
					        	code = data;
					        },
							error : function() {
								console.log("ajax 통신 실패")
							}
					                
					    });
					}
					
				});
			
				
				//인증번호 비교
				$('input[name=userEmailCheck]').blur(function() {
					var inputCode = $('input[name=userEmailCheck]').val();
				    var checkResult = $("#email_check_msg");  
				    
				    if(inputCode == code){
				    	checkResult.html("인증번호가 일치합니다.").css("color","green");
				    	inval_Arr[3] = true;
				    } else {
				        checkResult.html("인증번호를 확인해주세요.").css("color","red");
				        inval_Arr[3] = false;
				    }  
				});
				
				//인증하기 클릭 시 작동하는 인증번호 타이머
				function timer() {
					
					function $ComTimer(){
					    //prototype extend
					}
	
					$ComTimer.prototype = {
					    comSecond : "",
					    fnCallback : function(){},
					    timer : "",
					    domId : "",
					    fnTimer : function(){
					        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
					        this.comSecond--;
					        this.domId.innerText = m;
					        if (this.comSecond < 0) {
					            clearInterval(this.timer);
					            alert("인증 가능 시간이 초과되었습니다.\n초기화면으로 이동합니다.");
			                    location.replace("/member/memberJoinPage.do");
					        }
					    }
					    ,fnStop : function(){
					        clearInterval(this.timer);
					    }
					}
	
					var AuthTimer = new $ComTimer()
					AuthTimer.comSecond = 300;
					AuthTimer.fnCallback = function(){alert("인증 가능 시간이 초과되었습니다.")};
					AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000); 
					AuthTimer.domId = document.getElementById("timer");
				
				}
				
				//Phone
				$('input[name=userPhone]').blur(function() {
					//01*-3~4자-4자 하이픈(-)입력무시 
					var phoneCheck = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
					
					if ($('input[name=userPhone]').val()==null || $('input[name=userPhone]').val()=='') {
						$("#phone_msg").html("전화번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[4] = false;
					} else if (!phoneCheck.test($('input[name=userPhone]').val())) {
						$("#phone_msg").html("올바른 전화번호 형식을 입력해주세요.").css("color","red");
						return;
						inval_Arr[4] = false;
					} else {
						$("#phone_msg").html("전화번호는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[4] = true;
					}
				});
				
				//Address_Main
				$('input[name=userAddressMain]').blur(function() {
					if ($('input[name=userAddressMain]').val()==null || $('input[name=userAddressMain]').val()=='') {
						$("#address_main_msg").html("주소를 입력해주세요.").css("color","red");
						return;
						inval_Arr[5] = false;
					} else {
						$("#address_main_msg").html("주소는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[5] = true;
					}
				});
				
				//Address_Sub
				$('input[name=userAddressSub]').blur(function() {
					if ($('input[name=userAddressSub]').val()==null || $('input[name=userAddressSub]').val()=='') {
						$("#address_sub_msg").html("상세주소를 입력해주세요.").css("color","red");
						return;
						inval_Arr[6] = false;
					} else {
						$("#address_sub_msg").html("주소는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[6] = true;
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
						alert('회원 정보 수정에 실패했습니다. 입력하신 정보를 다시한번 확인해주세요.');
						return false;
					}					
				}
				
			</script>
			
			<!-- 다음 주소 API -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample4_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			
			                var roadAddr = data.roadAddress;
			                var extraRoadAddr = '';
			
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			               
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
			                document.getElementById("sample4_roadAddress").value = roadAddr;
			            
			            }
			        }).open();
			    }
			</script>
		
			<c:import url="/WEB-INF/views/commons/footer.jsp"/>
		</div>
		
	</c:otherwise>

</c:choose>

</body>
</html>