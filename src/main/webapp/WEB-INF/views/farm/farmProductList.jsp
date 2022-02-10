<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
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
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmProductList.css">


<style>
	 #naviArea
	 {
	 	display:inline-block;
	 	margin-left:450px;
	 	text-align: center;
	 }
</style>


</head>
<body>
<c:import url="/resources/farm/common/farmMainHeader.jsp"/>
<c:import url="/resources/farm/common/farmMainSidebar.jsp"/>

<div id="farmMainContentWrapper">
        <div id="farmContent1"></div>
        <div id="farmContent2">
            <div id="farmContentHeader">
                <span id="contnentTitle">낙찰 상품</span>
            </div>
            <div id="farmContentContent">
                <div id="serchArea">
                    <form action="/farm/farmProductListPage.do" method="get">
                         <select name="type" style="width:90px;height:30px" id="serchSelect">
	                          <c:choose>
	                          		<c:when test="${type eq 'productName'}">
	                            		<option value="productName" selected='selected'>상품명</option> 
	                            		<option value="auctionNo">경매번호</option>
	                            	</c:when>
	                            		<c:when test="${type eq 'auctionNo'}">
	                            		<option value="productName">상품명</option> 
	                            		<option value="auctionNo" selected='selected'>경매번호</option>
	                            	</c:when>	
	                            	<c:otherwise>
	                            		<option value="productName">상품명</option> 
	                            		<option value="auctionNo">경매번호</option>
	                            	</c:otherwise>	
	                         </c:choose>	
                          </select>
                    <input type="text" name="keyWord" size="30" id=serchKeyword value="${requestScope.keyWord}">
                    <button type="submit" class="btn btn-outline-success btn-sm">검색</button>
                </form>
                    
                </div>
                <div id="emptyArea"></div>
                <div id="contentArea">
              <c:choose>          
  					<c:when test="${!requestScope.list.isEmpty()}">
	                    <table>
	                           <tr>
	                                <th>번호</th>
	                                <th >경매번호</th>
	                                <th class="productName">상품명</th>
	                                <th class="amount">낙찰금액</th>
	                                <th class="soldDate">낙찰일자</th>
	                           </tr>
	                         <tbody>
	                         <c:forEach items="${requestScope.list}" var="p" varStatus="i">
	                           <tr>
	                               <td>${i.count}</td>
	                                <td>${p.getAuctionNo()}</td>
	                                <td class="productName">${p.getAuctionProduct()}</td>
	                                <td class="amount">${p.getAuctionPrice()}</td>
	                                <td class="soldDate">${p.getAuctionEnd()}</td>
	                           </tr>
	                     	 </c:forEach>
	                          </tbody>
	                   	</table>
	    			</c:when>
				    <c:otherwise>
				    	<H4 style="text-align:center; position:relative; bottom:-100px">현재 낙찰된 상품이 없습니다.</H4>
				    </c:otherwise>
			</c:choose>                    
			 </div>
            </div>
            <!--page Navi-->
            <div id="farmContentFooter">
            	<div id="naviArea">
	            	<c:choose>
	            		<c:when test="${!requestScope.list.isEmpty()}">
	            				${requestScope.pageNavi}
	            		</c:when>
	            	</c:choose>
            	</div>
            </div>
        </div>
        <div id="farmContent3"></div>
    </div>



  <!-- sidebar 효과 -->
   <script>
	    $(function() {
	        $('#mainUl>li').eq(4).css('background-color', '#34734e');
	        $('#mainUl>li').eq(4).css('color', 'white');
	        $('#mainUl>li').eq(4).css('font-weight','bolder');
	    });
    
  </script>


</body>
</html>