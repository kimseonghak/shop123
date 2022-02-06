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
			<form action="/notice/noticeUpdatePage.do" method="post" >
			
			<!-- 수정 폼으로 데이터를 넘겨주기 위한 코드 (추후 간결화되면 삭제해야 함) -->
			<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
			<input type="hidden" name="noticeCode" value="${notice.noticeCode}"/>
			<input type="hidden" name="noticeCategory" value="${notice.noticeCategory}"/>
			<input type="hidden" name="noticeTitle" value="${notice.noticeTitle}"/>
			<input type="hidden" name="noticeContent" value="${notice.noticeContent }"/>
			<input type="hidden" name="farmNo" value="${notice.farmNo}"/>
			
				<div id="content_titleForm">
					<span>${notice.noticeTitle}</span>
				<div id="writerForm">
					<span>[ ${notice.farmNo } ]</span>
				</div>
			</div><hr>
	
			<div id="content_RegdateForm">
				<span>[작성일 : ${notice.noticeRegdate}]</span> <span>[조회수 : ${notice.noticeCount}]</span>
			</div>
	
			<div id="content_textForm">
				${notice.noticeContent }
			</div><br>
			
			
			<div id="btnForm">
				<div id="list_Btn_Form"><button type="button" id="mainBtn">메인으로</button></div>
				<div id="delete_Btn_Form"><button type="button" id="deleteBtn" onclick="">글 삭제</button></div>
				<div id="update_Btn_Form"><button type="submit" id="updateBtn">글 수정</button></div>
			</div>
			</form>
		</div>
	</div>

	
	<div id="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</div>

</body>
</html>