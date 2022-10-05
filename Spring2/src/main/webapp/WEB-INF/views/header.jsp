<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="header">
	<div id="header_top">
		<h1>
			<a href="/" id="Company">title</a>
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
					<li class="header_login_li" id="header_user_id">${userInfo.name}
						<ul id="header_user_menu">
							<li><a href="/cart/list">장바구니</a></li>
							<li><a href="/member/mypage">마이페이지</a></li>
							<li><a href="/order/research">주문 내역</a></li>
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
				<li id="categori_0" >모든제품</li>
				<li id="categori_a" class="cat_area">거실<input type="hidden" value="10">
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
				<li id="categori_b" class="cat_area">주방<input type="hidden" value="20">
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
				<li id="categori_c" class="cat_area">옷방,드레스룸<input type="hidden" value="30">
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
				<li id="categori_d" class="cat_area">침실<input type="hidden" value="40">
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
				<li id="categori_e" class="cat_area">화장실<input type="hidden" value="50">
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
				<li id="categori_f" class="cat_area">서재<input type="hidden" value="60">
					<ul id="categori_f_list" class="cates">
						<li><a href="/board/list?category_area=60&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=60&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=60&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=60&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=60&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=60&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=60&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_g" class="cat_area">아이방<input type="hidden" value="70">
					<ul id="categori_g_list" class="cates">
						<li><a href="/board/list?category_area=70&category_type=1">테이블</a></li>
						<li><a href="/board/list?category_area=70&category_type=2">의자</a></li>
						<li><a href="/board/list?category_area=70&category_type=3">침대</a></li>
						<li><a href="/board/list?category_area=70&category_type=4">쇼파</a></li>
						<li><a href="/board/list?category_area=70&category_type=5">서랍,수납장</a></li>
						<li><a href="/board/list?category_area=70&category_type=6">진열장</a></li>
						<li><a href="/board/list?category_area=70&category_type=7">기타소품</a></li>
					</ul>
				</li>
				<li id="categori_h" class="cat_area">야외<input type="hidden" value="80">
					<ul id="categori_h_list" class="cates">
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
	<form action="/board/list" id="searchform">
		<input id="search_input" type="text" placeholder="search.." name="search"> <img
			id="search_btn"
			src="https://cdn-icons-png.flaticon.com/512/61/61088.png">
			</form>
	</div>
	<div id='btnTop' >
		
	</div>
</div>