<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="header">
	<div id="header_top">
		<h1>
			<a href="/">title</a>
		</h1>
		<div id="a_list">
				<c:choose>
				<c:when test="${userInfo eq null }">
				<ul id="header_parents_ul">
					<li><a href="/cart/list">장바구니</a></li>
					<li><a href="/member/mypage">마이페이지</a></li>
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/signup">회원가입</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul id="header_login_ul">
					<li class="header_login_li" id="header_user_id">${userInfo.id}
						<ul id="header_user_menu">
							<li><a href="/cart/list">장바구니</a></li>
							<li><a href="/member/mypage">마이페이지</a></li>
							<li><a href="/member/logout">로그아웃</a></li>
						</ul>
					</li>
					<c:choose>
					<c:when test="${fn:contains(userInfo.userImg,'http')}">
					<li class="header_login_li"><div id="header_user_img" style="background-image:url(https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAxMTRfMjYy%2FMDAxNDg0MzcxOTkxNzA4._N73NTpWleCLp8M6gXR8vpdDAZoAQ2mTJLimKBYFtRwg.5LEqnsukFugxlrTdlYk5hkxEKoVdUbTVsjL6gqJ03vIg.PNG.koomarin%2F%253F%253F%253F%253F%257B%253F_%253F%253F%253F%253F%253F%253F%253F.png&type=sc960_832)"></li>
					</c:when>
					<c:otherwise>
					<li class="header_login_li"><div id="header_user_img" style="background-image:url(/member/${userInfo.userImg})"></li>
					</c:otherwise>
					</c:choose>
				</ul>
				</c:otherwise>
				</c:choose>
		</div>
	</div>
	<div id="header_bottom">
		<div id="categori_btn">
			<img id="categori_btn_img"
				src="https://cdn3.iconfinder.com/data/icons/text/100/list-512.png">
			<ul id="categori">
			<li id="categori_0"><a href="/board/list" id="cat">모든제품</a></li>
				<li id="categori_a">거실
					<ul id="categori_a_list" class="cates">
						<li><a href="/board/list?category_area=10&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=10&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=10&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=10&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=10&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=10&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=10&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_b">주방
					<ul id="categori_b_list" class="cates">
						<li><a href="/board/list?category_area=20&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=20&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=20&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=20&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=20&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=20&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=20&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_c">옷방,드레스룸
					<ul id="categori_c_list" class="cates">
						<li><a href="/board/list?category_area=30&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=30&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=30&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=30&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=30&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=30&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=30&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_d">침실
					<ul id="categori_d_list" class="cates">
						<li><a href="/board/list?category_area=40&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=40&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=40&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=40&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=40&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=40&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=40&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_e">화장실
					<ul id="categori_e_list" class="cates">
						<li><a href="/board/list?category_area=50&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=50&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=50&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=50&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=50&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=50&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=50&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_b">서재
					<ul id="categori_b_list" class="cates">
						<li><a href="/board/list?category_area=60&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=60&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=60&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=60&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=60&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=60&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=60&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_b">아이방
					<ul id="categori_b_list" class="cates">
						<li><a href="/board/list?category_area=70&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=70&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=70&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=70&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=70&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=70&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=70&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_b">야외
					<ul id="categori_b_list" class="cates">
						<li><a href="/board/list?category_area=80&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=80&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=80&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=80&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=80&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=80&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=80&category_type=7">기타소품</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div id="search_div">
		<input id="search_input" type="text" placeholder="search.."> <img
			id="search_btn"
			src="https://cdn-icons-png.flaticon.com/512/61/61088.png">
	</div>
</div>