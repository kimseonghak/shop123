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
<title>Insert title here</title>

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
                           <tr>
                                <th><img src="/resources/farm/image/고정핀.png" class="pinImage"/></th>
                                <th><span class="boardTitle">공지사항</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmNoticePage.do" >+ 더보기</a></span></th>

                           </tr>
                         <tbody>
                           <tr>
                                <td class="boardSubject" colspan="2"><a href="">공지사항입니다.공지사항입니다</a></td>
                                <td></td>
                                <td class="writeDate">2022/01/28</td>
                           </tr>
                           

                         
                          </tbody>
                    </table>
                    
                </div>
                <div class="boardEmpty"></div>
                <div id="qnaWrap" class="boardWrap">
                    <table>
                           <tr>
                                <th><img src="/resources/farm/image/고정핀.png" class="pinImage"/></th>
                                <th><span class="boardTitle">문의사항</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmQnaPage.do">+ 더보기</a></span></th>

                           </tr>
                         <tbody>
                           <tr>
                                <td class="boardSubject" colspan="2"><a href="">문의사항입니다.문의사항입니다</a></td>
                                <td></td>
                                <td class="writeDate">2022/01/28</td>
                           </tr>
                           
                           

                         
                          </tbody>
                    </table>
                    
                </div>
                <div class="boardEmpty"></div>
                <div id="refundWrap" class="boardWrap">
                                        <table>
                           <tr>
                               <th><img src="/resources/farm/image/고정핀.png" class="pinImage"/></th>
                                <th><span class="boardTitle">환불접수</span></th>
                                <th><span class="plusBoard"><a href="/farm/farmRefundList.do" >+ 더보기</a></span></th>

                           </tr>
                         <tbody>
                           <tr>
                                <td class="boardSubject" colspan="2"><a href="">문의사항입니다.문의사항입니다</a></td>
                                <td></td>
                                <td class="writeDate">2022/01/28</td>
                           </tr>
                           
                           

                         
                          </tbody>
                    </table>
                </div>
            </div>
            <div id="empty3"></div>
        </div>
        <div id="farmContent3"></div>
    </div>


<!--매출 그래프-->
<script>
	$(function(){
		var context1 = document.getElementById('enterHome').getContext('2d');
		var enterHome = new Chart(context1,{
			type:'bar',
			data:{
                //상품은 5개로 제한하고 Top-N으로 최근 경매로 한다.
				labels:['감귤','도라지','사과','배','한라봉'],
				datasets:[{
					label: '상품별 매출', // 차트 제목
					fill:false, // line 형태일 때 선 안쪽을 채울지 말지
                    
                    //판매된 개수로 
					data: [10, 100,30,40,20],
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



</body>
</html>