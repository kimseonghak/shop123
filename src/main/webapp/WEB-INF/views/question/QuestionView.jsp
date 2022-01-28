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
	height: 1417px;
	

}

#headerForm{
	width: 100%;
	height: 175px;
	
}

#contentForm{
	width: 100%;
	height: 1000px;
	padding: 10px;
	
		
}

#footerForm{
	width: 100%;
	height: 242px;
	
}

#content_background{
	width:90%;
	height:90%;
	margin: 30px auto;
	
}

#img_title_zone{
	width: 90%;
	height: 30%;
	
	margin: 30px auto;
	
}

#img_Form{
	width: 30%;
	height: 100%;
	border: 1px solid black;
	float: left;
	display: inline-block;
	
}

#Customer_titleForm{
	width: 70%;
	height: 100%;
	text-align: left;
	
}

#Customer_regForm{
	width: 70%;
	height: 30px;
	text-align: right;
	margin: 0 auto;
	
}

#Customer_contentForm{
	width: 90%;
	height: 500px;
	text-align: left;
	border: 1px solid black;
	margin: 0 auto;
}

#btnForm{
	width: 80%;
	height: 40px;
	margin: 20px;
}

#write_btn{
	width: 100px;
	height: 40px;
	float: right;
}
#list_btn{
	width: 100px;
	height: 40px;
	float: right;
}
#delete_btn{
	width: 100px;
	height: 40px;
	float: right;
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

#deleteBtn{
	width: 90px;
	height: 40px;
	background-color: #9B9B9B;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;
	border : none;
	cursor : pointer;	
	
}

#writeBtn{
	width: 90px;
	height: 40px;
	background-color: #08E200;
	font : normal bold 17.5px "고딕체";
	color: #ffffff;
	border-radius: 30px / 30px;	
	border : none;
	cursor : pointer;
}	
	
</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerFrom">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>

	<div id="contentForm">
		<div id="content_background">
			<div id="img_title_zone">
				<div id="img_Form">
					<img alt="" src="">
				</div>
				
				<div id="Customer_titleForm" style="font-size: 20px;">
					<span>[ 분류 ] : 글 제목</span>
				</div>
			</div>
	
			<div id="Customer_regForm">
				<span>[ 작성일 : ] [ 조회수 : ]</span>
			</div>
			
			<div id="Customer_contentForm">
			</div>
			
			<div id="btnForm">
				<div id="write_btn"><button id="writeBtn">글 쓰기</button></div>
				<div id="delete_btn"><button id="deleteBtn">글 삭제</button></div>
				<div id="list_btn"><button id="listBtn">글 목록</button></div>
			</div>
		</div>
	</div>
			
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>