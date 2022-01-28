<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<title>문의 사항 조회하기</title>

<style type="text/css">
*{
	box-sizing: border-box;
}


#warpForm{
	width: 100%;
	height: 1417;
}

#headerForm{
	width: 100%;
	height: 175px;
	
}

#contentForm{
	width: 100%;
	height: 1000px;
}

#footerForm{
	width: 100%;
	height: 242px;
}

#question_background{
	width: 80%;
	height: 90%;
	border: 2px solid #08E200;
	border-radius: 20px;
	margin : 50px auto;
}

#question_name{
	width: 90%;
	height: 80px;
	color: #08E200;
	font-size: 30px;
	margin: 30px auto;
}

#question_categoryForm{
	width: 80%;
	height: 30px;
	text-align: left;
}

#question_categoryForm02{
	width: 20%;
	height: 30px;
	text-align: left;
	display : inline-block;
}

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

.file-button{
	width: 100%;
	height: 30px;
	background-color:#08E200;
	border-radius: 4px;
	font-size: 20px;
	color: white;
	cursor: pointer;
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
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
}

#listBtn{
	width: 90px;
	height: 40px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;
	border : none;
	cursor : pointer;	
	
}

#resetBtn{
	width: 90px;
	height: 40px;
	background-color: #9B9B9B;
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
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
		
	
		<div id="contentForm">
		<div id="question_background">
		
			<div id="question_name">
				<h3>불편 사항을 적어주세요</h3>
			</div><br>
		
			<div id="question_categoryForm">
				<span style="font-size: 20px; color: #08E200;">카테고리 : </span>
				<div id="question_categoryForm02">
					<select required>
						<option value="" disabled selected>문의 목록</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
			</div><br>

			<div id="question_titleForm">
				<input type="text" id="question_title" placeholder="글 제목을 적어주세요">
			</div><br>

			<div id="question_contentForm">
				<textarea placeholder="글 내용을 적어주세요" id="question_content" style="resize: none;"></textarea>
			</div><br>
			
			<div id="img_Form">
				<label class="file-button" for="file_submit">파일 업로드</label>
				<input type="file" id="file_submit" style="display:none;"/>
			</div><br>

			<div id="write_Btn_form">
				<div id="submit_btn"><button id="submitBtn">수정하기</button></div>
				<div id="list_btn"><button id="listBtn">리스트</button></div>
				<div id="reset_btn"><button id="resetBtn">다시 쓰기</button></div>
			</div>
		</div><br>
		</div>
	

	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>