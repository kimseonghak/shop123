<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" type="text/css" href="/resources/main/member/css/findId.css">

</head>
<body>

	<div id="warm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
		
		<div id="content">
			<div class="bg-color">
				<div class="box-white">
					<div class="findId-Select">
						<p class="title">아이디 찾기</p>
						<ul class="userSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
	                    <ul class="farmSelUl">
	                        <li class="user">일반 회원</li>
	                        <li class="farm">농가 회원 </li>
	                    </ul>
                    </div>
                    
                    <div class="userFindIdFormWrap">
	                    <form action="/member/memberFindId.do" method="post" onsubmit="return validationCheck();">
	                    	<input type="email" class="input-style-plusbtn" name="userEmail" placeholder="이메일 입력">
	                    	<input type="button" class="btn" id="userMail_check_btn" value="인증하기"><br>
	                    	<span class="check-msg" id="userEmail_msg"></span> <span class="check-time-msg" id="userTimer"></span>
							<input type="text" class="input-style" name="userEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
							<span class="check-msg" id="userEmail_check_msg"></span>
							<input type="submit" class="btn-submit" value="일반 아이디 찾기"><br>
	                    </form>
                    </div>
                    
                    <div class="farmFindIdFormWrap">
	                    <form action="/farm/farmFindId.do" method="post" onsubmit="return validationCheck();">
	                    	<input type="email" class="input-style-plusbtn" name="farmEmail" placeholder="이메일 입력">
	                    	<input type="button" class="btn" id="farmMail_check_btn" value="인증하기"><br>
	                    	<span class="check-msg" id="farmEmail_msg"></span> <span class="check-time-msg" id="farmTimer"></span>
							<input type="text" class="input-style" name="farmEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
							<span class="check-msg" id="farmEmail_check_msg"></span>
							<input type="submit" class="btn-submit" value="농가 아이디 찾기"><br>
	                    </form>
                    </div>
				</div>
				
				
			</div>
		
		</div>
	
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	
	<!-- 클릭 시 일반/농가 변환 -->
	<script>
		$(".userSelUl>li:last-child").click(function() {
			$(".userSelUl").css("display", "none");
			$(".userFindIdFormWrap").css("display", "none");
			$(".farmSelUl").css("display", "block");
			$(".farmFindIdFormWrap").css("display", "block");
		});
		$(".farmSelUl>li:first-child").click(function() {
			$(".userSelUl").css("display", "block");
			$(".userFindIdFormWrap").css("display", "block");
			$(".farmSelUl").css("display", "none");
			$(".farmFindIdFormWrap").css("display", "none");
		});
	</script>
	
	<script>
		//user 최종 유효성 검사
		var inval_Arr = new Array(2).fill(false);
	
		//userEmail
		$('input[name=userEmail]').blur(function() {
		
			var emailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
			
			if ($('input[name=userEmail]').val()==null || $('input[name=userEmail]').val()=='') {
				$("#userEmail_msg").html("이메일을 입력해주세요.").css("color","red");
				return;
				inval_Arr[0] = false;
			} else if (!emailCheck.test($('input[name=userEmail]').val())) {
				$("#userEmail_msg").html("올바른 이메일 형식을 입력해주세요.").css("color","red");
				return;
				inval_Arr[0] = false;
			} else {
				$("#userEmail_msg").html("올바른 이메일입니다. 인증번호를 작성해주세요.").css("color", "green");
				inval_Arr[0] = true;
			}
		});
		
		//userEmail 인증번호 발송 
		var code = ""; 
		$("#userMail_check_btn").click(function() {
			var email = $('input[name=userEmail]').val();
			var emailCheck = $('input[name=userEmailCheck]');
			if(email == null || email=='') {
				alert("인증번호는 이메일 입력 후 발송 가능합니다.");
				return;
			} else {
				// 타이머 시작
				timer();
				$.ajax({
			        
			        type : "GET",
			        url : "/member/memberMailCheck.do?email=" + email,
			        success : function(data){
						alert("인증번호가 발송되었습니다.\n작성하신 이메일을 통해 확인 후 입력해주세요.");
			        	emailCheck.attr("disabled", false);
			        	code = data;
			        },
					error : function() {
						console.log("ajax 통신 실패")
					}
			                
			    });
			}
			
		});
	
		
		//user 이메일 인증번호 비교
		$('input[name=userEmailCheck]').blur(function() {
			var inputCode = $('input[name=userEmailCheck]').val();
		    var checkResult = $("#userEmail_check_msg");  
		    
		    if(inputCode == code){
		    	checkResult.html("인증번호가 일치합니다.").css("color","green");
		    	inval_Arr[1] = true;
		    } else {
		        checkResult.html("인증번호를 확인해주세요.").css("color","red");
		        inval_Arr[1] = false;
		    }  
		});
		
		//user 이메일 인증하기 클릭 시 작동하는 인증번호 타이머
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
	                    location.replace("/member/memberFindIdPage.do");
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
			AuthTimer.domId = document.getElementById("userTimer");
		}
		
		//function validationCheck() {}
		//user submit 버튼 클릭시 입력값(2가지)의 유효성 검사
		validationCheck = function() {
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			if(!validAll){
				alert('아이디 찾기에 실패했습니다.\n입력하신 정보를 다시한번 확인해주세요.');
				return false;
			}					
		}
		
	</script>
	
	<script>
		//farm 최종 유효성 검사
		var inval_Arr = new Array(2).fill(false);
	
		//farmEmail
		$('input[name=farmEmail]').blur(function() {
		
			var emailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
			
			if ($('input[name=farmEmail]').val()==null || $('input[name=farmEmail]').val()=='') {
				$("#farmEmail_msg").html("이메일을 입력해주세요.").css("color","red");
				return;
				inval_Arr[0] = false;
			} else if (!emailCheck.test($('input[name=farmEmail]').val())) {
				$("#farmEmail_msg").html("올바른 이메일 형식을 입력해주세요.").css("color","red");
				return;
				inval_Arr[0] = false;
			} else {
				$("#farmEmail_msg").html("올바른 이메일입니다. 인증번호를 작성해주세요.").css("color", "green");
				inval_Arr[0] = true;
			}
		});
		
		//farmEmail 인증번호 발송 
		var code = ""; 
		$("#farmMail_check_btn").click(function() {
			var email = $('input[name=farmEmail]').val();
			var emailCheck = $('input[name=farmEmailCheck]');
			if(email == null || email=='') {
				alert("인증번호는 이메일 입력 후 발송 가능합니다.");
				return;
			} else {
				// 타이머 시작
				timer();
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
	
		
		//farmuser 이메일 인증번호 비교
		$('input[name=farmEmailCheck]').blur(function() {
			var inputCode = $('input[name=farmEmailCheck]').val();
		    var checkResult = $("#farmEmail_check_msg");  
		    
		    if(inputCode == code){
		    	checkResult.html("인증번호가 일치합니다.").css("color","green");
		    	inval_Arr[1] = true;
		    } else {
		        checkResult.html("인증번호를 확인해주세요.").css("color","red");
		        inval_Arr[1] = false;
		    }  
		});
		
		//farm 이메일 인증하기 클릭 시 작동하는 인증번호 타이머
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
	                    location.replace("/member/memberFindIdPage.do");
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
			AuthTimer.domId = document.getElementById("farmTimer");
		}
		
		//function validationCheck() {}
		//farm submit 버튼 클릭시 입력값(2가지)의 유효성 검사
		validationCheck = function() {
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			if(!validAll){
				alert('아이디 찾기에 실패했습니다.\n입력하신 정보를 다시한번 확인해주세요.');
				return false;
			}					
		}
		
	</script>	
	
</body>
</html>

