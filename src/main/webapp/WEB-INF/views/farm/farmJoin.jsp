<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 회원가입</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<style>
#content {
	width: 100%;
	height: 1800px;
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
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #000000;
	background-color: #F2F2F2;
	padding: 18px;
	margin-top: 20px;
	margin-bottom: 15px;
	border: 0.5px solid #E5E5E5;
}
.input-style-plusbtn {
	height: 52px;
	width: 75%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #000000;
	background-color: #F2F2F2;
	padding: 18px;
	margin-top: 18px;
	margin-bottom: 18px;
	border: 0.5px solid #E5E5E5;
}
.btn {
	display: inline-block;
	font-family: 'Nanum Gothic', sans-serif;
	height: 52px;
	width: 23%;
	cursor: pointer;
	border-radius: 20px;
	border: 0.5px solid #E5E5E5;
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
	background-color: #FFFFFF;
	float: left;
	text-align: center;
	margin-top: 25px;
	margin-right: 1px;
	font-family: 'Nanum Gothic', sans-serif;
	border: 0.5px solid #D4D4D4;
	font-size: 16px;
	line-height: 54px;
}
.farm {
	width: 49.3%;
	height: 55px;
	background-color: #3BBD5A;
	color: #FFFFFF;
	float: left;
	text-align: center;
	margin-top: 25px;
	font-family: 'Nanum Gothic', sans-serif;
	border: 0.5px solid #3BBD5A;
	font-size: 16px;
	line-height: 54px;
}
.terms {
	width: 100%;
	height: 130px;
	background-color: #F2F2F2;
	overflow:auto;
	border: 0.5px solid #E5E5E5;
	border-radius: 5px;
}
.terms-text {
	font-size: 14px;
	font-family: 'Nanum Gothic', sans-serif;
	margin-top: 10px;
	margin-bottom: 10px;
}
.check-msg {
	font-size: 12px;
}
.check-time-msg {
	font-size: 14px;
	float: right;
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
						<p class="title">농가 회원가입</p>
						<ul>
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
                    </div>
                    <div class="join-Form">
	                    <form action="/farm/farmJoin.do" method="post" onsubmit="return validationCheck();">
	                    	<input type="text" class="input-style" name="farmId" placeholder="아이디"><br>
	                    	<span class="check-msg" id="id_msg"></span>
							<input type="password" class="input-style" name="farmPwd" placeholder="비밀번호"><br>
							<span class="check-msg" id="pwd_msg"></span>
							<input type="password" class="input-style" name="farmPwd_re" placeholder="비밀번호 재확인"><br>
							<span class="check-msg" id="pwd_msg_re"></span>
							<input type="text" class="input-style" name="farmName" placeholder="상호명"><br>
							<span class="check-msg" id="name_msg"></span>
							<input type="text" class="input-style" name="farmBusiNum" placeholder="사업자번호"><br>
							<span class="check-msg" id="busiNum_msg"></span>
							<input type="email" class="input-style-plusbtn" name="farmEmail" placeholder="이메일">
							<input type="button" class="btn" id="mail_check_btn" onclick="return timer();" value="인증하기"><br>
							<span class="check-msg" id="email_msg"></span><span class="check-time-msg" id="timer"></span>
							<input type="text" class="input-style" name="farmEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
							<span class="check-msg" id="email_check_msg"></span>
							<input type="text" class="input-style" name="farmPhone" placeholder="전화번호"><br>
							<span class="check-msg" id="phone_msg"></span>
							<input type="text" class="input-style-plusbtn" id="sample4_roadAddress" name="farmAddressMain" placeholder="주소">
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
							<span class="check-msg" id="address_main_msg"></span>
							<input type="text" class="input-style" name="farmAddressSub" placeholder="상세주소"><br>
							<span class="check-msg" id="address_sub_msg"></span>
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
				
			<script>
				
				var inval_Arr = new Array(10).fill(false);
				
				//ID
				$('input[name=farmId]').blur(function() {
					//영어+한글+숫자 8~15자
					var idCheck = RegExp(/^[a-zA-Z0-9]{8,15}$/);
					var farmId = $('input[name=farmId]').val();
	
					if ($('input[name=farmId]').val()==null || $('input[name=farmId]').val()=='') {
						$("#id_msg").html("아이디를 입력해주세요.").css("color","red");
						return;
						inval_Arr[0] = false;
					}
							
					if (!idCheck.test($('input[name=farmId]').val())) {
						$("#id_msg").html("아이디는 8~15자의 영문 대소문자와 숫자로만 입력 가능합니다.").css("color","red");
						return;
						inval_Arr[0] = false;
					}
	
					$.ajax({
						url : "/farm/farmIdCheck.do",
						data : {"farmId" : farmId},
						type : "get",
						success : function(result) {
							if (result == 1) {
								$("#id_msg").html("이미 사용중인 아이디입니다.").css("color", "red");
								return;
								inval_Arr[0] = false;
							} else {
								$("#id_msg").html("사용 가능한 아이디입니다.").css("color", "green");
								inval_Arr[0] = true;
							}
						},
						error : function() {
							console.log("ajax 통신 실패")
						}
					});
				});
				
				//Pwd
				$('input[name=farmPwd]').blur(function() {
					//영문 대소문자+숫자+특수문자 8~15자
					var pwdCheck = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);
					
					if ($('input[name=farmPwd]').val()==null || $('input[name=farmPwd]').val()=='') {
						$("#pwd_msg").html("비밀번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[1] = false;
					} else if (!pwdCheck.test($('input[name=farmPwd]').val())) {
						$("#pwd_msg").html("비밀번호는 8~15자의 영문 대소문자와 숫자, 특수문자만 입력 가능합니다.").css("color","red");
						return;
						inval_Arr[1] = false;
					} else {
						$("#pwd_msg").html("사용 가능한 비밀번호입니다.").css("color", "green");
						inval_Arr[1] = true;
					}
				});
				
				//Pwd_re
				$('input[name=farmPwd_re]').blur(function() {
					//영문 대소문자+숫자+특수문자 8~15자
					var pwdCheckRe = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,15}$/);
					
					if ($('input[name=farmPwd_re]').val()==null || $('input[name=farmPwd_re]').val()=='') {
						$("#pwd_msg_re").html("비밀번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[2] = false;
					} else if (!pwdCheckRe.test($('input[name=farmPwd_re]').val())) {
						$("#pwd_msg_re").html("비밀번호는 8~15자의 영문 대소문자와 숫자, 특수문자만 입력 가능합니다.").css("color","red");
						return;
						inval_Arr[2] = false;
					} else if(!($('input[name=farmPwd_re]').val()==$('input[name=farmPwd_re]').val())) {
						$("#pwd_msg_re").html("비밀번호가 일치하지 않습니다.").css("color","red");
						return;
						inval_Arr[2] = false;
					} else {
						$("#pwd_msg_re").html("비밀번호가 일치합니다.").css("color", "green");
						inval_Arr[2] = true;
					}
				});
				
				//Name
				$('input[name=farmName]').blur(function() {
					//한글 2~5자
					var nameCheck = RegExp(/^[가-힣]{2,5}$/);
					
					if ($('input[name=farmName]').val()==null || $('input[name=farmName]').val()=='') {
						$("#name_msg").html("이름을 입력해주세요.").css("color","red");
						return;
						inval_Arr[3] = false;
					}
					if (!nameCheck.test($('input[name=farmName]').val())) {
						$("#name_msg").html("이름은 2~5자의 한글만 입력 가능합니다.").css("color","red");
						return;
						inval_Arr[3] = false;
					} else {
						$("#name_msg").html("이름은 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[3] = true;
					}
				});
				
				//BusiNum
				$('input[name=farmBusiNum]').blur(function() {
					//숫자 10자
					var busiNumCheck = RegExp(/^[0-9]{10}$/);
	
					if ($('input[name=farmBusiNum]').val()==null || $('input[name=farmBusiNum]').val()=='') {
						$("#busiNum_msg").html("사업자 번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[4] = false;
					}
							
					if (!busiNumCheck.test($('input[name=farmBusiNum]').val())) {
						$("#busiNum_msg").html("올바른 사업자 번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[4] = false;
					} else {
						$("#busiNum_msg").html("정상적인 사업자 번호입니다.").css("color", "green");
						inval_Arr[4] = true;
					}
				});
				
				//Email
				$('input[name=farmEmail]').blur(function() {
				
					var emailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
					
					if ($('input[name=farmEmail]').val()==null || $('input[name=farmEmail]').val()=='') {
						$("#email_msg").html("이메일을 입력해주세요.").css("color","red");
						return;
						inval_Arr[5] = false;
					} else if (!emailCheck.test($('input[name=farmEmail]').val())) {
						$("#email_msg").html("올바른 이메일 형식을 입력해주세요.").css("color","red");
						return;
						inval_Arr[5] = false;
					} else {
						$("#email_msg").html("올바른 이메일입니다. 인증번호를 작성해주세요.").css("color", "green");
						inval_Arr[5] = true;
					}
				});
				
				//Email 인증번호 발송 
				var code = ""; 
				$("#mail_check_btn").click(function() {
					var email = $('input[name=farmEmail]').val();
					var emailCheck = $('input[name=farmEmailCheck]');
					if(email == null || email=='') {
						alert("인증번호는 이메일 입력 후 발송 가능합니다.");
						return;
					} else {
						$.ajax({
					        
					        type : "GET",
					        url : "/farm/farmMailCheck.do?email=" + email,
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
				$('input[name=farmEmailCheck]').blur(function() {
					var inputCode = $('input[name=farmEmailCheck]').val();
				    var checkResult = $("#email_check_msg");  
				    
				    if(inputCode == code){
				    	checkResult.html("인증번호가 일치합니다.").css("color","green");
				    	inval_Arr[6] = true;
				    } else {
				        checkResult.html("인증번호를 확인해주세요.").css("color","red");
				        inval_Arr[6] = false;
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
			                    location.replace("/farm/farmJoinPage.do");
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
				$('input[name=farmPhone]').blur(function() {
					//01*-3~4자-4자 하이픈(-)입력무시 
					var phoneCheck = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
					
					if ($('input[name=farmPhone]').val()==null || $('input[name=farmPhone]').val()=='') {
						$("#phone_msg").html("전화번호를 입력해주세요.").css("color","red");
						return;
						inval_Arr[7] = false;
					} else if (!phoneCheck.test($('input[name=farmPhone]').val())) {
						$("#phone_msg").html("올바른 전화번호 형식을 입력해주세요.").css("color","red");
						return;
						inval_Arr[7] = false;
					} else {
						$("#phone_msg").html("전화번호는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[7] = true;
					}
				});
				
				//Address_Main
				$('input[name=farmAddressMain]').blur(function() {
					if ($('input[name=farmAddressMain]').val()==null || $('input[name=farmAddressMain]').val()=='') {
						$("#address_main_msg").html("주소를 입력해주세요.").css("color","red");
						return;
						inval_Arr[8] = false;
					} else {
						$("#address_main_msg").html("주소는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[8] = true;
					}
				});
				
				//Address_Sub
				$('input[name=farmAddressSub]').blur(function() {
					if ($('input[name=farmAddressSub]').val()==null || $('input[name=farmAddressSub]').val()=='') {
						$("#address_sub_msg").html("상세주소를 입력해주세요.").css("color","red");
						return;
						inval_Arr[9] = false;
					} else {
						$("#address_sub_msg").html("주소는 상품 배송 시 이용됩니다.").css("color", "black");
						inval_Arr[9] = true;
					}
				});
				
				
				//function validationCheck() {}
				//submit 버튼 클릭시 입력값(10가지)의 유효성 검사
				validationCheck = function() {
					var validAll = true;
					for(var i = 0; i < inval_Arr.length; i++){
						
						if(inval_Arr[i] == false){
							validAll = false;
						}
					}
					if(!validAll){
						alert('회원가입에 실패했습니다. 입력하신 정보를 다시한번 확인해주세요.');
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
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>
</html>