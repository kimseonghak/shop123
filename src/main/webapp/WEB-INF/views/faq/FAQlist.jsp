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
	height: 1117px;
}

#headerForm{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 700px;
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
}

#FAQ-nameForm{
	width: 80%;
	height : 30px;
	heightolid black;
	text-align: center;
	margin: 30px auto; 
}

#FAQ-listForm{
	overflow : auto;
	width: 80%;
	height: 60%;
	margin: 0 auto;
	border: 2px solid #08E200;
		border-radius: 5px / 5px;	
}

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
/*메인 폼 작업 끝*/


/*버튼 폼*/
#submitBtn{
	width: 140px;
	height: 50px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
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
					<span style="font-size: 20px; color: #3BBD5A; font-family: 'Nanum Gothic', sans-serif;">자주 묻는 질문 모음</span>
				</div>
				
				<div id="FAQ-listForm">
					<!-- for문 -->
					<details>
    					<summary>더 많은 내용</summary>
    					<p>내부에 넣을 내용을 입력해주세요</p>
					</details>
				</div>
				
				<div id="Write_BtnForm">
					<div id="submit_BtnForm"><button id="submitBtn">글 쓰기</button></div>
				</div>
			</div>
		</div>
		
		
		<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
	</div>


</body>
</html>