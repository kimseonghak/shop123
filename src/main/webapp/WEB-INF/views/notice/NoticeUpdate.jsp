<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta charset="UTF-8">
<title>공지 사항 작성하기</title>

<style type="text/css">

*{
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1217px;
}

#headerForm{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 800px;
	padding: 35px;
	background-color: #f0f0f0;
}

#footerForm{
	width: 100%;
	height: 242px;
}



#notice_userCategory_Form{
	width: 90%;
	height: 30px;
	text-align: left;
	-webkit-appearance:none;
	margin: 0 auto;
}

#noticeCategory_Form{
	width: 90%;
	height: 30px;
	text-align: left;
	margin: 0 auto;
	border-radius: 5px / 5px;
}

#notice_title_Form{
	width: 90%;
	height: 30px;
	text-align: left;
	margin: 0 auto;
	border-radius: 5px / 5px;
}

#notice_title{
	width: 100%;
	height: 100%;
	border-radius: 5px / 5px;
	border: none;
	background-color: #f0f0f0;
	outline: none;
	
}

#notice_content_Form{
	width: 90%;
	height: 400px;
	text-align: left;
	margin: 0 auto;
	
}

#notice_content{
	width: 100%;
	height: 100%;
	border-radius: 5px / 5px;
	border: none;
	background-color: #f0f0f0;
	outline: none;
}

#content_background{
	width: 60%;
	height: 100%;
	border-radius: 5px / 5px;
	background-color: white;
}

/*버튼 디자인*/
#write_Btn_form{
	width: 90%;
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
	width: 95px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
}

#mainBtn{
	width: 95px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
}

#resetBtn{
	width: 95px;
	height: 40px;
	background-color: #9B9B9B;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
}

#notice_name{
	width: 80%;
	height: 60px;
	margin: 10px auto;
}

/*옵션 테그*/
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

#notice_content{
	
}

#font{
font : normal bold 22.5px "Nanum Gothic",sans-serif;
color: #3BBD5A;
}
</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div id="contentForm">
	<div id="content_background"><br>
		<div id="notice_name">
			<span id="font">공지사항을 작성해 주세요</span>
		</div>
	
		<div id="notice_userCategory_Form">
			<select required>
				<option value="" disabled selected>사용자 분류 카테고리</option>
				<option>1번</option>
				<option>2번</option>
				<option>3번</option>
				<option>4번</option>
			</select>
		</div><br>
				
		<div id="noticeCategory_Form">
			
			<select required>
				<option value="" disabled selected>공지사항 분류</option>
				<option>1번</option>
				<option>2번</option>
				<option>3번</option>
				<option>4번</option>
			</select>
		</div><br>
		
		<div id="notice_title_Form">
			<input type="text" id="notice_title" placeholder="제목을 입력하시오"/>
		</div><br>
		
		<div id="notice_content_Form">
			<textarea style="resize:none" id="notice_content" placeholder="내용을 입력하시오"></textarea>
		</div><br>
		
		<div id="write_Btn_form">
			<div id="list_btn"><button id="mainBtn">메인으로</button></div>
			<div id="reset_btn"><button id="resetBtn">다시쓰기</button></div>
			<div id="submit_btn"><button id="submitBtn">글  수정</button></div>
		</div>
	</div>
	</div>

	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>