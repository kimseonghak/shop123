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
	height: 1817px;
}

#headerFrom{
	width: 100%;
	height: 175px;
}

#contentForm{
	width: 100%;
	height: 1400px;
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

.select_local{
	width: 80px;
	height: 40px;
	background-color: #3BBD5A;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
	color: #ffffff;
	border-radius: 5px;
	border: none;
	margin: -2px;
	cursor: pointer;
}


#listForm{
	width: 64%;
	height: 70%;
	margin: 0 auto;
}

#navi{
	width: 64%;
	height: 30px;
	border: none;
	margin: 0 auto;
}

.list_contentForm{
	width : 300px;
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
	width: 64%;
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


#font{
font : normal bold 30px "Nanum Gothic",sans-serif;
color: #3BBD5A;
}
</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	
	<div id="contentForm" align="left">
	<div id="background"></div>
	
		<div id="seasonal_name" align="left">
			<span id="font">지역 특산물</span>
		</div>
		
		<div id="select_form" align="center">
		<br>
			<button class="select_local">전체</button>
			<button class="select_local">서울</button>
			<button class="select_local">경기도</button>
			<button class="select_local">강원도</button>
			<button class="select_local">충청북도</button>
			<button class="select_local">충청남도</button>
			<button class="select_local">경상북도</button>
			<button class="select_local">경상남도</button>
			<button class="select_local">전라북도</button>
			<button class="select_local">전라남도</button>
			<button class="select_local">제주도</button>
		</div>
		
		<div id="listForm" align="center">
			<!-- for문 -->

			<div class="list_contentForm">
				
				<div class="list_imgForm">
					<img>
				</div><br>
				
				<div class="list_loaction_Form">
					<span>[ 지역 ]</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>[ 글 제목 ]</span>
				</div>
			</div>
			
			<!-- for문 -->
			

		</div><br>
		
		<div id="navi">
		</div><br>
		
		<div id="write_Btn_form">
			<button id="submit_btn">글 쓰기</button>
		</div>
	</div><br>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>