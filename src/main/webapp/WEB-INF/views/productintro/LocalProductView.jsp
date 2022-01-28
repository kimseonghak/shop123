<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 폰트 나눔고딕,나눔명조 import 부분 -->
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
	height: 1717px;
	
}

#headerFrom{
	width: 100%;
	height: 175px;
	
}

#contentForm{
	width: 100%;
	height: 1300px;
	background-color: #f0f0f0;
}

#footerFrom{
	width: 100%;
	height: 242px;
	
}

#location-background{
	width: 60%;
	height: 80%;
	background-color: white;
	border-radius: 5px;
}


#location_titleForm{
	width: 90%;
	height: 50px;
	text-align: left;
	margin: 10px auto;
	padding : 1px;
	border-bottom: 0.5px solid black;
	font : normal bold 22.5px "Nanum Gothic",sans-serif;
}

/*#promotion_titleForm에서 우리가 margin 0 값을 준게 아닌데, 왜 자동으로 가운데 정렬되지?
   혹시 부모 div가 margin: 0 auto가 있어서 그 자손 div도 그 영향을 받는건가? ★
*/

#location_imgForm{
	width: 90%;
	height: 450px;
	border: 1px solid #f0f0f0;
}

#location_contentForm{
	width: 90%;
	height: 350px;
	overFlow : hidden;
}


#btnForm{
	width: 90%;
	height: 50px;
}

#reset_btn{
	width: 100px;
	height: 30px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#8D8E8D;
	color: white;
	margin: 10px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

#list_btn{
	width: 100px;
	height: 30px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	margin: 10px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}


#submit_btn{
	width: 100px;
	height: 30px;
	float: right;
	border: none;
	border-radius: 5px;
	background-color:#3BBD5A;
	color: white;
	margin: 10px;
	cursor: pointer;
	font : normal bold 17.5px "Nanum Gothic",sans-serif;
}

</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	
	
	<div id="contentForm" align="center"><br><br><br>
		<div id="location-background">
			<div id="location_titleForm">
				<span>글 제목</span>
			</div>
		
			<div id="location_imgForm">
			</div><br>
			
			<div id="location_contentForm">
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			재료:돈까스용 돼지고기(등심),밀가루,빵가루,계란,식용유,허브솔트
			저는 돼지고기를 2근을 사서 만들었어요.
			미리 만들어 두었다가 소분해서 냉동실에 보관하시면 좀더 오래 두고 드실수 있어요.<br>
			</div><br>
			
			<div id="btnForm">			
				<button id="list_btn">리스트</button>
				<button id="reset_btn">다시 쓰기</button>
				<button id="submit_btn">글 수정하기</button>
			</div>
		</div>
	</div><br>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>
</html>