<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	width: 88.5%;
	height: 30px;
	border: none;
	border-radious: 5px;
	background-color: #f0f0f0;
	outline: none;
}

#GoodsNo{
	width: 88.5%;
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
		<div id="question_background">
			<form action='/question/questionWrite.do' method="post" id="textWrite">
			
			
				<div id="question_name">
					<h3>불편 사항을 적어주세요</h3>
				</div>
				
				<!-- 문의 대상 설정하는 곳 -->
				<div id="question_farmForm">
					<span style="font-size: 20px; color: #08E200;">카테고리 : </span>
					<div id="question_farmForm02">
						<select id="questionUserClassify" name="questionUserClassify" required>
							<option value="" disabled selected>문의 대상</option>
							<option value="F">농가</option>
							<option value="A">운영자</option>
						</select>
					</div>
				</div>
	
				<script>
					$('#questionUserClassify').change(function(){
						var result = $('#questionUserClassify option:selected').val();
						if(result == 'F'){
							$('#question_farmForm03').css("display", "block");
						}else{
							$('#question_farmForm03').css("display", "none");
						}
					});
				</script>
	
				<div id="question_farmForm03" style="display: none;">
					<span style="font-size: 20px; color: #08E200;">농가번호 : </span>
					<input type="text" id="farmNo" placeholder="농가 번호를 적어주세요"/>
				</div>
				<!-- 문의 대상 설정하는 곳 끝-->
				
				<!-- 문의 내용 설정하는 곳 -->
				<div id="question_CategorieForm">
					<span style="font-size: 20px; color: #08E200;">문의내역 : </span>
					<div id="question_CategorieForm02">
						<select id="questionUserCode" name="questionUserCode" required>
							<option value="" disabled selected>문의 목록</option>
							<option value='Q-1'>환불</option>
							<option value='Q-2'>문의</option>
						</select>
					</div>
				</div>
	
				<script>
					$('#questionUserCode').change(function(){
						var result = $('#questionUserCode option:selected').val();
						if(result == 'Q-1'){
							$('#question_CategorieForm03').css("display", "block");
						}else{
							$('#question_CategorieForm03').css("display", "none");
						}
					});
				</script>
	
				<div id="question_CategorieForm03" style="display: none;">
					<span style="font-size: 20px; color: #08E200;">상품번호 : </span>
					<input type="text" id="GoodsNo" placeholder="상품 번호를 적어주세요"/>
				</div><br>
				<!-- 문의 내용 설정하는 곳 끝 -->
				
				<br>
				
				<div id="question_titleForm">
					<input type="text" name="questionUserTitle" id="question_title" placeholder="글 제목을 적어주세요">
				</div><br>
	
				<div id="question_contentForm">
					<textarea placeholder="글 내용을 적어주세요" name="questionUserContent" id="question_content" style="resize: none;"></textarea>
				</div><br>
			</form>	
			
			<form action="/question/questionWriteFileUpload.do" method="post" enctype="multipart/form-data">
				<div id="img_Form">
					<input type="file" name="file"/>
					<button id="img_Submit">업로드하기</button>
				</div>
			</form>
				
				<br>
				<br>
				<div id="write_Btn_form">
					<div id="submit_btn">
						<input type="submit" id="submitBtn" value="글 쓰기"/>
					</div>
									
					<div id="list_btn">
						<button id="listBtn" type="button">리스트</button>
					</div>
					
					<div id="reset_btn">
						<input type="reset" value="다시쓰기" id="resetBtn"/>
					</div>
				</div>
						
		</div>
	</div>
	

	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

<script>
	
</script>



</body>
</html>