<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/common.css">
<link rel="stylesheet" href="/resources/admin/css/main.css">
</head>
<body>
	<%--header import --%>
	<c:import url="/resources/admin/common/header.jsp" />
	<div id="bodyWrap">
		<%--sideBar import --%>
		<c:import url="/resources/admin/common/sideBar.jsp" />
		<%-- mainContents --%>
		<div id="mainContents">
			<%-- 카운트 요약 부분 --%>
			<div class="countWrap">
				<div class="count-graphWrap">
					<canvas id="enterHome"></canvas>
				</div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap">
					<canvas id="joinCount"></canvas>
				</div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
			</div>
			<div class="countWrap">
				<div class="count-graphWrap"></div>
			</div>
			<%-- 보드 요약 부분 --%>
			<div class="boardWrap">
				<div class="borderDesignWrap">
					<div class="boardHeader">
						<span class="boardTitle boardSpan">유저 문의사항</span> 
						<span class="boardPlus boardSpan"><a href="/admin/adminUserQNAPage.do">+ 더보기</a></span>
					</div>
					<div class="boardBody">
						<table class="boardTBL" style="word-break: break-all;">
							<tr>
								<th style="width: 15%;">번호</th>
								<th style="width: 65%;">문의 제목</th>
								<th style="width: 20%;">작성자</th>
							</tr>
							<c:forEach items="${requestScope.qUser }" var="q">
								<tr class="qUserList userQNA">
									<td>${q.questionUserNo }</td>
									<td>${q.questionUserTitle }</td>
									<td>${q.userNick }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="boardWrap">
				<div class="borderDesignWrap">
					<div class="boardHeader">
						<span class="boardTitle boardSpan">농가 문의사항</span> 
						<span class="boardPlus boardSpan"><a href="/admin/adminFarmQNAPage.do">+ 더보기</a></span>
					</div>
					<div class="boardBody">
						<table class="boardTBL" style="word-break: break-all;">
							<tr>
								<th style="width: 15%;">번호</th>
								<th style="width: 65%;">문의 제목</th>
								<th style="width: 20%;">작성자</th>
							</tr>
							<c:forEach items="${requestScope.qFarm }" var="q">
								<tr class="qUserList farmQNA">
									<td style="width:15%;">${q.questionFarmNo }</td>
									<td style="width:65%;">${q.questionFarmTitle }</td>
									<td style="width:20%;">${q.farmName }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="boardWrap">
				<div class="borderDesignWrap">
					<div class="boardHeader">
						<span class="boardTitle boardSpan">유저 환불목록</span> 
						<span class="boardPlus boardSpan"><a href="">+ 더보기</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- jQuery CDN --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<%-- chart.js CDN --%>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"
		integrity="sha256-Y26AMvaIfrZ1EQU49pf6H4QzVTrOI8m9wQYKkftBt4s="
		crossorigin="anonymous"></script>
	<script>
<%-- 사이드바 선택 표시 --%>
		$(function() {
			$('#mainUl>li').eq(0).css('background-color', '#34734e');
			$('#mainUl>li>a').eq(0).css('color', 'white');
			$('#mainUl>li>a').eq(0).css('font-weight','bolder');
		});
<%-- 그래프설정 --%>
<%-- 그래프 1 일일 방문자 --%>
		$(function() {
			var context1 = document.getElementById('enterHome').getContext('2d');
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
		});
<%-- 그래프2 일일 가입자 --%>
		$(function(){
			var context2 = document.getElementById('joinCount').getContext('2d');
			var yesterMember = ${joinMap.yester};
			var todayMember = ${joinMap.today};
			var yesterFarm = ${farmMap.yester};
			var todayFarm = ${farmMap.today};
			var joinCount = new Chart(context2,{
				type:'bar',
				data:{
					labels:['어제(회원)','오늘(회원)','어제(농가)','오늘(농가)'],
					datasets:[{
						label: '일일 가입자 수', // 차트 제목
						fill:false, // line 형태일 때 선 안쪽을 채울지 말지
						data: [yesterMember, todayMember, yesterFarm, todayFarm],
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
		});
<%-- tr 클릭시 해당 글로 이동하는 로직 --%>
		$('.userQNA').click(function(){
			var qBoardNo = $(this).children().eq(0).html();
			location.replace("/admin/admin_")
		});
		$('.farmQNA').click(function(){
			var qBoardNo = $(this).children().eq(0).html();
			location.replace("/admin/adminFarmQNAContent.do?questionFarmNo="+qBoardNo);
		});
	</script>
</body>
</html>