<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style type="text/css">

*{
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1617px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 1200px;
}

#footerFrom{
	width: 100%;
	height: 242px;
}

#promotion-background{
	width: 86%;
	height: 86%;
	border: 2px solid #08E200;
	border-radius: 5px / 5px;	
	margin: 100px auto;
}


#promotion_titleForm{
	width: 80%;
	height: 32px;
	text-align: left;
	margin: 30px auto;
	background-color: #f0f0f0;
}

/*#promotion_titleForm에서 우리가 margin 0 값을 준게 아닌데, 왜 자동으로 가운데 정렬되지?
   혹시 부모 div가 margin: 0 auto가 있어서 그 자손 div도 그 영향을 받는건가? ★
*/

#promotion_imgForm{
	width: 750px;
	height: 450px;
	border: 0.5px solid black;
}

#promotion_contentForm{
	width: 80%;
	height: 350px;
	border: 2px solid #08E200;
	border-radius: 5px / 5px;	
	overFlow : hidden;
}


/*버튼 디자인 공간*/
#btnForm{
	width: 80%;
	height: 30px;
}

#submit_btn{
	width: 100px;
	height: 30px;
	float: right;
}
#list_btn{
	width: 100px;
	height: 30px;
	float: right;
}
#reset_btn{
	width: 100px;
	height: 30px;
	float: right;
}
#promotion_btn{
	width: 100px;
	height: 30px;
	float: right;
}

#listBtn{
	width: 95px;
	height: 30px;
	float: right;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#resetBtn{
	width: 95px;
	height: 30px;
	float: right;
	background-color: #9B9B9B;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#submitBtn{
	width: 95px;
	height: 30px;
	float: right;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#promotionBtn{
	width: 95px;
	height: 30px;
	float: right;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	
	<div id="contentForm" align="center">
		<div id="promotion-background">
			<div id="promotion_titleForm">
				<span> 이천 쌀 </span><hr>
			</div>
		
			<div id="promotion_imgForm">
				<img src="" style="width: 100%; height: 100%;">
			</div><br>
			
			<div id="promotion_contentForm">
				글 내용 들어가는 곳
			</div><br>
			
			<div id="btnForm">
				<div id="list_btn"><button id="listBtn">메인으로</button></div>
				<div id="reset_btn"><button id="resetBtn">다시쓰기</button></div>
				<div id="submit_btn"><button id="submitBtn">글 쓰기</button></div>
				<div id="promotion_btn"><button id="promotionBtn">홍보요청</button></div>
			</div>
		</div>
	</div>
	
	<div id="footerFrom">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>