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
		<div id="question_background">
			<form action='/question/questionWrite.do' method="post" id="textWrite">
				<input type="hidden" name="questionphotoNo" value="1">
				<div id="question_name">
					<h3>불편 사항을 적어주세요</h3>
				</div>
<%-- 문의 내용 설정하는 곳 --%>
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
				<div id="question_CategorieForm03" style="display: none;">
					<span style="font-size: 20px; color: #08E200;">주문번호 : </span>
					<input type="text" id="GoodsNo" name="OrderNo" placeholder="주문 번호를 적어주세요" readonly="readonly"/>
					<button type="button" id="buyListCheckBtn">구매 내역 확인</button>
				</div>
<%-- 문의 대상 설정하는 곳 --%>
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
				<div id="question_farmForm03" style="display: none;">
					<span style="font-size: 20px; color: #08E200;">농가번호 : </span>
					<input type="text" id="farmNo" name="farmNo" value="1" placeholder="농가 번호를 적어주세요"/>
					<button type="button" id="farmCheckBtn">농가 검색</button>
				</div>
				<br>
<%-- 본문 시작 --%>
				<br>
				<div id="question_titleForm">
					<input type="text" name="questionUserTitle" id="question_title" placeholder="글 제목을 적어주세요">
				</div><br>
				<div id="question_contentForm">
					<textarea placeholder="글 내용을 적어주세요" name="questionUserContent" id="question_content" style="resize: none;"></textarea>
				</div><br>
			</form>	
<%-- 파일 업로드 --%>
			<div id="img_Form">
				<input type="file" name="file"/>
				<button id="img_Submit">업로드하기</button>
			</div>
			<br>
			<br>
<%-- 버튼 목록 --%>
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
<%-- footer --%>
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>


<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
<%-- 농가 선택시 농가번호 입력 폼 생성 --%>
	$('#questionUserClassify').change(function(){
		var result = $('#questionUserClassify option:selected').val();
		if(result == 'F'){
			$('#question_farmForm03').css("display", "block");
		}else{
			$('#question_farmForm03').css("display", "none");
		}
	});
<%-- 환불 선택시 환불 입력 폼 생성 --%>
	$('#questionUserCode').change(function(){
		var result = $('#questionUserCode option:selected').val();
		if(result == 'Q-1'){
			$('#question_CategorieForm03').css("display", "block");
		}else{
			$('#question_CategorieForm03').css("display", "none");
		}
	});
<%-- 환불 선택시 입력 못하게 막는 스크립트 --%>
	$('#questionUserCode').on("change",function(){
		if($(this).val()=='Q-1'){
			$('#questionUserClassify').val('F');
			$('#questionUserClassify option').eq(2).prop("disabled",true)
			$('#question_farmForm03').css("display","block");
			$('#farmNo').prop("readonly",true);
		}else{
			$('#farmNo').prop("readonly",false);
			$('#questionUserClassify option').eq(2).prop("disabled",false)
		}
	});
<%-- 파일 ajax 처리 업로드 --%>
	$('#img_Submit').click(function(){
	    var formData = new FormData();
	
	    var inputFile = $("input[name='file']");
	
	    var files = inputFile[0].files;
	
	    formData.append("file", files[0]);
	
	    $.ajax({
	        url : "/question/questionWriteFileUpload.do",
	        processData : false,
	        contentType : false,
	        data : formData,
	        type : "POST",
	        success:function(result){
	            if(result != null && result != 0){
	                alert("파일이 업로드되었습니다.");
	                $("input[name='questionphotoNo']").val(result);
	                console.log($("input[name='questionphotoNo']").val());
	            }else{
	                alert("파일 업로드에 실패하였습니다.");
	            }
	
	        }
	    });
	});
	$('#submitBtn').click(function(){
		$("#textWrite").submit();
	});

<%-- 구매내역 확인 버튼 --%>
	$('#buyListCheckBtn').click(function(){
		window.open("/question/buyListCheckPage.do","_blank","width=800px, height=500px");
	});
<%-- 농가 번호 검색 버튼 --%>
	$('#farmCheckBtn').click(function(){
		window.open("/question/farmCheck.do","_blank","width=400px, height=400px");
	});
</script>
</body>
</html>