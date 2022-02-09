<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

	*{
		box-sizing: border-box;
		font-family: 'Nanum Gothic', 'sans-serif';
	}
	a{
		text-decoration: none;
		color: inherit;
	}
	
	#warpForm{
		width: 100%;
	}
	
	#headerForm{
		width: 100%;
		height: 175px;
	}
	
	#contentForm{
		width: 100%;
		padding-top:130px;
	}
	
	#footerForm{
		width: 100%;
		height: 242px;
	}
	
	#questionWrap{
		width: 70%;
		height: 90%;
		border: none;
		border-radius: 5px;
		margin: 0 auto;
		background-color: white;
	}
	
	#question_name{
		width: 25%;
		height: 50px;
		font : normal bold 30px "Nanum Gothic",sans-serif;
		color: #08E200;
		margin: 0 auto;
		float:left;
	}
	
/* 검색 부분 CSS */
	#question_searchWrap{
		width: 75%;
		height: 50px;
		margin: 0 auto;
		float:left;
		
	}
	#question_search_textForm{
		float: right;
		width: 300px;
		height: 30px;
		margin-left: 5px;
	}
	#keyword{
		width: 100%;
		height: 100%;
		border: none;
		border-radius: 5px;
		background-color: #f0f0f0;
	}
	#question_search_btnForm{
		float: right;
		width: 70px;
		height: 30px;
		margin-left: 5px;
	}
	#searchbtn{
		width: 95%;
		height: 100%;
		border: none;
		color: #ffffff;
		border-radius: 5px;
		background-color: #3BBD5A;
		font-size: 18px;
		line-height:30px;
		cursor: pointer;
	}
	#qeustion_search_typeForm{
		float:right;
		height:30px;
		padding:1px;
	}
	#select{
		height:100%;
	}
	#select:focus{
		outline: none;
	}
	
/* 테이블 부분 CSS */
	#question_table_form{
		width: 100%;
		margin: 0 auto;
	}
	
	#question_table{
		width: 100%;
		border-spacing: none;
		text-align: center;
	}
	#question_table th{
		border-bottom: 2px solid black;
		height:31.5px;
	}
	#question_table td{
		height: 31.5px;
		line-height: 31.5px;
		border-bottom: 1px solid #e4e4e4;
	}
	#question_table tr:last-child>td{
		border-bottom: 2px solid black;
	}
	
	#question_search_writeForm{
		height: 40px;
		width: 100%;
	}
	
	#write_btn{
		width: 120px;
		height: 100%;
		float: right;
		border-radius: 5px;
		background-color:#3BBD5A;
		color: white;
		cursor: pointer;
		border: none;
	}
	
/* 페이지 네비 CSS */
	.naviArrow{
		text-decoration: none;
		display : inline-block;
		color: black;
		margin : 2px;
		width : 25px;
		height: 25px;
		font-weight: bolder;
		opacity: 0.3;
		line-height: 150%;
	}
	#currentNavi{
		text-decoration: none;
		display:inline-block;
		color: white;
		background-color:#48bb78;
		border : 1px solid #48bb78;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi{
		text-decoration: none;
		display:inline-block;
		color: #48bb78;
		border : 1px solid #48bb78;
		width : 25px;
		height: 25px;
		margin : 1px;
		font-weight: bolder;
		line-height: 150%;
	}
	.otherNavi:hover{
		color: white;
		background-color:#48bb78;
		opacity: 0.3;
	}

</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	<div id="contentForm" align="left"><br>
		<div id="questionWrap">
<%-- 타이틀 --%>  
			<div id="question_name">
				문의 게시판
			</div>
<%-- 검색 공간 --%>
			<div id="question_searchWrap">
				<form action="/question/QuestionUserPage.do" method="get">
					<div id="question_search_btnForm">
						<button id="searchbtn">검색</button>
					</div>
					<div id="question_search_textForm">
						<input type="text" id="keyword" name="keyword"/>
					</div>
					<div id="qeustion_search_typeForm">
						<select name="type" id="select">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="all">제목+내용</option>
						</select>
					</div>
				</form>
			</div>
			<hr style="border:1px solid black; margin-top:0px; margin-bottom:10px;">
<%-- 테이블 영역 --%>
			<div id="question_table_form" align="center">
				<table id="question_table">
					<tr>
						<th>문의 번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${map.list}" var="qUser">
                        <tr>
                            <td>${qUser.questionUserNo}</td>
                            <td>
                            <a href="/question/questionViewPage.do?questionUserNo=${qUser.questionUserNo}&currentPage=${currentPage}&type=${map.type}&keyword=${keyword}">${qUser.questionUserTitle}</a></td>
                            <td>${qUser.questionUserRegdate}</td>
                        </tr>
                    </c:forEach>
				</table>
			</div><br>
<%-- 페이지 네비게이션 --%>
			<div id="question_pageNavi" align="center">
				${map.pageNavi }
			</div>
<%-- 버튼 wrap --%>
			<div id="question_search_writeForm">
				<button id="write_btn">글 쓰기</button>
			</div>
		</div>
	</div><br>
		
	<div id="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>


<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
<%-- 네비화살표 hover시 투명도 조절 --%>
		$('.naviArrow').hover(function() {
			$(this).css('opacity', '1');
		}, function() {
			$(this).css('opacity', '0.3');
		});
<%-- 현재페이지가 10페이지 이하일 경우 이전 페이지목록 비활성화 --%>
		$(function() {
			var currentPage = ${currentPage};
			if (currentPage < 11) {
				$('#prev').removeAttr('href');
				$('#prev').unbind('mouseenter mouseleave');
			}
		});
<%-- 글쓰기 버튼 --%>
		$('#write_btn').click(function(){
			location.replace("/question/questionWritePage.do");
		});
</script>
</body>
</html>