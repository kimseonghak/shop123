<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/admin/css/common.css">
<meta charset="UTF-8">
<title>123상회 farmQNA관리</title>
<style>
	#mainContents{
		padding: 0px;
	}
	#backgroundColor{
		border-top-left-radius:1vw;
		width:100%;
		height:100%;
		padding: 10px;
		padding-left:20px;
		padding-right:20px;
		background-color: rgba(72,187,120,0.1);
	}
	#titleSpace{
		border:1px solid #198754;
		width:10%;
		height:5vmin;
		text-align: center;
		border-radius: 10px;
		background-color: white;
		color:#198754;
		font-weight: bold;
		margin-bottom:1%;
	}
	#title{
		display:block;
		font-size: 3vmin;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		cursor: pointer;
	}
	#qnaWrap{
		width:100%;
		height:60%;
		font-family: 'Nanum Gothic', 'sans-serif';
		font-size:1.7vmin;
		background-color: white;
	}
/* 제목부터 내용 답변까지 공용 css */
	.contentCSS{
		padding-left: 10px;
		line-height: 290%;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		float:left;
	}
	.form-group{
		width:100%;
		height:10%;
	}
/* 제목 및 농가이름 css */
	.infor-group{
		width:15%;
		height:100%;
		border:1px solid #e4e4e4;
		border-left:none;
	}
	.output-group{
		width:85%;
		height:100%;
		border:1px solid #e4e4e4;
		border-right:none;
	}
/* 내용 부분 css */
	#infor-content{
		width:15%;
		height:80%;
		border:1px solid #e4e4e4;
		border-left:none
	}
	#output-content{
		width:85%;
		height:80%;
		float:left;
		border:1px solid #e4e4e4;
		border-right:none;
	}
	#contentText{
		width:100%;
		height:100%;
		resize: none;
		background-color: white;
		padding:5px;
		border:none;
	}

/* 답변 부분 CSS */
	#qnaAnswerWrap{
		width:100%;
		height:20%;
		font-family: 'Nanum Gothic', 'sans-serif';
		font-size:1.7vmin;
		background-color: white;
	}
	#infoAnswer{
		float:left;
		width:15%;
		height:100%;
		border:1px solid #e4e4e4;
		border-left:none;
		border-bottom:none;
		padding-left:10px;
		line-height: 300%;
	}
	#inputAnswer{
		float:left;
		width:80%;
		height:100%;
		border:1px solid #e4e4e4;
		border-right:none;
		line-height: 30px;
		border-bottom:none;
		padding:10px;
	}
	#inputAnswer textarea{
		width:100%;
		height:100%;
		resize:none;
		background-color: white;
		border:1px solid #e4e4e4;
		border-radius: 10px;
		padding:5px;
		font-size:16px;
	}
	#inputAnswer textarea:focus{
		outline: none;
	}
	#answerForm{
		width:100%;
		height:100%;
	}
/* 버튼 부분 CSS */
	#btnListWrap{
		width:100%;
		height:7vh;
		text-align: right;
		margin-bottom: 3vh;
		padding-top:0.8%;
		padding-right:0.8%;
	}
	.btn{
		font-size: 1.7vmin;
		border: 1px solid #198754;
		border-radius:3px;
		color:#198754;
		background-color: white;
		height:3.5vh;
		width:4vw;
		cursor: pointer;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp" />
	<div id="bodyWrap">
		<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp" />
		<%-- mainContents --%>
		<div id="mainContents">
			<div id="backgroundColor">
				<div id="titleSpace">
					<span id="title">User QNA</span>
				</div>
				<div id="qnaWrap">
					<div class="form-group" style="border-top:1px solid black;">
						<div class="infor-group contentCSS">
							문의 제목
						</div>
						<div class="output-group contentCSS">
							${qUser.questionUserTitle }
						</div>
					</div>
					<div class="form-group">
						<div class="infor-group contentCSS">
							유저 닉네임 (번호)
						</div>
						<div class="output-group contentCSS">
							${qUser.userNick }(${qUser.userNo })
						</div>
					</div>
					<div id="infor-content" class="contentCSS">
						문의 내용
					</div>
					<div id="output-content">
						<textarea id="contentText" disabled="disabled">${qUser.questionUserContent }</textarea>
					</div>
				</div>
				<div id="qnaAnswerWrap" style="border-bottom:1px solid black; border-top:1px solid black;">
					<div id="infoAnswer">
						답변내용
					</div>
					<div id="inputAnswer">
						<form action="/qustionUser/questionAnswer.do" method="post" id="answerForm">
							<input type="hidden" value="AU" name="questionWriter">
							<input type="hidden" value="${qUser.questionUserNo}" name="questionBoardNo">
							<input type="hidden" value="U" name="questionBoardCode">
							<input type="hidden" value="${qUser.questionUserAnswerYN}" name="questionUserAnswerYN">
							<input type="hidden" value="${currentPage}" name="currentPage">
							<input type="hidden" value="${type}" name="type">
							<input type="hidden" value="${keyword}" name="keyword">
							<textarea name="questionAnswerContent" id="answerArea">${qAnswer.questionAnswerContent }</textarea>
						</form>
					</div>
				</div>
				<div id="btnListWrap">
					<button class="btn" id="answerBtn">등록</button>
					<button class="btn" id="listBtn">목록</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script>
<%-- 사이드바 선택 표시 --%>
	$(function() {
		$('#mainUl>li').eq(3).css('background-color', '#34734e');
		$('#mainUl>li>a').eq(3).css('color', 'white');
		$('#mainUl>li>a').eq(3).css('font-weight','bolder');
	});
	<%-- 해당 페이지 최초 페이지 이동 --%>
		$('#title').click(function(){
			location.replace('/admin/adminUserQNAPage.do');
		});
	<%-- 리스트 버튼 돌아가기 --%>
		$('#listBtn').click(function(){
			var type = "${type}";
			var keyword = "${keyword}";
			var currentPage = ${currentPage};
			location.replace('/admin/adminUserQNAPage.do?currentPage='+currentPage+'&type='+type+'&keyword='+keyword);
		})
	<%-- 답변 등록 버튼 실행 --%>
		$('#answerBtn').click(function(){
			$('#answerForm').submit();
		});
</script>
</body>
</html>