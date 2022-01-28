<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style type="text/css">

*{
	font-family: 'Nanum Gothic', sans-serif;
	box-sizing: border-box;
}

#warpForm{
	width: 100%;
	height: 1417px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 1000px;
}

#footerFrom{
	width: 100%;
	height: 242px;
}

#content_background{
	width: 90%;
	height: 80%;
	border: 2px solid #08E200;
		border-radius: 5px / 5px;	
	margin: 50px auto;
}

#promotionName{
	width: 60%;
	height: 70px;
	text-align: center;
	margin: 30px auto;
}

#promotion_titleForm{
	width: 90%;
	height: 30px;
	text-align: left;
	
}

#promotion_contentForm{
	width: 90%;
	height: 400px;
	text-align: left;
	background-color: #f0f0f0;
}

#img_Form{
	width: 90%;
	height: 30px;
	text-align: left;
}



/*버튼 태그*/
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
	float: right;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#listBtn{
	width: 95px;
	height: 40px;
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
	height: 40px;
	float: right;
	background-color: #9B9B9B;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
/*버튼 태그*/



#promotion_title{
	width: 100%;
	height: 100%;
	border: 1px solid #9B9B9B;
	outline: none;
	border-radius: 5px / 5px;	
	background-color: #f0f0f0;
}

#promotion_content{
	width: 100%;
	height: 100%;
	border: 1px solid #9B9B9B;
	outline: none;
	resize: none;
	border-radius: 5px / 5px;	
	background-color: #f0f0f0;
}

#promotionFont{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 30px;
	color: #3BBD5A;
}
</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	
	<div id="contentForm" align="center">
		<div id="content_background">
			<div id="promotionName" >
				<span id="promotionFont"">제일 자신있는 농산물을 홍보해보세요!</span>
			</div><br>
			
				<div id="promotion_titleForm">
					<input type="text" id="promotion_title" placeholder="제목을 입력하시오."/>
				</div><br>
	
				<div id="promotion_contentForm">
					<textarea id="promotion_content" placeholder="내용을 입력하시오."></textarea>
					
				</div><br>
				
				<div id="img_Form">
					<input type="file"/>
				</div><br>
	
				<div id="write_Btn_form">
					<div id="list_btn"><button id="listBtn">메인으로</button></div>
					<div id="reset_btn"><button id="resetBtn">다시 쓰기</button></div>
					<div id="submit_btn"><button id="submitBtn">글 쓰기</button></div>
				</div>
		</div>	
	</div>
	
	
	<div id="footerFrom">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>