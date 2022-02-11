<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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


#navi{
	width: 64%;
	height: 30px;
	border: 1px solid red;
	margin: 0 auto;
}


.imageFile{
	border-radius: 15px / 15px;
}

</style>



</head>
<body>

<div id="warpForm" align="center">
	<div id="headerForm">
	<!--<c:import url="/WEB-INF/views/commons/header.jsp"/>-->
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
				<!-- for문 -->
					<c:forEach items="${requestScope.list }" var="vo">
					<div class="list_contentForm" onclick="location='/productintro/SeasonProductView.do?seasonProductNo=${vo.seasonProductNo}'" style="cursor: pointer;">
						<div class="list_imgForm">
							<img class="imageFile" alt="" src="${vo.seasonProductPhotoFilePath }" style="width: 100%" height="100%">
						</div>
						
						<div class="list_loaction_Form">
							<span>[	${vo.seasonProductClassify}  ]</span>
						</div><br>
						
						<div class="list_titleForm">
							<span>[ ${vo.seasonProductTitle} ]</span>
						</div>
					</div>
					</c:forEach>
		</div>

					
			
				<!-- for문 -->
			
		<div id="navi" style="text-align: center;">
			${requestScope.pageNavi }
		</div><br>

		<c:if test="${farm != null && (farm.rating eq 'root')}">
			<form action="/productintro/SeasonProductWritePage.do" method="get">
				<div id="write_Btn_form">
					<input type="submit" value="글쓰기" id="submit_btn"/>
				</div>
			</form>
		</c:if>
		
	</div><br>
	
	<div id="footerForm">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>

</body>

<script type="text/javascript">
$(".select_season").click(function () {
	 var formTag = document.createElement("form");
     formTag.setAttribute("action",'/productintro/SeasonProductSearchListPage.do');
     formTag.setAttribute("method",'get');
     
     var inputTag = document.createElement("input");
     inputTag.setAttribute("type","hidden");
     inputTag.setAttribute("name","seasonProductClassify");
     
     var text = $(this).text();
     
     switch(text){
     	case "1월" :  inputTag.setAttribute("value","1");break;
     	case "2월" :  inputTag.setAttribute("value","2");break;
     	case "3월" :  inputTag.setAttribute("value","3");break;
     	case "4월" :  inputTag.setAttribute("value","4");break;
     	case "5월" :  inputTag.setAttribute("value","5");break;
     	case "6월" :  inputTag.setAttribute("value","6");break;
     	case "7월" :  inputTag.setAttribute("value","7");break;
     	case "8월" :  inputTag.setAttribute("value","8");break;
     	case "9월" :  inputTag.setAttribute("value","9");break;
     	case "10월" :  inputTag.setAttribute("value","10");break;
     	case "11월" :  inputTag.setAttribute("value","11");break;
     	case "12월" :  inputTag.setAttribute("value","12");break;
     }
     
     formTag.appendChild(inputTag);//폼 테그안에 인풋 태그 넣고
     document.body.appendChild(formTag);//폼 테그를 연결시켜준다
     formTag.submit();
});
</script>

</html>