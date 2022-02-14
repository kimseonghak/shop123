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
<title>배송 입력</title>

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
      text-align: center;
    }

	.sendStatus
    {
        position: relative;
        bottom: -10px
    }
    #closeBtn
    {
        position: relative;
        left: 45%;
    }
</style>	
	
</head>
<body>

 <div id="farmMemberWrap">
       <fieldset>배송입력</fieldset>
          <form action="/farm/farmDeliveryInput.do" method="post" onSubmit="return true;">
               <table>    
                  <tbody>
                      <tr>
                        <td style="font-weight: bolder">회원번호</td>
                        <td><input type="text" name="userNo" value="${requestScope.userNo}" readonly style="text-align: center">
                        	<input type="hidden" name="buyNo" value="${requestScope.buyNo}">
                        </td>
                      </tr>
                    <c:choose>
                    	<c:when test="${list.get(0).getDeliveryStatus() eq 'D_03'}">
	                      <tr>
	                         <td style="font-weight: bolder">택배사</td>
	                         <td><input type="text" name="deliveryCompany" value="${list.get(0).getDeliveryCompany()}" disabled="disabled"></td>
	                        
	                      </tr>
	                      <tr>
	                          <td style="font-weight: bolder">송장번호</td>
	                          <td><input type="text" name="sendNo" value="${list.get(0).getDeliveryNum()}" disabled="disabled"></td>
	                      </tr>
	                      <tr>
	                          <td style="font-weight: bolder">발송일</td>
	                           <td><input type="date" name="sendDate" placeholder="    ex) 2022/01/28" value="${list.get(0).getDeliveryDate()}" disabled="disabled"></td>
	                      </tr> 
                      </c:when>
                      <c:otherwise>
	                      <tr>
	                         <td style="font-weight: bolder">택배사</td>
	                         <td><input type="text" name="deliveryCompany" value="${list.get(0).getDeliveryCompany()}"></td>
	                        
	                      </tr>
	                      <tr>
	                          <td style="font-weight: bolder">송장번호</td>
	                          <td><input type="text" name="sendNo" value="${list.get(0).getDeliveryNum()}" ></td>
	                      </tr>
	                      <tr>
	                          <td style="font-weight: bolder">발송일</td>
	                           <td><input type="text" name="sendDate" placeholder="    ex) 2022/01/28" value="${list.get(0).getDeliveryDate()}"></td>
	                      </tr> 
                      </c:otherwise>
                    </c:choose>  
                      <tr>
                      <c:choose>
                      	<c:when test="${list.get(0).getDeliveryStatus() eq 'D_02'}">
                          <td><input type="radio" name="deliveryStatus" id="D_02" class="sendStatus" value="D_02" checked="checked"> 배송중</td>
                          <td><input type="radio" name="deliveryStatus" id="D_03" class="sendStatus" value="D_03"> 배송완료</td>
                      	</c:when>
                      	  <c:when test="${list.get(0).getDeliveryStatus() eq 'D_03'}">
                          <td><input type="radio" name="deliveryStatus" id="D_02" class="sendStatus" value="D_02" disabled="disabled"> 배송중</td>
                          <td><input type="radio" name="deliveryStatus" id="D_03" class="sendStatus" value="D_03"  checked="checked" disabled="disabled" > 배송완료</td>
                      	</c:when>
                      	<c:otherwise>
                      	  <td><input type="radio" name="deliveryStatus" id="D_02" class="sendStatus" value="D_02"> 배송중</td>
                          <td><input type="radio" name="deliveryStatus" id="D_03" class="sendStatus" value="D_03"> 배송완료</td>
                      	</c:otherwise>
                      </c:choose>	
                      </tr>                         
					
                    </tbody>
                </table>
                <br> 
               <c:choose>
               	<c:when test="${list.get(0).getDeliveryStatus() ne 'D_03'}">
                	<button type="submit" class="btn btn-success btn-sm" id="lastBtn">완료</button>
                </c:when>
                <c:otherwise>
                	<button type="button" class="btn btn-success btn-sm" id="closeBtn">닫기</button>
                </c:otherwise>
               </c:choose>
            </form>
    </div>
   
    
    <script>
    
    	$('#lastBtn').click(function(){
    		
    	
    		if ($('input[name=deliveryCompany]').val()==null || $('input[name=deliveryCompany]').val()==''|| $('input[name=sendNo]').val()==null || $('input[name=sendNo]').val()=='' ||
    				$('input[name=sendDate]').val()==null || $('input[name=sendDate]').val()=='')
    		{
    			alert('배송 정보에 빈칸이 있는지 확인해주세요');
    			return false;
    		}
  
    		//체크박스 비활성화 풀고 submit
    		$('.sendStatus').attr("disabled", false);
    	});
    
    </script>
    
    <!-- 배송완료 버튼 누를 시  -->
    <script>
    	$('#D_03').click(function(){
			 var result = window.confirm('배송 완료를 선택할 경우 수정이 불가합니다. 배송입력을 완료하시겠습니까?')
  			 if(result==true){
  				return true; 
  				
  			 }else
  			{
  				alert('취소하였습니다. ')	 
  				return false;
  			 }
    	});
    
    </script>
    
    
    <!-- 닫기 버튼 -->
    <script>
    	$('#closeBtn').click(function(){
    		
    		window.close();
    		
    	});
    
    </script>
    
	
</body>
</html>