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
<title>Insert title here</title>

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
        font-size: 2.2vmin;
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
                    <form action="" method="post">
		                    	<input type="hidden" name="farmNo" value="">
		                    	<p class="user-value-text">아이디</p>
		                    	<input type="text" class="input-style" name="farmId" value="" disabled="disabled"><br>
		                    	<p class="user-value-text">상호명</p>
								<input type="text" class="input-style" name="farmName" value=""><br>
								<span class="check-msg" id="name_msg"></span>
								<p class="user-value-text">사업자번호</p>
								<input type="text" class="input-style" name="farmBusiNum" value=""><br>
								<span class="check-msg" id="nick_msg"></span>
								<p class="user-value-text emailAddress">이메일</p>
								<input type="email" class="input-style-plusbtn emailAddress" name="farmEmail" value="">
								<input type="button" class="findBtn" id="mail_check_btn" value="인증하기"><br>
								<span class="check-msg" id="email_msg"></span><span class="check-time-msg" id="timer"></span>
								<p class="user-value-text ">이메일 인증번호</p>
								<input type="text" class="input-style " name="farmEmailCheck" placeholder="인증번호 입력" disabled="disabled"><br>
								<span class="check-msg" id="email_check_msg"></span>
								<p class="user-value-text">전화번호</p>
								<input type="text" class="input-style" name="farmPhone" value=""><br>
								<span class="check-msg" id="phone_msg"></span>
								<p class="user-value-text emailAddress">주소</p>
								<input type="text" class="input-style-plusbtn emailAddress" id="sample4_roadAddress" name="farmAddressMain" value="">
								<input type="button" class="findBtn" onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
								<span class="check-msg" id="address_main_msg"></span>
								<p class="user-value-text">상세주소</p>
								<input type="text" class="input-style" name="farmAddressSub" value=""><br>
								<span class="check-msg" id="address_sub_msg"></span>
							
                                <button type="submit" class="btn btn-success">정보수정</button>    
                                <button type="button" class="btn btn-success" id="closeBtn">닫기</button>
		                 </form>
                    </div>
               </div>
           </div>
    
<script>
    $('#closeBtn').click(function(){
        
        window.close();
    });
    
    
</script>    


</body>
</html>