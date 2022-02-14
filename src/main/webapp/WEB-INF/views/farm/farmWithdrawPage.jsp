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
<title>농가 회원 탈퇴 </title>

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
	        height: 90vh;
	        margin: 0 auto;
	    }
	    
	
	    #farmPwdArea1
	    {
	        width: 100%;
	        height: 14vh;
	        border-bottom: 1px solid #767977;
	        font-size: 3.5vmin;
	        font-weight: bold;
	        text-align: center;
	        line-height: 13vh;
	        color: #626463;
	        letter-spacing:3px;
	    }
	    #farmPwdArea2
	    {
	        width: 80%;
	        height: 76vh;
	    }
	    #formArea
	    {
	        width: 100%;
	        height: 100%;
	        margin: 0 auto; 
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
	        font-size: 2.2vmin;
	        text-align: center;
	        color: #2A2A2A;
	        padding: 18px;
	        margin-top: 30px;
	        border: 0.5px solid #E5E5E5;
	        display: inline-block;
	    }
	    .btn 
	    {
	        height: 7vh;
	        width: 20vw;
	        border-radius: 20px;
	        margin-left: 30px;
	        font-weight: bold;
	        color: #198754;
	        background-color: white;
	        position: relative;
	        top: 7vh;
	        left: 24vw;
	        font-size: 1.8vmin;
	    }
	    
	    .withdraw {
	        padding: 20px;
	        position: relative;
	        top: 3vh;
	        left: 20vw;
	    }
	    .withdraw-main-text {
	        font-size: 1.9vmin;
	        font-weight: bold;
	        padding-bottom: 10px;
	    }
	    .withdraw-sub-text {
	        font-size: 1.5vmin;
	        line-height: 25px;
	        padding-bottom: 10px;
	    }
	    .withdraw-check-text {
	        font-size: 1.5vmin;
	       	position: relative;
	        left:1vw;
	    }
	    #checkbox
	    {
	    	position: relative;
	        top: 0.5vh;
	    }
	
	</style> 
</head>
<body>

        <div id="farmPwdWrap">
            <div id="farmPwdArea1">회원탈퇴</div>
            <div id="farmPwdArea2">
                <div id="formArea">
                    <form action="/farmMypage/farmMypageWithdraw.do" method="post" onsubmit="return validationCheck();">
                         <p class="titleText">비밀번호</p>
                                <input type="password" class="input-style" name="farmPwd" placeholder="비밀번호"><br>
                                <p class="titleText">비밀번호 재확인</p>
                                <input type="password" class="input-style" name="farmPwd_re" placeholder="비밀번호 재확인"><br>
                                
                                <div class="withdraw">
                                    <p class="withdraw-main-text">탈퇴 유의사항</p>
                                    <p class="withdraw-sub-text">
                                    - 회원 탈퇴 시 유의사항을 확인 후 신중히 진행해 주시기 바랍니다. <br>
                                    - 회원 탈퇴와 함께 123상회에 등록된 모든 개인정보는 삭제 및 폐기 처리되며 복구가 불가능합니다. <br>
                                    - 회원 탈퇴 시 동일 아이디와 이메일로 재가입하실 수 없습니다. <br>
                                    - 게시판형 서비스에 등록한 게시물 및 댓글은 탈퇴 후에도 삭제되지 않습니다. 반드시 탈퇴 전 직접 삭제하셔야 합니다.<br>
                                    - 회원 탈퇴 시 경매정보,판매정보는 삭제 및 폐기 처리되며 복구가 불가능합니다.
                                    </p>
                                    <input type="checkbox" name="agree" id="checkbox"><span class="withdraw-check-text">유의사항을 모두 확인하였으며, 이에 동의합니다.</span>
	                    	    </div>

                                <input type="submit" class="btn btn-success" value="회원탈퇴">   
                                <button type="button" class="btn btn-success" id="closeBtn">닫기</button>
                        </form>
                    </div>
               </div>
           </div>
    
	<script>
	    $('#closeBtn').click(function(){
	        
	       window.close();
	    });
	    
	    var inval_Arr = new Array(3).fill(false);
		
		//유효성검사
		$('input[type=submit]').click(function() {
			
			var farmPwd = $('input[name=farmPwd]').val();
			var farmPwd_re = $('input[name=farmPwd_re]').val();
			var checkbox = $('input[name=agree]').prop('checked');
			
			if(farmPwd==null || farmPwd=="") {
				return;
				inval_Arr[0] = false;
			}
			if(farmPwd_re==null || farmPwd_re=="") {
				return;
				inval_Arr[1] = false;
			}
			if(!(farmPwd_re==farmPwd)) {
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



</body>
</html>