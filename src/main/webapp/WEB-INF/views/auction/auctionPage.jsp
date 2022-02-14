<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"rel="stylesheet">
<style>
#wrap {
   width: 100%;
   margin: 0 auto;
}
#leftSpace-top {
   width: 100%;
   height: 42%;
}
#content {
   width: 100%;
   height: 100vh;
   overflow: hidden;
   position: relative;
}

#subject-box {
   width: 100%;
   height: 8%;
}

#subject {
   width: 100%;
   height: 100%;
   margin: 0 auto;
}

#subject>span {
   display : block;
   width : 100%;
   height : 100%;
   font-size: 3.9vmin;
   text-align : center;
   font-family: 'NanumSquare';
   color: #3BBD5A;
   font-weight: bold;
}

#leftSpace-footer {
   width: 100%;
   height: 8%;
}

#auction-wrapBox {
   width: 84%;
   height: 59%;
   margin-left: 12.5%;
}

.auction-box {
   width: 27%;
   height: 50vh;
   float: left;
   margin-right: 50px;
}

.auctionStatus-box {
   width: 100%;
   height: 18%;
   border-radius: 10px 10px 0 0;
   background-color: #3BBD5A;
}

.auctionStatus {
   width: 100%;
   height: 40%;
}

.auctionStatus span {
   color: #FFFFFF;
   font-family: 'NanumSquare';
   height: 100%;
   display: block;
   padding : 1.7%;
   font-size: 2.3vmin;
}

.auctionProduct {
   width: 100%;
   height: 59%;
}

.auctionProduct>span {
   display: block;
   height : 100%;
   font-size: 3.5vmin;
   color: #FFFFFF;
   font-family: 'NanumSquare';
   font-weight: bold;
   text-align: center;
   margin-top: -5px;
}

.auction-info {
   width: 100%;
   height: 86.1%;
   border-radius: 0 0 10px 10px;
   background-color: #E4FFF8;
}
.spanBox{
	width: 100%;
	height: 13%;
}

.spanLeft{
   width: 33%;
   height: 100%;
   text-align:right;
   float : left;
   font-size: 2.2vmin;
   font-family: 'NanumSquare';
}
.spanRight{
   width: 65%;
   height: 100%;
   text-align: center;
   float : left;
   font-size: 2.2vmin;
   font-family: 'NanumSquare';
}
.auctionBox-leftSpace{
   width : 100%;
   height: 10%;
}
.fontWeight{
   font-weight: bold;
}
.auctionCount-input{
   width : 95%;
   height: 80%;
   border : none;
   text-align: center;
   border-radius: 5px;
   font-weight: bold;
   color : #3BBD5A;
   font-size: 2.3vmin;
   padding-left : 7%;
   margin-top: -5%;
}
.spanRight-test {
   width: 38%;
   height: 100%;
   text-align: center;
   float : left;
   font-family: 'NanumSquare';
   padding-left :40px;
}
.text-span{
	width: 11%;
	height: 100%;
	float :left;
	font-size: 2.2vmin;
   	font-family: 'NanumSquare';
   	color : #3BBD5A;
}
.spanmiddel{
   width: 35%;
   height: 100%;
   text-align: center;
   float : left;
   font-size: 2.2vmin;
   font-family: 'NanumSquare';
   text-align: right;
}
.spanLast{
   width: 29%;
   height: 100%;
   float : left;
   font-size: 2.2vmin;
   font-family: 'NanumSquare';
   text-align: left;
}

.margin-bottom{
   margin-bottom: 3%;
}
.btnBox{
	width: 100%;
	height: 25%;
}
.btn{
   width : 150px;
   height: 45%;
   border : none;
   text-align: center;
   border-radius: 10px;
   font-weight: bold;
   color : #ffff;
   font-size: 2.1vmin;
   background-color: #3BBD5A;
   display: block;
   margin: 0 auto;
   cursor:pointer;
}

.font-style{
   color : #3BBD5A;
   font-weight: bold;
}

.block {
   width: 100%;
   height: 100%;
   background-color: black;
   margin-top: -43.1vmin;
   border-radius: 0 0 10px 10px;
   opacity: 0.65;
   color: #FFFFFF;
   font-family: 'NanumSquare';
   text-align: center;
   vertical-align: middle;
}
</style>
</head>
<body>
   <div id="wrap">
      <c:import url="/WEB-INF/views/commons/header.jsp" />
      <div id="leftSpace-top"></div>
      <div id="content">
         <div id="subject-box">
            <div id="subject">
               <span>이달의 경매 현황</span>
            </div>
         </div>
         <div id="leftSpace-footer"></div>
         <div id="auction-wrapBox">
         
         <jsp:useBean id="toDay" class="java.util.Date" />
         <fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today" />
      
         <c:choose>
         <c:when test="${map.au1.auctionStart>today}">
         <%--1번 폼 경매 중이 아닌 경우 --%>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span>경매 예정</span>
                  </div>
                  <div class="auctionProduct">
                     <span>레몬</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <!-- 경매 폼 로직-->
                      <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au1.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel">${map.au1.auctionEnd  }</span>
                     	<span class="spanLast">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount" class="auctionCount-input margin" value="0"/>
                     	</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au1.auctionPrice }"/>
                     	</span> 
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" id="aucBtn1" value="입찰하기"/>
	                 </div>
	                 <div class="block"></div>
               </div>
            </div>
            </c:when>
                     
         <%--경매 1번 폼 경매 중인 경우 --%>
         <c:otherwise>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span class="status1">경매 중</span>
                  </div>
                  <div class="auctionProduct">
                     <span id="productName1">${map.au1.auctionProduct }</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <input type="hidden" name="auctionFormNo" value="${map.au1.auctionFormNo }"/>
                     <input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
                     <input type="hidden" name="auctionProduct" value="${map.au1.auctionProduct }"/>
                     <input type="hidden" name="currentPrice" value="${map.au1.auctionPrice }"/>
                     <input type="hidden" name="auctionStart" value="${map.au1.auctionStart }"/>
                     <input type="hidden" name="auctionEnd" value="${map.au1.auctionEnd }"/>
                     <input type="hidden" name="auctionEndYN1" value="${map.au1.auctionEndYN }"/>
                     <input type="hidden" name="userNo" value="${sessionScope.member.userNo }"/>
                     <!-- 경매 폼 로직-->
					 <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au1.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel endDate1">${map.au1.auctionEnd  }</span>
	                    <span class="spanLast time1">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight remainTime1" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount1" class="auctionCount-input margin" value="0"/>
                     	</span>
                     	<span class="font-style text-span">상자</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au1.auctionPrice }"/>
                     	</span> 
                     	<span class="text-span font-style">원</span>
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" id="aucBtn1" value="입찰하기"/>
	                 </div>
	                 <div class="block" id="block1" style="display: none;"></div>
               </div>
            </div>
         </c:otherwise>
         </c:choose>
            
         <c:choose>
         <c:when test="${map.au2.auctionStart>today }">
         <%--2번 폼 경매 중이 아닌 경우 --%>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span>경매 예정</span>
                  </div>
                  <div class="auctionProduct">
                     <span>${map.au2.auctionProduct}</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <!-- 경매 폼 로직-->
                     <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au2.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel">${map.au2.auctionEnd  }</span>
                     	<span class="spanLast time2">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount" class="auctionCount-input margin"/>
                     	</span>
                     	<span class="font-style text-span">상자</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au3.auctionPrice }"/>
                     	</span>
                     	<span class="text-span font-style">원</span> 
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" value="입찰하기"/>
	                 </div>
	                 <div class="block"></div>
                  </div>
            </div>
            </c:when>
                     
         <%--경매 2번 폼 경매 중인 경우 --%>
         <c:otherwise>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span class="status2">경매 중</span>
                  </div>
                  <div class="auctionProduct">
                     <span id="productName2">${map.au2.auctionProduct }</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <!-- 경매 폼 로직-->
                     <input type="hidden" name="auctionFormNo" value="${map.au2.auctionFormNo }"/>
                     <input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
                     <input type="hidden" name="auctionProduct" value="${map.au2.auctionProduct }"/>
                     <input type="hidden" name="currentPrice" value="${map.au2.auctionPrice }"/>
                     <input type="hidden" name="auctionStart" value="${map.au2.auctionStart }"/>
                     <input type="hidden" name="auctionEnd" value="${map.au2.auctionEnd }"/>
               		 <input type="hidden" name="auctionEndYN2" value="${map.au2.auctionEndYN }"/>
               		 <input type="hidden" name="userNo" value="${sessionScope.member.userNo }"/>
                     
                     <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au2.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel endDate2">${map.au2.auctionEnd  }</span>
                     	<span class="spanLast time2">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight remainTime2" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount" class="auctionCount-input margin" value="0"/>
                     	</span>
                     	<span class="font-style text-span">상자</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au3.auctionPrice }"/>
                     	</span>
                     	<span class="text-span font-style">원</span> 
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" value="입찰하기"/>
	                 </div>
                     <div class="block" id="block2" style="display: none;"></div>
               </div>
            </div>
         </c:otherwise>
         </c:choose>
         
         <c:choose>
         <c:when test="${map.au3.auctionStart>today }">
         <%--3번 폼 경매 중이 아닌 경우 --%>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span>경매 예정</span>
                  </div>
                  <div class="auctionProduct">
                     <span>${map.au3.auctionProduct}</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <!-- 경매 폼 로직-->
                     <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au3.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel">${map.au3.auctionEnd  }</span>
                     	<span class="spanLast time3">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount1" class="auctionCount-input margin"/>
                     	</span>
                     	<span class="font-style text-span">상자</span>
                     </div>
                    
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au3.auctionPrice }"/>
                     	</span> 
                     	<span class="text-span font-style">원</span>
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" value="입찰하기"/>
	                 </div>
                     <div class="block"></div>
                  </div>
            </div>
            </c:when>
                     
         <%--경매 3번 폼 경매 중인 경우 --%>
         <c:otherwise>
            <div class="auction-box">
               <div class="auctionStatus-box">
                  <div class="auctionStatus">
                     <span class="status3">경매 중</span>
                  </div>
                  <div class="auctionProduct">
                     <span id="productName3">${map.au3.auctionProduct }</span>
                  </div>
               </div>
                  <div class="auction-info">
                     <div class="auctionBox-leftSpace"></div>
                     <!-- 경매 폼 로직-->
                     <input type="hidden" name="auctionFormNo" value="${map.au3.auctionFormNo }"/>
                     <input type="hidden" name="farmNo" value="${sessionScope.farm.farmNo }"/>
                     <input type="hidden" name="auctionProduct" value="${map.au3.auctionProduct }"/>
                     <input type="hidden" name="auctionPrice" value="${map.au3.auctionPrice }"/>
                     <input type="hidden" name="auctionStart" value="${map.au3.auctionStart }"/>
                     <input type="hidden" name="auctionEnd" value="${map.au3.auctionEnd }"/>
                     <input type="hidden" name="currentPrice" value="${map.au3.auctionPrice }"/>
                     <input type="hidden" name="auctionEndYN3" value="${map.au3.auctionEndYN }"/>
                     <input type="hidden" name="userNo" value="${sessionScope.member.userNo }"/>
                     
                      <div class="spanBox">                     
                     	<span class="spanLeft">시작일 :</span>
                     	<span class="spanRight auctionStart">${map.au3.auctionStart }</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">종료일 :</span>
                     	<span class="spanmiddel endDate3">${map.au3.auctionEnd  }</span>
                     	<span class="spanLast time3">&nbsp;&nbsp;23:59:59</span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">남은시간 :</span>
                     	<span class="spanRight fontWeight remainTime3" style="color: #FE0011"></span>
                     </div>
                     <div class="spanBox">  
                     	<span class="spanLeft">판매수량 :</span>
                     	<span class="spanRight-test">
                        	 <input type="number" min="0" name="auctionCount1" class="auctionCount-input margin"/>
                     	</span>
                     	<span class="font-style text-span">상자</span>
                     </div>
                    
                     <div class="spanBox">  
                     	<span class="spanLeft">현재 최저가 :</span>
                     	<span class="spanRight-test margin-bottom font-style">
                        	 <input type="number" name="auctionPrice" class="auctionCount-input" value="${map.au3.auctionPrice }"/>
                     	</span> 
                     	<span class="text-span font-style">원</span>
                     </div>
                     <div class="btnBox">
                     	<input type="submit" class="btn" id="aucBtn3" value="입찰하기"/>
	                 </div>
	                 <div class="block" id="block3" style="display: none;"></div>
                  </div>
            </div>
         </c:otherwise>
         </c:choose>
            
         </div>
      </div>
      <c:import url="/WEB-INF/views/commons/footer.jsp"/>
   </div>

   <script>
   
   //입찰하기 버튼 누를 시, 최저가/수량 비교해 로직 처리
   $('.btn').click(function(){
      
      var auctionCount1 = $(this).parent().parent().find('input[name=auctionCount1]').val();     		  //수량
      var auctionFormNo = $(this).parent().parent().find('input[name=auctionFormNo]').val();    			  //경매 폼 번호
      var auctionStart = $(this).parent().parent().find('input[name=auctionStart]').val();    			  //시작일
      var auctionPrice = $(this).parent().parent().children().find('input[name=auctionPrice]').val();      //입력한 가격
      var auctionEnd = $(this).parent().parent().find('input[name=auctionEnd]').val();         			  //종료일
      var auctionProduct = $(this).parent().parent().find('input[name=auctionProduct]').val();  			  //상품
      var farmNo = $(this).parent().parent().find('input[name=farmNo]').val();               			  //농가번호
      var currentPrice = $(this).parent().parent().find('input[name=currentPrice]').val();      			  //현재 최저가
      var userNo = $(this).parent().parent().find('input[name=userNo]').val();
      
      //회원인지 유효성 검사
      if(userNo!=''){
    	  alert('농가만 경매에 참여 가능합니다.');
    	  return false;
      }
      if(farmNo==''){
         alert('로그인 후  이용 가능합니다.');
         return false;
      }
      //수량, 최저가 유효성 검사
      if($(this).parent().find('input[name=auctionCount1]').val()<50 || $(this).parent().find('input[name=auctionCount1]').val()==0 || $(this).parent().find('input[name=auctionCount]').val()==''){
         alert('최소 판매 수량 50상자 이상 입력해주세요.');
         return false;
      }
      if(auctionPrice>currentPrice || auctionPrice==currentPrice){
         alert('현재 최저가보다 낮은 금액을 입력해주세요.');
         return false;
      }
      
      if(confirm("최저가 입찰하시겠습니까?")){
         $.ajax({
            url : "/auction/auctionInputPrice.do",
            data : {"auctionPrice" : auctionPrice,
                  "auctionCount1" : auctionCount1,
                  "auctionStart" : auctionStart,
                  "auctionEnd" : auctionEnd,
                  "farmNo" : farmNo,
                  "auctionFormNo" : auctionFormNo,
                  "auctionProduct" : auctionProduct,
                  "currentPrice" : currentPrice },  
            type : "post",
            success : function(result){
               if(result=="true"){
                  alert('최저가로 입찰되었습니다.');
                  window.location.reload(true);
               }else{
                  alert('잘못된 접근입니다');
               }
            },
            error : function(){
               console.log("ajax 통신 실패");
            }
         });
      };
   });

   
   //1 남은 시간 카운트 다운
   $(function(){
	   
	   var endYN = $('input[name=auctionEndYN1]').val();
	 
      const offset = new Date().getTimezoneOffset() * 60000;
      var date = new Date();
      $.each($(".endDate1"),function(index, item){
         var ele = $(this);
         var date3 = new Date($(item).html());
         date3.setDate(date3.getDate()+1);
         date3.setHours(date3.getHours()-9);
         var currentTime = date.getTime();
         var endTime = date3.getTime();
         if(endTime-currentTime>0 && endYN=='N'){
            var interval = endTime-currentTime;
            setInterval(function(){
               interval-=1000;
               var remainingDays = parseInt(interval/(1000*60*60*24));
               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
               $('.remainTime1').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
            },1000);
            
         }else{
            $('.remainTime1').html('마감되었습니다.');
            $('.status1').html('경매종료');
            $('.time1').html('');
            $('#block1').css('display','block');
            $('#aucBtn1').val('입찰종료');
            $('input[name=auctionCount1]').val('');
         }
      });
   });
   
   //2 남은 시간 카운트 다운
   $(function(){
	   
	   var endYN = $('input[name=auctionEndYN2]').val();
	   
      const offset = new Date().getTimezoneOffset() * 60000;
      var date = new Date();
      $.each($(".endDate2"),function(index, item){
         var ele = $(this);
         var date3 = new Date($(item).html());
         date3.setDate(date3.getDate()+1);
         date3.setHours(date3.getHours()-9);
         var currentTime = date.getTime();
         var endTime = date3.getTime();
         if(endTime-currentTime>0 && endYN=='N'){
            var interval = endTime-currentTime;
            
            setInterval(function(){
               interval-=1000;
               var remainingDays = parseInt(interval/(1000*60*60*24));
               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
               $('.remainTime2').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
            },1000);
            
         }else{
            $('.remainTime2').html('마감되었습니다.');
            $('.status2').html('경매종료');
            $('.time2').html('');
            $('#block2').css('display','block');
            $('#aucBtn2').val('입찰종료');
            $('input[name=auctionCount1]').val('');
         }
      });
   });
   
   //3 남은 시간 카운트 다운
   $(function(){
	   
	   var endYN = $('input[name=auctionEndYN3]').val();
	   
      const offset = new Date().getTimezoneOffset() * 60000;
      var date = new Date();
      $.each($(".endDate3"),function(index, item){
         var ele = $(this);
         var date3 = new Date($(item).html());
         date3.setDate(date3.getDate()+1);
         date3.setHours(date3.getHours()-9);
         var currentTime = date.getTime();
         var endTime = date3.getTime();
         if(endTime-currentTime>0 && endYN=='N'){
            var interval = endTime-currentTime;
            
            setInterval(function(){
               interval-=1000;
               var remainingDays = parseInt(interval/(1000*60*60*24));
               var remainingHours = parseInt((interval%(1000*60*60*24))/(1000*60*60));
               var remainingMins = parseInt(((interval%(1000*60*60*24))%(1000*60*60))/(1000*60));
               var remainingSec = parseInt((((interval%(1000*60*60*24))%(1000*60*60))%(1000*60))/(1000));
               $('.remainTime3').html(remainingDays+"일 "+remainingHours+"시간 "+remainingMins+"분 "+remainingSec+"초");
            },1000);
            
         }else{
            $('.remainTime3').html('마감되었습니다.');
            $('.status3').html('경매종료');
            $('.time3').html('');
            $('#block3').css('display','block');
            $('#aucBtn3').val('입찰종료');
            $('input[name=auctionCount1]').val('');
         }
      });
   });
   
   </script>





</body>
</html>