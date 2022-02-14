<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<%--jstl 라이브러리 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<%--차트 cdn--%>      
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js" integrity="sha256-Y26AMvaIfrZ1EQU49pf6H4QzVTrOI8m9wQYKkftBt4s=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 페이지</title>

<!--부트스트랩-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
<!--font-->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">
 
<!-- css 파일 -->
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmMain.css">
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmDashBoard.css">


</head>
<body>
<c:import url="/resources/farm/common/farmMainHeader.jsp"/>
<c:import url="/resources/farm/common/farmMainSidebar.jsp"/>


    <div id="farmMainContentWrapper">
        <div id="farmContent1"></div>
        <div id="farmContent2">
            <div id="empty1"></div>
            <div id="graphWrap">
                <canvas id="enterHome"></canvas>
                
                
            </div>
            <div id="empty2"></div>
            <div id="boardWrap">
                <div id="noticeWrap" class="boardWrap">
                      <table>
                          <c:choose>
                         	<c:when test="${!noticeList.isEmpty()}">
                           <tr class="trTag">
                                <th><span class="boardTitle">공지사항</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmNoticePage.do" >+ 더보기</a></span></th>
                           </tr>
                         <tbody>
                         		<c:forEach items="${requestScope.noticeList}" var="n" varStatus="i">
		                           <tr>
		                                <td class="boardSubject"><span class="noticeTitle" noticeContent="${n.getNoticeContent()}">${n.getNoticeTitle()}</span></td>
		                                <td class="writeDate">${n.getNoticeRegdate()}</td>
		                           </tr>
		                         </c:forEach>  
	                          </c:when>
	                          <c:otherwise>
	                          		<tr class="trTag">
	                                	<th><span class="boardTitleEmpty">공지사항</span></th>
	                                	<th><span class="plusBoardEmpty"><a href="/farm/farmNoticePage.do">+ 더보기</a></span></th>
                          		 	</tr>
                          		 <tbody>
	                         	        <tr>
		                            	    <td class="boardSubject" colspan="2" rowspan="1"><span class="writeEmpty">등록된 공지가 없습니다.</span></td>
		                         	   </tr>
	                          </c:otherwise>
                           </c:choose>
                          </tbody>
                    </table>
                    
                </div>
                <div class="boardEmpty"></div>
                <div id="qnaWrap" class="boardWrap">
                  <table>
                  <c:choose>
                    <c:when test="${!qnaList.isEmpty()}">
                           <tr class="trTag">
                                <th><span class="boardTitle">문의사항</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmQnaPage.do">+ 더보기</a></span></th>
                           </tr>
                         <tbody>
                         		<c:forEach items="${requestScope.qnaList}" var="q" varStatus="i">
		                        	   <tr>
		                            	    <td class="boardSubject"><span class="qnaTitle" qnaBoardNo=${q.getQuestionNo()}>${q.getQuestionTitle()}</span></td>
		                                	<td class="writeDate">${q.getQuestionRegdate()}</td>
		                         	   </tr>
		                         </c:forEach> 
	                      </c:when>
	                      <c:otherwise>
	                         	<tr class="trTag">
	                                <th ><span class="boardTitleEmpty">문의사항</span></th>
	                                <th><span class="plusBoardEmpty"><a href="/farm/farmQnaPage.do">+ 더보기</a></span></th>
                          		 </tr>
                          		 <tbody>
	                         	        <tr>
		                            	    <td class="boardSubject" colspan="2" rowspan="1"><span class="writeEmpty">등록된 문의가 없습니다.</span></td>
		                         	   </tr>
	                       </c:otherwise>  
						</c:choose>
                          </tbody>
                    </table>
                    
                </div>
                <div class="boardEmpty"></div>
                <div id="refundWrap" class="boardWrap">
                 <table>
                  <c:choose>
                    <c:when test="${!refundList.isEmpty()}">
                           <tr class="trTag">
                                <th><span class="boardTitle">환불접수</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmQnaPage.do">+ 더보기</a></span></th>
                           </tr>
                         <tbody>
                         		<c:forEach items="${requestScope.refundList}" var="r" varStatus="i">
		                        	   <tr>
		                            	    <td class="boardSubject"><span class="refundTitle" refundBoardNo=${r.getQuestionUserNo()}>${r.getQuestionUserTitle()}</span></td>
		                                	<td class="writeDate">${r.getQuestionUserRegdate()}</td>
		                         	   </tr>
		                         </c:forEach> 
	                      </c:when>
	                      <c:otherwise>
	                         	<tr class="trTag">
	                                <th><span class="boardTitleEmpty">환불접수</span></th>
	                                <th><span class="plusBoardEmpty"><a href="/farm/farmRefundList.do">+ 더보기</a></span></th>
                          		 </tr>
                          		 <tbody>
	                         	        <tr>
		                            	    <td class="boardSubject" colspan="2" rowspan="1"><span class="writeEmpty">접수된 환불이 없습니다.</span></td>
		                         	   </tr>
	                       </c:otherwise>  
						</c:choose>
                          </tbody>
                    </table>
                </div>
            </div>
           
        </div>
        
    </div>


	<!--매출 그래프-->
	<script>
		$(function(){
			var context1 = document.getElementById('enterHome').getContext('2d');
			
			var productName1 = "${requestScope.productName1}";
			var productCount1 = "${requestScope.productCount1}";
			var productName2 = "${requestScope.productName2}";
			var productCount2 = "${requestScope.productCount2}";
			var productName3 = "${requestScope.productName3}";
			var productCount3 = "${requestScope.productCount3}";
			var productName4 = "${requestScope.productName4}";
			var productCount4 = "${requestScope.productCount4}";
			var productName5 = "${requestScope.productName5}";
			var productCount5 = "${requestScope.productCount5}";
			
			var enterHome = new Chart(context1,{
				type:'bar',
				data:{
	                //상품은 5개로 제한하고 Top-N으로 최근 경매로 한다.
					labels:[productName1,productName2,productName3,productName4,productName5],
					datasets:[{
						label: '상품별 매출', // 차트 제목
						fill:false, // line 형태일 때 선 안쪽을 채울지 말지
	                    
	                    //판매된 개수로 
						data: [productCount1,productCount2,productCount3,productCount4,productCount5],
						backgroundColor:[
							'rgba(255,99,132,0.2)',
							'rgba(54,162,235,0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)'
						],
						borderColor:[
							'rgba(255,99,132,1)',
							'rgba(54,162,235,1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)'
	
						],
						borderWidth:1
					}]
				},
				options:{
					maintainAspectRatio: false, //false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales:{
						y:{
							beginAtZero:true
						}
					}
				}
			});
		});	
   </script>      

  <%-- 공지사항 내용 팝업창 --%>
  <script>
  		$('.noticeTitle').click(function(){
  			
  			
  			var noticeContent=$(this).attr('noticeContent');
  			 var noticeTitle=$(this).text();
  			
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '800';
            var _height = '620';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/farm/farmNoticeContent.do?noticeContent='+noticeContent+'&noticeTitle='+noticeTitle+'', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
  			
  		});
  </script>
  
  
  <%-- 문의사항  팝업창 --%>
  <script>
  		$('.qnaTitle').click(function(){
  			
  			
  			var qnaBoardNo=$(this).attr('qnaBoardNo');
  			
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '1000';
            var _height = '620';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/question/questionViewPage.do?questionUserNo='+qnaBoardNo+'', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
  			
  		});
  </script>
  
    <%-- 환불접수  팝업창 --%>
  <script>
  		$('.refundTitle').click(function(){
  			
  			
  			var refundBoardNo=$(this).attr('refundBoardNo');
  			
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '1000';
            var _height = '620';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/question/questionViewPage.do?questionUserNo='+refundBoardNo+'', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
  			
  		});
  </script>




</body>
</html>