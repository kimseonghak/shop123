<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<style>
        * {
            box-sizing: border-box;
            border: 1px solid black;
        }

        #wrap {
            width: 100%;
            margin: 0 auto;
        }

  /* 콘텐츠 */
    #content {
            width: 100%;
            height: 1200px;
            background-color: #F2F2F2;
        }

        .box1 {
            width: 15%;
            height: 100%;
            float: left;
        }

        #main {
            width: 70%;
            height: 100%;
            float: left;
        }

        #box2 {
            width: 100%;
            height: 275px;
        }

        #subject-box {
            width: 100%;
            height: 59px;

        }

        #subject {
            width: 220px;
            height: 37px;
            margin-top: 10px;
            margin-left: 42%;
        }

        #subject>span {
            font-size: 28px;
            font-family: 'NanumSquare';
            color: #3BBD5A;
            font-weight: bold;
        }

        #box3 {
            width: 100%;
            height: 70px;
        }
        #box4 {
            width: 100%;
            height: 184px;
        }

    
        table {
            font-size: 16px;
            font-family: 'NanumSquare';
            margin: 0 auto;
            line-height: 36px;

        }

        #line {
            line-height: 25px;
            color: #E4FFF8;
        }

        #btn {
            display: inline-block;
            position: relative;
            height: 37px;
            width: 140px;
            border-radius: 10px;
            background-color: #3BBD5A;
            border: none;
            font-size: 17px;
            top: 10px;
        }

        .block {
            width: 100%;
            height: 100%;
            background-color: black;
            margin-top: -244px;
            border-radius: 0 0 10px 10px;
            opacity: 0.65;
        }

        .block>span {
            display: block;
            line-height: 270px;
            margin-left: 100px;
            font-size: 25px;
            color: #FFFFFF;
            font-family: 'NanumSquare';
        }

        #sub {
            width: 163px;
            height: 100%;
            float: left;
            margin-left: 60px;
            margin-right: 20px;

        }

        #submenu {
            width: 150px;
            height: 200px;
            box-shadow: 5px 5px 5px #E9E9E9;
            border-radius: 3px;
            padding: 15px 0 15px 0;
            background-color: white;


        }

        #navi {
            width: 100%;
            height: 100%;
        }

        #navi-list {
            margin: 0px;
            padding: 0px;

            width: 100%;
            height: 100%;
        }

        #navi-list>li {
            list-style-type: none;
            display: block;
            width: 100%;
            height: 25%;

            box-sizing: border-box;
            line-height: 50px;
        }

        #navi-list li>a {
            text-decoration: none;
            display: block;

            height: 90%;
            margin-left: 20px;
            font-size: 14px;
            color: black;
        }
  
        #content-main {
            width: 612px;
            height: 100%;
            float: left;
        }

        #table {
            width: 520px;
            margin: 0 auto;
            border-radius: 10px;
        }

        .col {
            line-height: 52px;
        }

        #subject {
            line-height: 100px;
            font-size: 28px;
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: bolder;
            color: #3BBD5A;
            text-align: center;

        }

        #modify {
            display: block;
            position: relative;
            width: 97px;
            border-bottom: 2px solid #3BBD5A;
        }

        .box2 {
            color: white;
            line-height: 50px;
        }

        .join-Form {
            width: 400px;
            height: 730px;
            margin: 0 auto;

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
   border-radius: 5px;
   border: 0.5px solid #E5E5E5;
   float : right;
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
   border-radius: 5px;
   border: 0.5px solid #E5E5E5;
}

.span-style{
	display : block;
	float : left;
	width : 60px;
}

.input-class{
	margin-left: 10px;
	width: 275px;
	border : none;
	float : left;
	background-color: #F2F2F2;
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: #000000;
    text-align: center;
	
}

.email-style {
   height: 52px;
   width: 70%;
   font-family: 'Nanum Gothic', sans-serif;
   font-size: 16px;
   color: #000000;
   background-color: #F2F2F2;
   padding: 18px;
   margin-top: 20px;
   margin-bottom: 15px;
   border-radius: 5px;
   border: 0.5px solid #E5E5E5;
   float : right;
}

.span-otherStyle{
	display : block;
	float : left;
	width : 50px;
}
.email-class{
	margin-left: 10px;
	width: 175px;
	border : none;
	float : left;
	background-color: #F2F2F2;
	font-family: 'Nanum Gothic', sans-serif;
    font-size: 16px;
    color: #000000;
    text-align: center;
	
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

</style>
</head>
<body>
   <div id="wrap">
        
        <c:import url="/WEB-INF/views/commons/header.jsp"/>
        
        <div id="content">
            <div class="box1"></div>
            <div id="main">
                <div id="box2"></div>
                <div id="sub">
                    <div id="submenu">
                        <div id="navi">
                            <ul id="navi-list">
                                <li><a href="">주문조회</a></li>
                                <li><a href="" id="modify">회원 정보 수정</a></li>
                                <li><a href="">비밀번호 변경</a></li>
                                <li><a href="">회원 탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="content-main">
                    <form action="" method="post">
                        <table id="table" style="background-color: white;">
                            <tr>
                                <td id="subject" colspan="6">
                                    <div>회원 정보 수정</div>
                                </td>
                            <tr>
                            <tr>
                                <td>
                                    <div class="join-Form">
                                    
                                    <div class="input-style">
                                    	<span class="span-style">아이디</span>
                                        <input type="text" class="input-class" name="userId" placeholder="gusdk811">
                                    	
                                    </div>
                                     <div class="input-style">
                                    	<span class="span-style">이름</span>
                                        <input type="text" class="input-class" name="userId" placeholder="이현아">
                                    	
                                    </div>
									 <div class="input-style">
                                    	<span class="span-style">닉네임</span>
                                        <input type="text" class="input-class" name="userId" placeholder="겨울현아">
                                    	
                                    </div>	
                                    <div class="email-style">
                                    	<span class="span-otherStyle">이메일</span>
                                        <input type="text" class="email-class" name="userId" placeholder="gusdk811@google.com">
                                    	 <input type="button" class="btn" value="인증하기">
                                    </div>
                                        
                                       
                                        <input type="text" class="input-style" name="userPhone" placeholder="전화번호"><br>
                                        
                                        
                                        <input type="text" class="input-style-plusbtn" name="userAddressMain" placeholder="주소">
                                        <input type="button" class="btn" value="주소찾기"><br>
                                        <input type="text" class="input-style" name="userAddressSub" placeholder="상세주소"><br>
                                        <input type="submit" class="btn-submit" value="정보수정"><br>

                                    </div>
                                </td>
                            </tr>



                        </table>

                    </form>
                </div>
            </div>
            <div class="box1"></div>
        </div>
        
        <c:import url="/WEB-INF/views/commons/footer.jsp"/>
        
    </div>

</body>
</html>