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

#deleteBtn{
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
	
	<form action="/productintro/localProductUpdatePage.do" method="get">
	
	<input type="hidden" name="localProductNo" value="${localBoard.localProductNo }">
	<input type="hidden" name="localProductPhotoFilePath" value="${localBoard.localProductPhotoFilePath }">
	
	<div id="contentForm" align="center"><br><br><br>
		<div id="location-background">
			<div id="location_titleForm">
				<span>${localBoard.localProductTitle }</span>
			</div>
		
			<div id="location_imgForm">
				<img alt="" src="${localBoard.localProductPhotoFilePath }" style="width: 100%; height: 100%;">
			</div><br>
			
			<div id="location_contentForm">
				${localBoard.localProductContent }
			</div><br>
			
			<div id="btnForm">			
				<input type="button" id="list_btn" value="리스트" onclick="location='/productintro/LocalProductListPage.do'">
				<button type="button" id="deleteBtn">글 삭제</button>
				<button id="submit_btn">글 수정</button>
			</div>
		</div>
	</div><br>
	</form>
	
	<div id="footerForm">
	<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>
<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$('#deleteBtn').click(function(){
	    if(window.confirm('삭제할건가요?')){
	        var formTag = document.createElement("form");
	        formTag.setAttribute("action",'/productintro/localDelete.do');
	        formTag.setAttribute("method",'post');
	
	        var inputTag = document.createElement("input");
	        inputTag.setAttribute("type","hidden");
	        inputTag.setAttribute("name","localProductNo");
	        inputTag.setAttribute("value","${localBoard.localProductNo}");
	
	        formTag.appendChild(inputTag);//폼 테그안에 인풋 태그 넣고
	        document.body.appendChild(formTag);//폼 테그를 연결시켜준다
	        formTag.submit();
	    }else{
	        alert('삭제를 취소하셨습니다.');
	    }
	});

</script>
</body>
</html>