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

#seasonal_name{
	width: 200px;
	height: 70px;
	text-align: center;
	margin: 0 auto;
	font-size: 30px;
	color: #08E200;
}


#select_form{
	width: 95%;
	height: 120px;
	margin: 0 auto;
}

.select_season{
	width: 80px;
	height: 50px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px;
	border: none;
	margin: -6px;
	cursor: pointer;
}

#listForm{
	width: 70%;
	height: 50%;
	margin: 0 auto;
}

.list_contentForm{
	width : 23%;
	height: 450px;
	float: left;
	position: relative;
	left: 10px;
	border: 1px solid gray;
	border-radius: 15px / 15px;
	margin: 10px;
	box-shadow: 5px 5px 2px #f0f0f0;
}

.list_imgForm{
	width : 100%;
	height: 65%;
	margin: 0 auto;
	border-radius: 15px / 15px;
	
}

.list_loaction_Form{
	width : 40%;
	height: 5%;
	position: relative;
	left: -70px;
	border: none;
	border-radius: 5px;
	background-color: #3BBD5A;
	color: #ffffff;
}

.list_titleForm{
	width : 80%;
	height: 20%;
}

#write_Btn_form{
	width: 50px;
	height: 40px;	
	margin: 0 auto;
}

#submit_btn{
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px / 5px;
	background-color: #3BBD5A;
	color: #ffffff;
	float: right;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	<div id="contentForm" align="left">
		<div id="seasonal_name" align="left">
			제철 특산물
		</div>
		
		<div id="select_form" align="center">
		<br>
			<button class="select_season">1월</button>
			<button class="select_season">2월</button>
			<button class="select_season">3월</button>
			<button class="select_season">4월</button>
			<button class="select_season">5월</button>
			<button class="select_season">6월</button><br>
			<button class="select_season">7월</button>
			<button class="select_season">8월</button>
			<button class="select_season">9월</button>
			<button class="select_season">10월</button>
			<button class="select_season">11월</button>
			<button class="select_season">12월</button>
		</div>
		
		<div id="listForm" align="center">

			<div class="list_contentForm">
				
				<div class="list_imgForm">
					<img>
				</div>
				
				<div class="list_loaction_Form">
					<span>[월]</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>[ 글 제목 ]</span>
				</div>
				
				<div id="write_Btn_form">
					<button id="submit_btn">글 쓰기</button>
				</div>
			</div>
			
			<div class="list_contentForm">
				
				<div class="list_imgForm">
					<img>
				</div>
				
				<div class="list_loaction_Form">
					<span>[월]</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>[ 글 제목 ]</span>
				</div>
			</div>
			
			<div class="list_contentForm">
				
				<div class="list_imgForm">
					<img>
				</div>
				
				<div class="list_loaction_Form">
					<span>[월]</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>[ 글 제목 ]</span>
				</div>
			</div>
			
			<div class="list_contentForm">
				
				<div class="list_imgForm">
					<img>
				</div>
				
				<div class="list_loaction_Form">
					<span>[월]</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>[ 글 제목 ]</span>
				</div>
			</div>

		</div><br>
		
	</div><br>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>