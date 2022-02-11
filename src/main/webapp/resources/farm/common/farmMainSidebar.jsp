<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <div id="farmMainSideBar">
            	<div id="sideWrap1"></div>
	            <div id="sideWrap2">
	            	<ul id="mainUl">
                        <li>
                            <img src="/resources/farm/image/공지사항.png" width="30px" height="28px"/>
                            <a href="/farm/farmNoticePage.do">공지사항</a>
                        </li>
                        <li>
                           <img src="/resources/farm/image/문의사항.png" width="30px" height="28px"/>
                            <a href="/farm/farmQnaPage.do">문의사항</a>
                        </li>
                        <li>
                           <img src="/resources/farm/image/주문목록.png" width="30px" height="28px"/>
                             <a href="/farm/farmOrdertListPage.do">주문목록</a>
                        </li>
                        <li>
                            <img src="/resources/farm/image/환불.png" width="30px" height="28px"/>
                            <a href="/farm/farmRefundList.do">환불현황</a>
                        </li>
                        <li>
                           <img src="/resources/farm/image/낙찰.png" width="30px" height="28px"/>
                            <a href="/farm/farmProductListPage.do">낙찰목록</a>
                        </li>
		            </ul>
	            </div>
	        <div id="sideWrap3">
	            <div id="sideFooterNaviWrap">
                    <ul id="sideFooterNavi">
                        <li><span id="farmUpdate">회원정보수정</span></li>
                        <li><span id="farmPwUpdate">비밀번호수정</span></li>
                        <li><span id="farmWithDraw">회원탈퇴</span></li>
                        <li><a href="/farm/farmENTlogout.do">로그아웃</a></li>
                    </ul>
                </div>    
	        </div>
            <div id="sideWrap4">
              <span id="farmImg" >
	                  <img src="/resources/farm/image/농부.png"  width="35px" height="30px"/>
	           </span>
	           <span id="farmId">딸기농장 님</span>
                
            </div>
        </div>

<!-- 클릭했을 때 네비바 나타내긴 -->
    <script>
        $('#sideWrap4').click(function(){ 
        
            var sideFooterNaviWrap = $('#sideFooterNaviWrap')
            
            if($('#sideFooterNaviWrap').css('display') == 'block') 
            {
                $('#sideFooterNaviWrap').css('display', 'none');
                
            } else 
            {
                $('#sideFooterNaviWrap').css('display', 'block');
            }
        });

    </script>  
    
<!--회원정보수정 팝업창-->
    <script>
        
        $('#farmUpdate').click(function(){
                             
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '830';
            var _height = '650';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/farm/farmMypageModifyPage.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
           
        });
    
    </script>     
   
<!--비밀번호수정 팝업창-->
    <script>
        
        $('#farmPwUpdate').click(function(){
                             
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '600';
            var _height = '400';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
           window.open('/farm/farmPwdChangePage.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
           
        });
    
    </script>   

<!--회원탈퇴 팝업창-->
    <script>
        
        $('#farmWithDraw').click(function(){
            
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '750';
            var _height = '600';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/farm/farmWithdrawPage.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
           
        });
    
    </script>    
    
