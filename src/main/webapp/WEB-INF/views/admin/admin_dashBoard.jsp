<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js" integrity="sha256-Y26AMvaIfrZ1EQU49pf6H4QzVTrOI8m9wQYKkftBt4s=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<style>
.countWrap{
	border:1px solid black;
	width:25%;
	height:50%;
	float:left;
	padding:5px;
}
.boardWrap{
	border:1px solid black;
	width:33.3%;
	height:50%;
	float:left;
	padding:5px;
}
.count-graphWrap{
	border:1px solid black;
	width:100%;
	height:80%;	
}
.count-textWrap{
	border:1px solid black;
	width:100%;
	height:20%;
}
</style>
</head>
<body>
<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp"/>
	<div id="bodyWrap">
<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp"></c:import>
<%-- mainContents --%>
		<div id="mainContents">
<%-- 카운트 요약 부분 --%>
			<div class="countWrap">
				<div class="count-graphWrap">
				<canvas id="enterHome"></canvas>
				</div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap">
				<canvas id="joinCount"></canvas>
				</div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
				<div class="count-textWrap"></div>
			</div>
<%-- 보드 요약 부분 --%>
			<div class="boardWrap"></div>
			<div class="boardWrap"></div>
			<div class="boardWrap"></div>
		</div>
	</div>
	<script>
		$(function() {
			$('#mainUl>li').eq(0).css('background-color', '#34734e');
			$('#mainUl>li>a').eq(0).css('color', 'white');
			$('#mainUl>li>a').eq(0).css('font-weight','bolder');
		});
<%-- 그래프설정 --%>
		var context1 = document.getElementById('enterHome').getContext('2d');
		var context2 = document.getElementById('joinCount').getContext('2d');
<%-- 그래프 1 일일 방문자 --%>
		var yester = ${dayMap.yester};
		var today = ${dayMap.today};
		var enterHome = new Chart(context1,{
			type:'bar',
			data:{
				labels:['어제','오늘'],
				datasets:[{
					label: '일일 방문자 수', // 차트 제목
					fill:false, // line 형태일 때 선 안쪽을 채울지 말지
					data: [yester, today],
					backgroundColor:[
						'rgba(255,99,132,0.2)',
						'rgba(54,162,235,0.2)'
					],
					borderColor:[
						'rgba(255,99,132,1)',
						'rgba(54,162,235,1)'
					],
					borderWidth:1
				}]
			},
			options:{
				maintainAspectRatio: false, //false일 경우 포함된 div의 크기에 맞춰서 그려짐.
				scales:{
					y:{
						beginAtZero:true
					}
				}
			}
		});
<%-- 그래프2 일일 가입자 --%>
		var joinCount = new Chart(context2,{
			type:'bar',
			data:{
				
				labels:['어제(회원)','오늘(회원)','어제(농가)','오늘(농가)'],
				
				datasets:[{
					label: '일일 가입자 수', // 차트 제목
					fill:false, // line 형태일 때 선 안쪽을 채울지 말지
					data: [10, 8, 15, 5],
					backgroundColor:[
						'rgba(255,99,132,0.2)',
						'rgba(54,162,235,0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(75, 192, 192, 0.2)'
					],
					borderColor:[
						'rgba(255,99,132,1)',
						'rgba(54,162,235,1)',
						'rgba(255, 159, 64, 1)',
						'rgba(75, 192, 192, 1)'
					],
					borderWidth:1
				}]
			},
			options:{
				maintainAspectRatio: false, //false일 경우 포함된 div의 크기에 맞춰서 그려짐.
				scales:{
					y:{
						beginAtZero:true
					}
				}
			}
		});
	</script>
</body>
</html>