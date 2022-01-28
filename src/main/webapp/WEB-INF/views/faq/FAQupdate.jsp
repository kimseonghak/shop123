<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	box-sizing: border-box;
}

/*해더 푸터 컨텐트 폼*/
#warpForm{
	width: 100%;
	height: 1067px;
}

#headerForm{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 650px;
	background-color: #f0f0f0;
	border: 1px solid white;
}

#footerForm{
	width: 100%;
	height: 242px;
}


/*메인 폼 작업*/
#FAQ-backgroundForm{
	width:70%;
	height:90%;
	margin: 30px auto;
	background-color: white;
	padding: 10px;
		border-radius: 5px / 5px;	
}

#FAQ-nameForm{
	width: 80%;
	height : 30px;
	heightolid black;
	text-align: center;
	margin: 30px auto; 
}

#FAQ-contentForm{
	overflow : auto;
	width: 80%;
	height: 300px;
	margin: 0 auto;
	border: 2px solid #f0f0f0;
	border-radius: 5px / 5px;
}

#FAQ_content{
	width: 100%;
	height: 100%;
	resize: none;
	outline: none;
	background-color: #f0f0f0;
	border: none;
}

#FAQ_title{
	width: 100%;
	height: 100%;
	outline: none;
	border: none;
	border-radius: 5px / 5px;
	background-color: #f0f0f0;
}

#FAQ-titleForm{
	overflow : auto;
	width: 80%;
	height: 40px;
	border: 2px solid #f0f0f0;
	border-radius: 5px / 5px;	
	margin: 0 auto;
}


/*메인 폼 작업 끝*/


/*버튼 폼*/
#Write_BtnForm{
	width: 80%;
	height: 50px;
	margin: 20px auto;
}

#submit_BtnForm{
	width: 140px;
	height: 50px;
	float: right;
	margin: -1.5px auto;
}
#reset_BtnForm{
	width: 140px;
	height: 50px;
	float: right;
	margin: -1.5px auto;
}
#main_BtnForm{
	width: 140px;
	height: 50px;
	float: right;
	margin: -1.5px auto;
}


#submitBtn{
	width: 130px;
	height: 50px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
#resetBtn{
	width: 130px;
	height: 50px;
	background-color: #9B9B9B;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
#mainBtn{
	width: 130px;
	height: 50px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
/*버튼 폼끝*/
</style>

</head>
<body>

	<div id="warpForm">
		<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
		
		
		<div id="contentForm">
			<div id="FAQ-backgroundForm">
				
				<div id="FAQ-nameForm">
					<span style="font-size: 20px; color: #3BBD5A; font-family: 'Nanum Gothic', sans-serif;">자주 묻는 질문 작성하기</span>
				</div>
				
				<div id="FAQ-titleForm">
					<input type="text" id="FAQ_title" placeholder="자주하는 질문사항의 제목을 입력하세요."/>
				</div><br>

				<div id="FAQ-contentForm">
					<textarea id="FAQ_content" placeholder="자주하는 질문사항의 내용을 입력하세요."></textarea>
				</div>
				
				<div id="Write_BtnForm">
					<div id="main_BtnForm"><button id="mainBtn">메인으로</button></div>
					<div id="reset_BtnForm"><button id="resetBtn">다시 쓰기</button></div>
					<div id="submit_BtnForm"><button id="submitBtn">글 수정</button></div>
				</div>
			</div>
		</div>
		
		
		<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	</div>


</body>
</html>