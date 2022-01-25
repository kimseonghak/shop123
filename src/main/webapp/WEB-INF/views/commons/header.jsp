<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<style>
@charset "UTF-8";

/*Layout*/
#header {
    width: 100%;
    height: 170px;
    background-color: white;
    position: fixed;
    top:0;
    z-index: 999;
}

/*.logo*/
.logo {
    width: 40%;
    height: 70%;
    float: left;
    text-align: center;
}
.logo>a>img {
	height: 35px;
	margin-top: 40px;
}

/*nav*/
#nav {
    width: 100%;
    height: 30%;
    float: left; 	
}
.gnb-list {
	margin: 0 auto;
	width: 35%;
	height: 120px;
	
}
.gnb-list>li {
	width: 25%;
	height: 50px;
	float: left;
	
}
.gnb-list>li>a {
	display: block;
	width: 100%;
	height: 100%;
	line-height: 50px;
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	color: #3BBD5A;
	font-weight : bold;
}
.gnb-list>li>a:hover {
	color: #248B00;
}
.lnb-list {
	width: 100%;
	height: 140px;
	display:none;
}

.lnb-list>li {
	width: 100%;
	height: 60px;
	text-align: center;
	line-height: 60px;
}
.gnb-list>li:hover {
	border-bottom: 3px solid #5EB656;
}
.gnb-list>li:hover>.lnb-list{
	display:block;
}

.lnb-list>li:first-child {
	padding-top: 15px;
}
.lnb-list>li>a {
	display: block;
	width: 100%;
	height: 100%;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #3BBD5A;
	font-weight : bold;
}
.lnb-list>li>a:hover {
	color: #248B00;
}

/*.link_user*/
.link-user {
    width: 30%;
    height: 70%;
    float: left;
}
.box-join {
	width: 100%;
	height: 70%;
	line-height: 120px;
	text-align: center;
	padding-left: 100px;
}
.box-join>a {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #3BBD5A;
}
.box-join>a:first-child {
	margin-right: 30px;
}

.box-user {
	width: 100%;
	height: 70%;
	line-height: 120px;
	text-align: center;
}
.box-user>a {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	color: #3BBD5A;
}





html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	text-decoration: none;
}
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
ol, ul {
	list-style: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
input {
	box-sizing: border-box;
}

</style>


<header id="header">
	
	<div class="link-user">

		<div class="box-join">
			<a href="">사업자 회원가입</a> <a href="">일반 회원가입</a>
		</div>

	</div>

	<div class="logo">
		<a href="/"><img src="/resources/main/img/shop123_logo.png" alt="123상회"></a>
	</div>

	<div class="link-user">

		<div class="box-user">
			<a href="">로그인</a>
		</div>

	</div>
	
	<div id="nav">
		
			<ul class="gnb-list">
				<li><a href="">특산물소개</a>
					<ul class="lnb-list">
						<li><a href="">제철 특산물</a></li>
						<li><a href="">지역 특산물</a></li>
					</ul>
				</li>
				<li><a href="">경매</a>
					<ul class="lnb-list">
						<li><a href="">경매</a></li>
						<li><a href="">구매</a></li>
					</ul>
				</li>
				<li><a href="">게시판</a>
					<ul class="lnb-list">
						<li><a href="">공지사항</a></li>
						<li><a href="">농가 홍보</a></li>
					</ul>
				</li>
				<li><a href="">고객센터</a>
					<ul class="lnb-list">
						<li><a href="">자주 찾는 질문</a></li>
						<li><a href="">1:1 문의</a></li>
					</ul>
				</li>
			</ul>
		
	</div>

</header>
