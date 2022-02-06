<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/main/common/css/header.css">

<header id="header">
	<div class="link-user">

		<div class="box-join">
			
		</div>

	</div>

	<div class="logo">
		<a href="/"><img src="/resources/main/main/img/shop123_logo.png" alt="123상회"></a>
	</div>
	<c:choose>
		<c:when test="${sessionScope.member != null }">
			<div class="link-user">
				<div class="box-user">
					<a href="">회원 ${sessionScope.member.userName }님</a> 
					<a href="/member/memberlogout.do">로그아웃</a>
				</div>
			</div>
		</c:when>
		
		<c:when test="${sessionScope.farm != null && sessionScope.farm.rating =='root' || sessionScope.farm.rating =='admin' }">
			<div class="link-user">
				<div class="box-user">
					<a href="/admin/adminDashboardPage.do">관리자 ${sessionScope.farm.farmName }님</a> 
					<a href="/farm/farmLogout.do">로그아웃</a>
				</div>
			</div>
		</c:when>
		
		<c:when test="${sessionScope.farm != null && sessionScope.farm.rating =='farm' }">
			<div class="link-user">
				<div class="box-user">
					<a href="/farm/farmDashBoardPage.do">농가 ${sessionScope.farm.farmName }님</a> 
					<a href="/farm/farmLogout.do">로그아웃</a>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="link-user">
				<div class="box-user">
					<a href="/member/memberLoginPage.do">로그인</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<div id="nav">
		
			<ul class="gnb-list">
				<li><a href="/productintro/SeasonProductListPage.do">특산물소개</a>
					<ul class="lnb-list">
						<li><a href="/productintro/SeasonProductListPage.do">제철 특산물</a></li>
						<li><a href="/productintro/LocalProductListPage.do">지역 특산물</a></li>
					</ul>
				</li>
				<li><a href="/auction/auctionPage.do">경매</a>
					<ul class="lnb-list">
						<li><a href="/auction/auctionPage.do">경매</a></li>
						<li><a href="/auction/auctionSalePage.do">구매</a></li>
					</ul>
				</li>
				<li><a href="/notice/noticeListPage.do">게시판</a>
					<ul class="lnb-list">
						<li><a href="/notice/noticeListPage.do">공지사항</a></li>
						<li><a href="/promotion/promotionListPage.do">농가 홍보</a></li>
					</ul>
				</li>
				<li><a href="/faq/faqListPage.do">고객센터</a>
					<ul class="lnb-list">
						<li><a href="/faq/faqListPage.do">자주 찾는 질문</a></li>
						<li><a href="/question/QuestionUserPage.do">일반 1:1 문의</a></li>
						<c:choose>
							<c:when test="${sessionScope.farm != null }">
								<li><a href="/question/QuestionFarmPage.do">농가 1:1 문의</a></li>
							</c:when>
						</c:choose>
					</ul>
				</li>
			</ul>
		
	</div>

</header>
