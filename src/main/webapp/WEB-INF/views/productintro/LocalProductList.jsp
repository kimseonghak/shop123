<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
	height: 1517px;
	background-color: #f0f0f0;
}

#headerFrom{
	width: 100%;
	height: 175px;
	background-color: white;
}

#contentForm{
	width: 100%;
	height: 1100px;
	border: 1px solid black;
}

#footerFrom{
	width: 100%;
	height: 242px;
	background-color: gray;
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
	height: 90px;
	margin: 0 auto;
	border: 2px solid black;
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
	border-radius: 5px / 5px;
	
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

.imageFile{
	border-radius: 15px / 15px;
}



</style>

</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	
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
			<c:forEach items="${requestScope.list }" var="vo">
			<div class="list_contentForm" onclick="location='/productintro/LocalProductView.do?localProductNo=${vo.localProductNo}'" style="cursor: pointer;">
				
				<div class="list_imgForm">
					<img class="imageFile" src="${vo.localProductPhotoFilePath }" style="width: 100%" height="100%">
				</div><br>
				
				<div class="list_loaction_Form">
					<span>${vo.localProductClassify }</span>
				</div><br>
				
				<div class="list_titleForm">
					<span>${vo.localProductTitle }</span>
				</div>
			</div>
			</c:forEach>
			<!-- for문 -->
			
			

		</div><br>
		
		<div id="navi" style="text-align: center;">
			${requestScope.pageNavi }
		</div><br>
		<c:if test="${farm != null && (farm.rating eq 'root')}">
			<form action="/productintro/LocalProductWritePage.do" method="get">
				<div id="write_Btn_form">
					<input type="submit" value="글쓰기" id="submit_btn"/>
				</div>
			</form>
		</c:if>
	</div><br>
	
	<div id="footerFrom">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

</body>

<script type="text/javascript">
$(".select_local").click(function () {
	 var formTag = document.createElement("form");
     formTag.setAttribute("action",'/productintro/productintroLocalBtn.do');
     formTag.setAttribute("method",'get');
     
     var inputTag = document.createElement("input");
     inputTag.setAttribute("type","hidden");
     inputTag.setAttribute("name","localProductClassify");
     
     var text = $(this).text();
     
     switch(text){
     	case "전체" :  inputTag.setAttribute("value","ALL");break;
     	case "서울" :  inputTag.setAttribute("value","SEOUL");break;
     	case "경기도" :  inputTag.setAttribute("value","GYEONGGI");break;
     	case "강원도" :  inputTag.setAttribute("value","GANGWWON");break;
     	case "충청북도" :  inputTag.setAttribute("value","CHUNGBUK");break;
     	case "충청남도" :  inputTag.setAttribute("value","CHUNGNAM");break;
     	case "경상북도" :  inputTag.setAttribute("value","GYEONGBUK");break;
     	case "경상남도" :  inputTag.setAttribute("value","GYEONGNAM");break;
     	case "전라북도" :  inputTag.setAttribute("value","JEONBUK");break;
     	case "전라남도" :  inputTag.setAttribute("value","JEONNAM");break;
     	case "제주도" :  inputTag.setAttribute("value","JEJU");break;
     }
     
     formTag.appendChild(inputTag);//폼 테그안에 인풋 태그 넣고
     document.body.appendChild(formTag);//폼 테그를 연결시켜준다
     formTag.submit();
});
</script>

</html>