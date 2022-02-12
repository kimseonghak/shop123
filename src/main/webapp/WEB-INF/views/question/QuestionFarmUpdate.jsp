<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>문의 사항 조회하기</title>

<style type="text/css">
*{
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1617px;
	
}

#headerForm{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 1200px;
	background-color: #f0f0f0;
}

#footerForm{
	width: 100%;
	height: 242px;
}

#question_background{
	width: 80%;
	height: 80%;
	border: 2px solid white;
	border-radius: 20px;
	margin : 100px auto;
	background-color: white;
}

#question_name{
	width: 90%;
	height: 80px;
	color: #3BBD5A;
	font-size: 30px;
	margin: 30px auto;
}


/*문의 대상 폼*/
#question_farmForm{
	width: 80%;
	height: 30px;
	text-align: left;
}

#question_farmForm02{
	width: 20%;
	height: 30px;
	text-align: left;
	display : inline-block;
}

#question_farmForm03{
	width: 80%;
	height: 60px;
	text-align: left;
	display : inline-block;
	margin: 20px auto;
}
/*문의 대상 폼 끝*/


#farmNo{
	width: 50%;
	height: 30px;
	border: none;
	border-radious: 5px;
	background-color: #f0f0f0;
	outline: none;
}

#GoodsNo{
	width: 50%;
	height: 30px;
	border: none;
	border-radious: 5px;
	background-color: #f0f0f0;
	outline: none;
}


/*문의 카테코리 폼*/
#question_CategorieForm{
	width: 80%;
	height: 30px;
	text-align: left;
	margin: 20px auto;
}

#question_CategorieForm02{
	width: 20%;
	height: 30px;
	text-align: left;
	display : inline-block;
}

#question_CategorieForm03{
	width: 80%;
	height: 60px;
	text-align: left;
	display : inline-block;
	margin: 10px auto;
}
/*문의 카테코리 폼 끝*/


#question_titleForm{
	width: 80%;
	height: 30px;
	text-align: left;
}

#question_title{
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
	font-size: 20px;
	outline: none;
}

#question_contentForm{
	width: 80%;
	height: 400px;
	text-align: left;
}

#question_content{
	width: 100%;
	height: 100%;
	font-size: 20px;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
	resize: none;
	outline: none;
}

#img_Form{
	width: 80%;
	height: 30px;
	text-align: left;
}

#img_Submit{
	float: right;
	width: 100px;
	height: 30px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 15px;
	border : none;
	cursor : pointer;
}

#write_Btn_form{
	width: 80%;
	height: 40px;
}

#submit_btn{
	width: 100px;
	height: 40px;
	float: right;
}
#list_btn{
	width: 100px;
	height: 40px;
	float: right;
}
#reset_btn{
	width: 100px;
	height: 40px;
	float: right;
}

#submitBtn{
	width: 90px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
}

#listBtn{
	width: 90px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;
	border : none;
	cursor : pointer;	
	
}

#resetBtn{
	width: 90px;
	height: 40px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
}


select{
	width: 100%;
	height: 100%;
	-webkit-appearance:none; /* 크롬 화살표 없애기 */
    -moz-appearance:none; /* 파이어폭스 화살표 없애기 */
    appearance:none; /* 화살표 없애기 */
    font-size: 20px;
    background-color: #f0f0f0;
}

select option[value=""][disabled] {
	display: none;
}

</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	<div id="contentForm">
	<form action='/question/questionFarmUpdate.do' method="post">
	<input type="hidden" name="questionFarmNo" value="${map.qFarm.questionFarmNo }">
	<input type="hidden" name="farmNo" value="${map.qFarm.farmNo }">
	
		<div id="question_background">
				<div id="question_name">
					<h3>불편 사항을 적어주세요</h3>
				</div>


<%-- 본문 시작 --%>
				<br>
				<div id="question_titleForm">
					<input type="text" name="questionFarmTitle" value="${map.qFarm.questionFarmTitle }" id="question_title" placeholder="글 제목을 적어주세요">
				</div><br>
				
				<div id="question_contentForm">
					<textarea placeholder="글 내용을 적어주세요" name="questionFarmContent" id="question_content" style="resize: none;">${map.qFarm.questionFarmContent }</textarea>
				</div><br>

			<br>
			<br>
<%-- 버튼 목록 --%>
			<div id="write_Btn_form">
				<div id="submit_btn">
					<input type="submit" id="submitBtn" value="글수정"/>
				</div>
				<div id="list_btn">
					<input type="button" id="listBtn" value="리스트" onclick="location='/question/QuestionFarmPage.do'">
				</div>
				<div id="reset_btn">
					<input type="reset" value="다시쓰기" id="resetBtn"/>
				</div>
			</div>
		</div>
	</form>	
	</div>
<%-- footer --%>
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>



</body>
</html>