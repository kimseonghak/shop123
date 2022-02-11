<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style type="text/css">
*{
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1317px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 900px;
	background-color: #f0f0f0;
}

#footerFrom{
	width: 100%;
	height: 242px;
}

#season_background{
	width: 70%;
	height: 80%;
	margin : 50px auto;
	border-radius: 15px/15px;
	background-color: white;
}

#season_name{
	width: 90%;
	height: 40px;
	font-size: 30px;
	margin: 20px auto;
	font : normal bold 22.5px "Nanum Gothic",sans-serif;
	color: #3BBD5A;
}

#season_Form{
	width: 60%;
	height: 30px;
	text-align: left;
	margin: 0 auto;
}

#optionForm_01{
	width: 110px;
	height: 30px;
	color: #3BBD5A;
	font : normal bold 24px "Nanum Gothic",sans-serif;
	float: left;
}

#optionForm_1{
	width: 110px;
	height: 30px;
	float: left;
	border: none;
}

#season_titleForm{
	width: 60%;
	height: 30px;
	text-align: left;
	border: none;
}

#season_title{
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
	font-size: 20px;
	outline: none;
}

#season_contentForm{
	width: 60%;
	height: 300px;
	text-align: left;
}

#season_content{
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
	width: 60%;
	height: 30px;
	text-align: left;
}


/*라벨 태그 가꾸는건 일단 보류*/

#write_Btn_form{
	width: 60%;
	height: 40px;
}

#submit_btn{
	width: 100px;
	height: 40px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	margin: 20px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}
#list_btn{
	width: 100px;
	height: 40px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	margin: 20px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}
#reset_btn{
	width: 100px;
	height: 40px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#9B9B9B;
	color: white;
	margin: 20px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
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

</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div id="contentForm" align="center"><br><br><br>
		<div id="season_background">
			<div id="season_name">
				제철 특산물 게시판 작성
			</div>
			
			<div id="season_Form">
			<form action="/season/SeasonWrite.do" id="textWrite" method="post" id="textWrite">
			<input type="hidden" name="SeasonProductPhotoNo" value="1">
					<div id="optionForm_01">카테고리 : </div>
		
						<div id="optionForm_1">
							<select required name="SeasonProductClassify">
								<option value="" disabled selected>월 선택</option>
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
							
						</div>
	
				</div><br>
			
			<div id="season_titleForm">
				<input type="text" id="season_title" name="SeasonProductTitle" placeholder="제목을 입력하시오"/>
			</div><br>
			<div id="season_contentForm">
				<textarea id="season_content" name="SeasonProductContent" placeholder="내용을 입력하시오"></textarea>
			</div><br>
		</form>
		
		<div id="img_Form">
			<input type="file" id="file_submit" name="file"/>
			<button id="img_Submit">업로드하기</button>
		</div><br>
		
		<div id="write_Btn_form">
				<input type="submit" id="submit_btn" value="글쓰기">
				<input type="button" value="리스트" onclick="location='/productintro/LocalProductListPage.do'">
				<button id="reset_btn">다시 쓰기</button>
		</div>
	</div><br>
	
	</div>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

<!-- 이미지 처리 -->
<script type="text/javascript">
	$('#img_Submit').click(function(){
		var formData = new FormData();
		var inputFile = $("input[name='file']");
		var files = inputFile[0].files;
		formData.append("file", files[0]);
		
		$.ajax({
			url : "/local/SeasonPhotoAjax.do",
			processData : false,
		    contentType : false,
		    data : formData,
		    type : "POST",
		    success:function(result){
		    	if(result != null && result != 0){
	                alert("파일이 업로드되었습니다.");
	                $("input[name='SeasonProductPhotoNo']").val(result);
	                console.log($("input[name='SeasonProductPhotoNo']").val());
	            }else{
	                alert("파일 업로드에 실패하였습니다.");
	            }
		    }
		});
	});


$("#submit_btn").click(function(){
	$("#textWrite").submit();
});
</script>

</body>
</html>