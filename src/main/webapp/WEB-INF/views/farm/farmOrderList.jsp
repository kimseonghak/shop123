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
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmMain.css">
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmOrderList.css">

</head>
<body>
<c:import url="/resources/farm/common/farmMainHeader.jsp"/>
<c:import url="/resources/farm/common/farmMainSidebar.jsp"/>


     <div id="farmMainContentWrapper">
        <div id="farmContent1"></div>
        <div id="farmContent2">
            <div id="farmContentHeader">
                <span id="contnentTitle">주문목록</span>
            </div>
            <div id="farmContentContent">
                <div id="serchArea">
                    <form action="" method="get">
                         <select style="width:89px;height:30px" id="serchSelect">
                            <option value="subject">회원번호</option> 
                            <option value="content">상품명</option>
                          </select>
                    <input type="text" name="keyWord" size="30" id=serchKeyword>
                    <button type="submit" class="btn btn-outline-success btn-sm">검색</button>
                </form>
                    
                </div>
                <div id="emptyArea"></div>
                <div id="contentArea">
                    <table>
                           <tr>
                                <th>번호</th>
                                <th>회원번호</th>
                                <th class="productName">상품명</th>
                                <th class="count">구매수량</th>
                                <th class="amount">결제금액</th>
                                <th class="payDate">결제일자</th>
                                <th class="shopStatus">배송상태</th>
                                <th class="inputBtn"></th>
                           </tr>
                         <tbody>
                           <tr>
                                <td>1</td>
                                <td class="userNo"><a type="button" class="userNoA">2</a></td>
                                <td class="productName"><a type="button" class="productNameA">감귤 3kg</a></td>
                                <td class="count">1</td>
                                <td class="amount">25000</td>
                                <td class="payDate">2022/02/26</td>
                                <td class="shopStatus">준비중</td>
                                <td class="inputBtn">
                                <button type="button" class="btn btn-success btn-sm" >배송입력</button></td>
                                <!--배송완료 시 배송입력 버튼 비활성화(여유있으면 속성값: disabled )-->
                           </tr>
                           <tr>
                                <td>2</td>
                                <td class="userNo"><a type="button" class="userNoA">41</a></td>
                                <td class="productName"><a type="button" class="productNameA">지리산 표고버섯 2kg</a></td>
                                <td class="count">2</td>
                                <td class="amount">15000</td>
                                <td class="payDate">2022/02/26</td>
                                <td class="shopStatus">배송중</td>
                                <td class="inputBtn"><button type="button" class="btn btn-success btn-sm" >배송입력</button></td>
                           </tr>
                       
                          </tbody>
                    </table>
                    
                </div>
            </div>
            <!--page Navi-->
            <div id="farmContentFooter"></div>
        
        </div>
        <div id="farmContent3"></div>
    </div>
    

  <!-- sidebar 효과 -->
   <script>
	    $(function() {
	        $('#mainUl>li').eq(2).css('background-color', '#34734e');
	        $('#mainUl>li').eq(2).css('color', 'white');
	        $('#mainUl>li').eq(2).css('font-weight','bolder');
	    });
    
  </script>    
    
    
    <!--회원번호 클릭 시 회원정보 띄우기-->
    <script>
        
        $('.userNo').click(function(){
                             
            var userNo=$(this).text();
           //alert(userNo);
           window.open("/farm/farmMemberInfoPage.do","_blank","width=400px, height=300px");
            //회원정보 불러오기 로직
        });
    
    
    </script>    
    
    <!--상품명 클릭 시 상품정보 띄우기-->
    <script>
        
        $('.productName').click(function(){
                             
            var productName=$(this).text();
            //alert(productName);
           window.open("/farm/farmProductInfoPage.do","_blank","width=400px, height=200px");
            //상품정보 불러오기 로직
        });
    
    
    </script> 
    
    <!--배송입력 버튼 클릭 시 배송정보 입력-->
    <script>
        
        $('.btn-success').click(function(){
                 
      
            var userNo=$(this).parent().prev().prev().prev().prev().prev().prev().text();
           // alert(userNo);
           window.open("/farm/farmDeliveryInput.do","_blank","width=600px, height=300px");
           
        });
    
    
    </script> 





</body>
</html>