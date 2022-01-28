<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>


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

#local_background{
	width: 70%;
	height: 80%;
	margin : 20px auto;
	border-radius: 15px/15px;
	background-color: white;
}

#local_name{
	width: 90%;
	height: 40px;
	font-size: 30px;
	margin: 20px auto;
	font : normal bold 22.5px "Nanum Gothic",sans-serif;
	color: #3BBD5A;
}

#local_Form{
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

#local_titleForm{
	width: 60%;
	height: 30px;
	text-align: left;
	border: none;
}

#local_title{
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
	font-size: 20px;
	outline: none;
}

#local_contentForm{
	width: 60%;
	height: 300px;
	text-align: left;
}

#local_content{
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
	
	<div id="contentForm" align="center"><br>
		<div id="local_background">
			<div id="local_name">
				<span>지역 특산물 작성</span>
			</div>
			
			<div id="local_Form">
			
				<div id="optionForm_01">카테고리 : </div>
	
					<div id="optionForm_1">
						<select required>
							<option value="" disabled selected>지역 선택</option>
							<option>전체</option>
							<option>서울</option>
							<option>경기도</option>
							<option>강원도</option>
							<option>충청북도</option>
							<option>충청남도</option>
							<option>경상북도</option>
							<option>경상남도</option>
							<option>전라북도</option>
							<option>전라남도</option>
							<option>제주도</option>
						</select>
						
					</div>

			</div><br>
		
		<div id="local_titleForm">
			<input type="text" id="local_title" placeholder="제목을 입력하시오"/>
		</div><br>
		<div id="local_contentForm">
			<textarea id="local_content" placeholder="내용을 입력하시오"></textarea>
		</div><br>
		
		<div id="img_Form">
			<input type="file" id="file_submit"/>
		</div><br>
		
		<div id="write_Btn_form">
				<button id="list_btn">리스트</button>
				<button id="reset_btn">다시 쓰기</button>
				<button id="submit_btn">글 작성하기</button>
		</div>
	</div><br>
	
	</div>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>