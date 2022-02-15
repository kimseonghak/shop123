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
	border-radius: 5px;
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
	width:17px;
	height:17px;
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
	margin-left: 20px;
	margin-top:5px;
}

.img{
	width: 60%;
	height: 500px;
	margin-top: 50px;
	border-radius: 15px;
}

.context{
	width: 85%;
	min-height: 200px;
	margin-top: 50px;
	text-align: left;
}

.empty{
	width: 100%;
	height: 50px;
}

.btnForm{
	width: 90%;
	height: 40px;
	padding: 10px;
	margin-top: 40px;
	text-align: center;
	border-top: 1px solid #2a2a2a;
}

.mainBtn{
	width: 130px;
	height: 40px;
	background-color: gray;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;	
	border : none;
	margin-right: 20px;
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
		
		<form action="/productintro/SeasonProductUpdatePage.do" method="get">
		<input type="hidden" name="originalSeasonphotoNo" value="1">
		<input type="hidden" name="seasonProductNo" value="${seasonBoard.seasonProductNo }">
		<input type="hidden" name="seasonProductPhotoFilePath" value="${seasonBoard.seasonProductPhotoFilePath }">
			<%-- 태그, 제목, 작성자 영역 --%>
			<div class="titleform1">
				<div class="tag-select">
					<span>${seasonBoard.seasonProductClassify } 월</span>
				</div>
				<div class="title">
					<span>${seasonBoard.seasonProductTitle }</span>
				</div>
				
			</div>
			
			<%-- 작성일, 조회수 영역 --%>
			<div class="titleform2">
				<div class="time">
					<img class="icon" src="/resources/icon/clock_icon.png"/>
					<span>${seasonBoard.seasonProductRegDate }</span>
				</div>
			</div>
			
			<%-- 게시글 영역 --%>
			<div class="content_zone">
				<div class="img">
					<img src="${seasonBoard.seasonProductPhotoFilePath }" style="width: 100%; height: 100%;"/>
				</div>
				<div class="context">
					<p>${seasonBoard.seasonProductContent }</p>
				</div>
			</div>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
			<%-- 버튼 영역 --%>
			<div class="btnForm">
				<c:if test="${farm != null && (farm.rating eq 'admin' or farm.rating eq 'root')}">
					<button type="button" class="deleteBtn">글 삭제</button>
					<button class="updateBtn">글 수정</button>
				</c:if>
				<input type="button" class="mainBtn" value="리스트" onclick="location='/productintro/SeasonProductListPage.do'">
			</div>
		</form>
			
			<%-- 빈 공간 --%>
			<div class="empty"></div>
			
		</div>
	</div>

	<div class="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>	
</div>

<script>
	$('.deleteBtn').click(function(){
	    if(window.confirm('삭제할건가요?')){
	        var formTag = document.createElement("form");
	        formTag.setAttribute("action",'/productintro/seasonDelete.do');
	        formTag.setAttribute("method",'post');
	
	        var inputTag = document.createElement("input");
	        inputTag.setAttribute("type","hidden");
	        inputTag.setAttribute("name","seasonProductNo");
	        inputTag.setAttribute("value","${seasonBoard.seasonProductNo}");
	
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