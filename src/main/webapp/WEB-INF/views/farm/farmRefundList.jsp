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
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmRefundList.css">

</head>
<body>
<c:import url="/resources/farm/common/farmMainHeader.jsp"/>
<c:import url="/resources/farm/common/farmMainSidebar.jsp"/>

<body>
    <div id="farmMainContentWrapper">
        <div id="farmContent1"></div>
        <div id="farmContent2">
            <div id="farmContentHeader">
                <span id="contnentTitle">환불 현황</span>
            </div>
            <div id="farmContentContent">
                <div id="serchArea">
                    <form action="" method="get">
                         <select style="width:90px;height:30px" id="serchSelect">
                            <option value="orderNo">주문번호</option> 
                            <option value="memberNo">회원번호</option>
                          </select>
                    <input type="text" name="keyWord" size="30" id=serchKeyword>
                    <button type="button" class="btn btn-outline-success btn-sm">검색</button>
                </form>
                    
                </div>
                <div id="emptyArea"></div>
                <div id="contentArea">
                    <table>
                           <tr>
                                <th>번호</th>
                                <th class="boardNo">글 번호</th>
                                <th class="userNo">회원번호</th>
                                <th class="orderNo">주문번호</th>
                                <th class="acceptDate">접수일</th>
                                <th class="refundStatus">환불상태</th>
                                <th></th>
                                <th></th>
                           </tr>
                         <tbody>
                           <tr>
                                <td>2</td>
                                <td class="boardNo"><a href="">23</a></td>
                                <td class="userNo"><a type="button" class="userNoA">3</a></td>
                               <td class="orderNo"><a type="button" class="orderNoA">A3232132324</a></td>
                                <td class="acceptDate">2022/01/25</td>
                                <td class="refundStatus">N</td>
                                <td><button type="button" class="btn btn-success btn-sm acceptBtn">환불승인</button></td>
                                <td><button type="button" class="btn btn-success btn-sm cancelBtn">접수취소</button></td>
                           </tr>
                           <tr>
                                <td>1</td>
                                <td class="boardNo"><a href="">12</a></td>
                               <td class="userNo"><a type="button" class="userNoA">41</a></td>
                               <td class="orderNo"><a type="button" class="orderNoA">BJE1239473</a></td>
                                <td class="acceptDate">2022/01/27</td>
                                <td class="refundStatus">N</td>
                                <td><button type="button" class="btn btn-success btn-sm acceptBtn">환불승인</button></td>
                                <td><button type="button" class="btn btn-success btn-sm cancelBtn">접수취소</button></td>
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
    
    <script>
	    $(function() {
	        $('#mainUl>li').eq(3).css('background-color', '#34734e');
	        $('#mainUl>li').eq(3).css('color', 'white');
	        $('#mainUl>li').eq(3).css('font-weight','bolder');
	    });
    
    </script>
    
    
    <!--회원번호 클릭 시 회원정보 띄우기-->
    <script>
        
        $('.userNo').click(function(){
            
            
            var userNo=$(this).text();
           //alert(userNo);
            //회원정보 불러오기 로직
            
            
            
            
            
            
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '400';
            var _height = '350';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/farm/farmMemberInfoPage.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
           
            
            
        });
    </script> 
    
    
    
    <!--주문번호 클릭 시 주문상세내역 띄우기-->
    <script>
        
        $('.orderNo').click(function(){
                             
           var orderNo=$(this).text();
           //alert(orderNo);
           //회원정보 불러오기 로직

            
            
            
            
            
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '400';
            var _height = '250';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 

            window.open('/farm/farmOrdertDetailInfoPage.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );

            
        });
    </script> 
    
    
    <!--환불 승인/취소 버튼을 눌렀을 때 관리자 환불테이블에 데이터가 N 또는 Y로 들어가면 2개의 버튼 비활성화 시키기-->
    <!--환불승인 버튼 눌렀을 때-->
    <script>
        $('.acceptBtn').click(function(){
            
            var result = window.confirm('환불을 승인하시겠습니까?');
           // alert(result); //승인 시 ture 값으로 넘어옴
            //버튼 비활성화 disabled="disabled"
            
        })
 
    
    </script>
    
        <!--환불취소 버튼 눌렀을 때-->
    <script>
        $('.cancelBtn').click(function(){
            
            var result = window.confirm('접수를 취소하시겠습니까?');
            alert(result); //승인 시 ture 값으로 넘어옴
            
        })
 
    
    </script>



</body>
</html>