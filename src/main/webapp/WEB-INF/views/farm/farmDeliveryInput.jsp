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

 <!--부트스트랩-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
 
 <!--font-->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<!-- css 파일 -->
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmOrderListPopupPage.css">
	
<style>
	 input
    {
      height: 30px;
    }

	.sendStatus
    {
        position: relative;
        bottom: -10px
    }
</style>	
	
</head>
<body>

 <div id="farmMemberWrap">
       <fieldset>배송입력</fieldset>
          <form action="" method="post">
               <table>    
                  <tbody>
                      <tr>
                        <td style="font-weight: bolder">회원번호</td>
                        <td>41</td>
                      </tr>
                      <tr>
                         <td style="font-weight: bolder">택배사</td>
                         <td><input type="text" name="deliveryCompany"></td>
                      </tr>
                      <tr>
                          <td style="font-weight: bolder">송장번호</td>
                          <td><input type="text" name="sendNo"></td>
                      </tr>
                      <tr>
                          <td style="font-weight: bolder">발송일</td>
                           <td><input type="text" name="sendDate" placeholder="    ex) 2022/01/28"></td>
                      </tr> 
                      <tr>
                          <td><input type="checkbox" name="sending" class="sendStatus"> 배송중</td>
                          <td><input type="checkbox" name="sendCompleted" class="sendStatus"> 배송완료</td>
                      </tr>                         

                    </tbody>
                </table>
                <br> 
                <button type="submit" class="btn btn-success btn-sm" id="lastBtn">완료</button>            
            </form>
    </div>
                
    <script>
        $('#lastBtn').click(function(){
            //로직 처리 후 마지막에 close 처리해주기
           window.close();
        });
    
    </script>    

</body>
</html>