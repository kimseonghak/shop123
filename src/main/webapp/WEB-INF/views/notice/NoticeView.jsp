<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- jstl 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<%--jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<%-- 폰트 설정 라이브러리 --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<%-- 부트스트랩 라이브러리 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%-- css import --%>

<title>Insert title here</title>
</head>

<style>

*{
	box-sizing: border-box;
}

html {
	height: 100%;
}
body {
	height: 100%;
}

.wrapForm{
	width: 100%;
	min-height: 100%;
}

.headerForm{
	width: 100%;
	height: 175px;
}

.contentForm{
	padding: 30px;
	width: 100%;
	
}

.footerForm{
	width: 100%;
	height: 242px;
}

.contentwrap{
	width: 65%;
	height: 80%;
	margin: 100px auto;
	padding: 10px;
	background-color: white;
	border-radius: 5px/5px;
	box-shadow: 3px 3px 10px #aeaeae;
}

.titleform1{
	width: 95%;
	height: 50px;
	border-bottom: 1px solid black;
	position: relative;
	padding: 10px;
	margin-top: 20px;
	margin-botton: 50px;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.tag-select{
	text-align: left;
	float: left;
	
}

.title{
	width: 75%;
	text-align: left;
	float: left;
	margin-left: 10px;
}

.titleform2{
	width: 95%;
	height: 40px;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

.icon{
	width:17.5px;
	height:17.5px;
	margin-bottom: -3px;
}

.time{
	text-align: left;
	float: left;
	margin-left: 20px;
	margin-top:10px;
}

.hit{
	float: left;
	margin-left: 40px;
	margin-top:10px;
}

.context{
	width: 85%;
	min-height: 200px;
	margin-top: 50px;
}

.empty{
	width: 100%;
	height: 50px;
}

.btnForm{
	width: 95%;
	height: 40px;
	padding: 10px;
	margin-top: 40px;
	text-align: center;
	border-top: 1px solid #2a2a2a;
}

.listBtn{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	margin-top: 10px;
	cursor : pointer;
}

.deleteBtn{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	margin-top: 10px;
	cursor : pointer;
}

.updateBtn{
	width: 130px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
	margin-top: 10px;
	cursor : pointer;
}

</style>

<body>

<div id="wrapForm" align="center">
	<div class="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>

	<div class="contentForm">
		<div class="contentwrap">
		
			<%-- 필요한 name 데이터 --%>
			<input type="hidden" name="noticeNo" value="${map.notice.noticeNo }">
				
		
			<%-- 태그, 제목, 작성자 영역 --%>
			<div class="titleform1">
				<div class="tag-select">
				<c:if test="${map.notice.noticeCategory eq 'Category-1' }">
					<span>[기타]</span>
				</c:if>
				<c:if test="${map.notice.noticeCategory eq 'Category-2' }">
					<span>[회원가입]</span>
				</c:if>
				<c:if test="${map.notice.noticeCategory eq 'Category-3' }">
					<span>[경매]</span>
				</c:if>
				</div>
				<div class="title">
					<span>${map.notice.noticeTitle}</span>
				</div>
				
			</div>
			
			<%-- 작성일, 조회수 영역 --%>
			<div class="titleform2">
				<div class="time">
					<img class="icon" src="/resources/icon/clock_icon.png"/>
					<span>${map.notice.noticeRegdate}</span>
				</div>
				<div class="hit">
					<img class="icon" src="/resources/icon/hit_icon.png"/>
					<span>${map.notice.noticeCount}</span>
				</div>
			</div>
			
			<%-- 게시글 영역 --%>
			<div class="content_zone">
				<div class="context">
					<p>${map.notice.noticeContent}</p>
				</div>
			</div>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
			<%-- 버튼 영역 --%>
			<div class="btnForm">
				<c:if test="${farm != null && (farm.rating eq 'admin' or farm.rating eq 'root')}"> 
					<button type="button" class="deleteBtn">글 삭제</button>
					<button type="submit" class="updateBtn">글 수정</button>
				</c:if>
				<button type="button" class="listBtn">메인으로</button>
			</div>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
		</div>
	</div>

	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>	
</div>

<script>
<%-- 글 목록으로 돌아가는 버튼 --%>
$('.listBtn').click(function(){
	var currentPage = ${currentPage};
	var type = "${type}";
	var keyword = "${keyword}";
	location.replace('/notice/noticeListPage.do?currentPage='+currentPage+'&type='+type+'&keyword='+keyword);
});

<%-- 글 수정 버튼 --%>
$('.updateBtn').click(function(){
	var noticeNo=${map.notice.noticeNo};
	location.replace('/notice/noticeUpdatePage.do?noticeNo='+noticeNo);
});

<%-- 글 삭제 버튼 --%>
$('.deleteBtn').click(function(){
	if(window.confirm('게시글을 삭제하시겠습니까?')){

		var form = "${map.notice.noticeNo }";
		console.log(form);
		
        var formTag = document.createElement("form");
        formTag.setAttribute("action",'/notice/noticeDelete.do');
        formTag.setAttribute("method",'post');

        var inputTag = document.createElement("input");
        inputTag.setAttribute("type","hidden");
        inputTag.setAttribute("name","noticeNo");
        inputTag.setAttribute("value","${map.notice.noticeNo }");

        formTag.appendChild(inputTag);//폼 테그안에 인풋 태그 넣고
        document.body.appendChild(formTag);//폼 테그를 연결시켜준다
        formTag.submit();
    }else{
        alert('삭제를 취소하셨습니다.');
    }
});
</script>

</body>
</html>