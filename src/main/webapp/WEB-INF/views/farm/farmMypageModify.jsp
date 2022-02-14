<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<%--jstl 라이브러리 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 정보 수정</title>

   <!--font-->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">    

    <!--부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<style>
    *
    {
        box-sizing: border-box;
        font-family: Nanum Gothic;
    }

    
    #farmPwdWrap
    {
        width: 100%;
        height: 100vh;
        margin: 0 auto;
    }
    

    #farmPwdArea1
    {
        width: 100%;
        height: 14vh;
        border-bottom: 0.5px solid #ABABAB;
        font-size: 3.5vmin;
        font-weight: bold;
        text-align: center;
        line-height: 13vh;
        color: #626463;
        letter-spacing:3px;
            
    }
    #farmPwdArea2
    {
        width: 100%;
        height: 80vh;
    }
    #formArea
    {
        width:70%;
        height: 100%;
        margin: 0 auto; 
        position: relative;
        left: 15vw;
    }
    
    .titleText
    {
        font-size: 2.2vmin;
        display: inline-block;
        width: 50%;
        font-weight: bold;
        position: relative;
        left: 20vw;
    }

    .input-style
    {
        height: 3vh;
        width: 30vw;
        font-size: 1.6vmin;
        text-align: center;
        color: #2A2A2A;
        padding: 18px;
        margin-top: 16px;
        border: 0.5px solid #E5E5E5;
        display: inline-block;
    }
    .input-style-plusbtn
    {
        height: 3vh;
        width: 30vw;
        font-size: 1.6vmin;
        text-align: center;
        color: #2A2A2A;
        padding: 18px;
        margin-top: 16px;
        border: 0.5px solid #E5E5E5;
        display: inline-block;
    }
    
    .check-msg 
    {
		font-size: 12px;
		display: block;
		padding-left: 15%;
    }
    .check-time-msg 
    {
        font-size: 14px;
        display: block;
        padding-left: 48%;
    }
    .user-value-text 
    {
        font-size: 1.8vmin;
        display: inline-block;
        width: 14%;
        font-weight: bold;
    }
    .eamil
    {
        position: relative;
    	
    }
    .emailAddress
    {
    	position: relative;
    	top: 2.2vh;
    	margin-bottom: 4%;
    }
    #address_sub_msg
    {
        padding-bottom: 30px;
    }
    
    /*이메일 인증 및 주소찾기 버튼*/
    .findBtn 
    {
        height: 4vh;
        width: 8vw;
        border-radius: 20px;
        border-color:#198754;
        margin-left: 30px;
        font-weight: bold;
        color: #198754;
        background-color: white;
        position: relative;
        top:2.2vh;
        right:1.5vw;
        font-size: 1.6vmin;
    }
    .findBtn:hover
    {
        background-color:#198754;
        color: white;
    }
    
    /*정보수정 완료 및 닫기 버튼*/
    .btn 
    {
        height: 6vh;
        width: 10vw;
        border-radius: 20px;
        margin-left: 30px;
        font-weight: bold;
        color: #198754;
        background-color: white;
        position: relative;
        top: 2vh;
        left:6vw;
        font-size: 1.5vmin;
    }

</style> 


</head>
<body>

        <div id="farmPwdWrap">
            <div id="farmPwdArea1">사업자 정보수정</div>
            <div id="farmPwdArea2">
                <div id="formArea">
                    <form action="/farmMypage/farmMypageModify.do" method="post" onsubmit="return validationCheck();">
		                    	<p class="user-value-text">아이디</p>
		                    	<input type="text" class="input-style" name="farmId" value="${sessionScope.farm.farmId }" disabled="disabled"><br>
		                    	<p class="user-value-text">상호명</p>
								<input type="text" class="input-style" name="farmName" value="${sessionScope.farm.farmName }"><br>
								<span class="check-msg" id="name_msg"></span>
								<p class="user-value-text">사업자번호</p>
								<input type="text" class="input-style" name="farmBusiNum" value="${sessionScope.farm.farmBusiNum }"><br>
								<span class="check-msg" id="busiNum_msg"></span>
								<p class="user-value-text emailAddress">이메일</p>
								<input type="email" class="input-style-plusbtn emailAddress" name="farmEmail" value="${sessionScope.farm.farmEmail }">
								<input type="button" class="findBtn" id="mail_check_btn" value="인증하기"><br>
								<span class="check-msg" id="email_msg"></span><span class="check-time-msg" id="timer"></span>
								<p class="user-value-text ">이메일 인증번호</p>
								<input type="text" class="input-style " name="farmEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
								<span class="check-msg" id="email_check_msg"></span>
								<p class="user-value-text">전화번호</p>
								<input type="text" class="input-style" name="farmPhone" value="${sessionScope.farm.farmPhone }"><br>
								<span class="check-msg" id="phone_msg"></span>
								<p class="user-value-text emailAddress">주소</p>
								<input type="text" class="input-style-plusbtn emailAddress" id="sample4_roadAddress" name="farmAddressMain" value="${sessionScope.farm.farmAddressMain }">
								<input type="button" class="findBtn" onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
								<span class="check-msg" id="address_main_msg"></span>
								<p class="user-value-text">상세주소</p>
								<input type="text" class="input-style" name="farmAddressSub" value="${sessionScope.farm.farmAddressSub }"><br>
								<span class="check-msg" id="address_sub_msg"></span>
							
                                <input type="submit" class="btn btn-success" value="정보수정">    
                                <button type="button" class="btn btn-success" id="closeBtn">닫기</button>
		                 </form>
                    </div>
               </div>
           </div>
    
<script>
    $('#closeBtn').click(function(){
        
        window.close();
    });
    
 	$('#test').click(function(){

 		console.log("${SessionScope.farm.farmAddressSub }");
 		
    });
    
    var inval_Arr = new Array(7).fill(false);
	
	//Name
	$('input[name=farmName]').blur(function() {
		
		//한글 2~5자
		var nameCheck = RegExp(/^[가-힣]{2,5}$/);
		
			if ($('input[name=farmName]').val()==null || $('input[name=farmName]').val()=='') {
				$("#name_msg").html("이름을 입력해주세요.").css("color","red");
				return;
				inval_Arr[0] = false;
			}
			if (!nameCheck.test($('input[name=farmName]').val())) {
				$("#name_msg").html("이름은 2~5자의 한글만 입력 가능합니다.").css("color","red");
				return;
				inval_Arr[0] = false;
			} else {
				$("#name_msg").html("이름은 상품 배송 시 이용됩니다.").css("color", "black");
				inval_Arr[0] = true;
			} 
			
		
	});
	
	//BusiNum
	$('input[name=farmBusiNum]').blur(function() {
		//숫자 10자
		var busiNumCheck = RegExp(/^[0-9]{10}$/);

		if ($('input[name=farmBusiNum]').val()==null || $('input[name=farmBusiNum]').val()=='') {
			$("#busiNum_msg").html("사업자 번호를 입력해주세요.").css("color","red");
			return;
			inval_Arr[1] = false;
		}
				
		if (!busiNumCheck.test($('input[name=farmBusiNum]').val())) {
			$("#busiNum_msg").html("올바른 사업자 번호를 입력해주세요.").css("color","red");
			return;
			inval_Arr[1] = false;
		} else {
			$("#busiNum_msg").html("정상적인 사업자 번호입니다.").css("color", "green");
			inval_Arr[1] = true;
		}
	});
	
	//Email
	$('input[name=farmEmail]').blur(function() {
		
		var farmEmail = $('input[name=farmEmail]').val();
		var emailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
		var sessionEmail = '${sessionScope.farm.farmEmail}';
		
		if(sessionEmail != $('input[name=farmEmail]').val()) {
			
			
			if ($('input[name=farmEmail]').val()==null || $('input[name=farmEmail]').val()=='') {
				$("#email_msg").html("이메일을 입력해주세요.").css("color","red");
				return;
				inval_Arr[2] = false;
			} else if (!emailCheck.test($('input[name=farmEmail]').val())) {
				$("#email_msg").html("올바른 이메일 형식을 입력해주세요.").css("color","red");
				return;
				inval_Arr[2] = false;
			}
			
			$.ajax({
				url : "/farm/farmEmailCheck.do",
				data : {"farmEmail" : farmEmail},
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
		var email = $('input[name=farmEmail]').val();
		var emailCheck = $('input[name=farmEmailCheck]');
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
	
	//
	farmEmailCheck = function() {
		if(!$('input[name=farmEmailCheck]').prop("disabled")) {
			//인증번호 비교
			$('input[name=farmEmailCheck]').blur(function() {
				var inputCode = $('input[name=farmEmailCheck]').val();
			    var checkResult = $("#email_check_msg");  
			    
			    if(inputCode == code){
			    	checkResult.html("인증번호가 일치합니다.").css("color","green");
			    	inval_Arr[3] = true;
			    } else {
			        checkResult.html("인증번호를 확인해주세요.").css("color","red");
			        inval_Arr[3] = false;
			        return;
			    }  
			});
		} else {
			inval_Arr[3] = true;
		}
	}
	
	
	
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
                    location.replace("farm/farmMypageModifyPage.do");
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
			inval_Arr[4] = false;
		} else if (!phoneCheck.test($('input[name=farmPhone]').val())) {
			$("#phone_msg").html("올바른 전화번호 형식을 입력해주세요.").css("color","red");
			return;
			inval_Arr[4] = false;
		} else {
			$("#phone_msg").html("전화번호는 상품 배송 시 이용됩니다.").css("color", "black");
			inval_Arr[4] = true;
		}
	});
	
	//Address_Main
	$('input[name=farmAddressMain]').blur(function() {
		if ($('input[name=farmAddressMain]').val()==null || $('input[name=farmAddressMain]').val()=='') {
			$("#address_main_msg").html("주소를 입력해주세요.").css("color","red");
			return;
			inval_Arr[5] = false;
		} else {
			$("#address_main_msg").html("주소는 상품 배송 시 이용됩니다.").css("color", "black");
			inval_Arr[5] = true;
		}
	});
	
	//Address_Sub
	$('input[name=farmAddressSub]').blur(function() {
		if ($('input[name=farmAddressSub]').val()==null || $('input[name=farmAddressSub]').val()=='') {
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
		farmEmailCheck();
		console.log('inval_Arr : ', inval_Arr)
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


</body>
</html>