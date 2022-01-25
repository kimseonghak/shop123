<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<style>

/*Layout*/
@charset "UTF-8";

/*Layout*/
footer {
	width: 100%;
	height: 240px;
	background-color: #FFFFFF;
	padding-top: 50px;
	padding-bottom: 20px;
}
.logo-footer {
	text-align: right;
	margin-right: 14vw;
}

.footer-img {
	height: 30px;
}
.fnb-list {
	margin-top: 20px;
	text-align: left;
}
/*.fnb-list*/
.fnb-list>li {
	display: inline-block;
	margin-right: 30px;
}
.fnb-list>li:first-child {
	margin-left: 14vw;
}
.fnb-list>li>a {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color : #000000;
}
.com-info {
	line-height: 1.8;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 12px;
	color : #000000;
	margin-top: 20px;
	text-align: left;
	margin-left: 14vw;
}
</style>

<footer>
	<div class="logo-footer">
		<a href="/"><img class="footer-img" src="/resources/main/img/shop123_logo.png" alt="123상회"></a>
	</div>
	<ul class="fnb-list"> 
		<li><a href="">이용약관</a></li>
		<li><a href="">개인정보처리방침</a></li>
		<li><a href="">자주하는 질문</a></li>
		<li><a href="">공지사항</a></li>
	</ul>
	<div>
		<p class="com-info">123상회 <br>
		서울특별시 영등포구 선유동2로 57 이레빌딩 19층 <br>
		123SANGHOI@sanghoi.or.kr <br>
		대표번호 : 02-1544-9970 <br>
		COPYRIGHT 2022. BY 123상회 ALL RIGHTS RESERVED</p>
	</div>
</footer>