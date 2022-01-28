<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<title>공지 사항</title>

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
	background-color : #f0f0f0 ;
}

#footerForm{
	width: 100%;
	height: 242px;
}


#content_background{
	width: 60%;
	height: 80%;
	border-radius: 15px / 15px;	
	margin: 30px auto;
	padding: 50px;
	background-color: white;
}


#content_titleForm{
	width: 100%;
	height: 30px;
	text-align: left;
}

#content_RegdateForm{
	width: 100%;
	height: 30px;
	text-align: right;
}

#writerForm{
	width: 20%;
	height: 30px;
	float: right;
	text-align: right;
}

#content_textForm{
	width: 100%;
	height: 60%;
	text-align: center;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 5px / 5px;	
}


/*버튼 디자인*/
#btnForm{
	width: 100%;
	height: 50px;
	margin: 0 auto;
}

#update_Btn_Form{
	width: 120px;
	height: 50px;
	float: right;
}

#delete_Btn_Form{
	width: 120px;
	height: 50px;
	float: right;
}

#list_Btn_Form{
	width: 120px;
	height: 50px;
	float: right;
}

#mainBtn{
	width: 110px;
	height: 50px;
	float: right;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#deleteBtn{
	width: 110px;
	height: 50px;
	float: right;
	background-color: #9B9B9B;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
	margin: 0 auto;
}

#updateBtn{
	width: 110px;
	height: 50px;
	float: right;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px / 5px;
	border : none;
	cursor : pointer;
	margin: 0 auto;
}
</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div id="contentForm"><br>
		<div id="content_background">
		
			<div id="content_titleForm">
				[ 공지사항  ] : 글 제목
				<div id="writerForm">
					[ 영자 닉네임 ]
				</div>
			</div><hr>
	
			<div id="content_RegdateForm">
				[작성일 : ] [조회수 : ]
			</div>
	
			<div id="content_textForm">
				
			</div><br>
			
			<div id="btnForm">
				<div id="list_Btn_Form"><button id="mainBtn">메인으로</button></div>
				<div id="delete_Btn_Form"><button id="deleteBtn">글 삭제</button></div>
				<div id="update_Btn_Form"><button id="updateBtn">글 수정</button></div>
			</div>
		
		</div>
	</div>

	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</div>

</body>
</html>