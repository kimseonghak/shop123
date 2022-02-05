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
	<link rel="stylesheet" type="text/css" href="/resources/farm/css/farmNoticeContent.css">

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
                <span id="contnentTitle">공지사항</span>
            </div>
            <div id="farmContentContent">
                <div id="serchArea">
                    <form action="/farm/farmNoticePage.do" method="get">
                         <select name="type" style="width:60px;height:30px" id="serchSelect">
                          	<c:choose>
                          		<c:when test="${type eq 'subject'}">
		                            <option value="subject" selected='selected'>제목</option> 
		                            <option value="content">내용</option>
                            	</c:when>
                            	<c:when test="${type eq 'content'}">
		                            <option value="subject">제목</option> 
		                            <option value="content" selected='selected'>내용</option>
                            	</c:when>
                            	<c:otherwise>
                            		<option value="subject">제목</option> 
		                            <option value="content">내용</option>
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
              	 <c:when test="${!list.isEmpty()}">
                    <table>
                           <tr>
                                <th class="noticeNo">번호</th>
                                <th class="subject">제목</th>
                                <th class="writeDate">등록일</th>
                           </tr>
                         <tbody>
                         <c:forEach items="${requestScope.list}" var="n" varStatus="i">
                           <tr>
                               <td class="noticeNo">${i.count}</td>
                                <td class="subject"><span class="noticeTitle" noticeContent="${n.getNoticeContent()}">${n.getNoticeTitle()}</span></td>
                                <td class="writeDate">${n.getNoticeRegdate()}</td>
                           </tr>
                          </c:forEach>
                          </tbody>
                    </table>
                    </c:when>
                    <c:otherwise>
                    	<H2 style="text-align:center; position:relative; bottom:-100px">공지사항이 없습니다.</H2>
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
	        $('#mainUl>li').eq(0).css('background-color', '#34734e');
	        $('#mainUl>li').eq(0).css('color', 'white');
	        $('#mainUl>li').eq(0).css('font-weight','bolder');
	    });
    
  </script>
  
  <!-- 작성 내용 가져오기 -->
  <script>
  		$('.noticeTitle').click(function(){
  			
  			
  			var noticeContent=$(this).attr('noticeContent');
  			 var noticeTitle=$(this).text();
  			
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _width = '1000';
            var _height = '650';
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);
           
            window.open('/farm/farmNoticeContent.do?noticeContent='+noticeContent+'&noticeTitle='+noticeTitle+'', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
  			
  			
  		});
  
  
  
  
  </script>
  

</body>
</html>