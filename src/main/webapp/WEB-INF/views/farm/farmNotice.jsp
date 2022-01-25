<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
<%@ include file="/resources/farm/common/farmMainHeader.jsp"%>
<%@ include file="/resources/farm/common/farmMainSidebar.jsp"%>


 <div id="farmMainContentWrapper">
        <div id="farmContent1"></div>
        <div id="farmContent2">
            <div id="farmContentHeader">
                <span id="contnentTitle">문의사항</span>
            </div>
            <div id="farmContentContent">
                <div id="serchArea">
                    <form action="" method="get">
                         <select style="width:60px;height:30px" id="serchSelect">
                            <option value="subject">제목</option> 
                            <option value="content">내용</option>
                            <option value="content">작성자</option>
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
                                <th class="subject">제목</th>
                                <th class="writer">작성자</th>
                                <th class="writeDate">작성일</th>
                           </tr>
                         <tbody>
                           <tr>
                               <td>1</td>
                                <td class="subject">배송 언제쯤 도착하나요배송 언제쯤 도착하나요배송 언제쯤 도착하나요123  </td>
                                <td class="writer">홍길동</td>
                                <td class="writeDate">2022/01/25</td>
                           </tr>
                            <tr>
                               <td>2</td>
                                <td class="subject">두번째 문의</td>
                                 <td class="writer">고길동</td>
                                <td class="writeDate">2022/01/25</td>
                            </tr>
                          </tbody>
                    </table>
                    
                </div>
            </div>
            <div id="farmContentFooter"></div>
        </div>
        <!--page Navi-->
        <div id="farmContent3"></div>
    </div>
</body>
	



</body>
</html>