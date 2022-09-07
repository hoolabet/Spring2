<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li class="header_login_li"><div id="header_user_img" style="background-image:url(/member/${userInfo.userImg})"></li>
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
				<li id="categori_a">a
					<ul id="categori_a_list" class="cates">
						<li>a</li>
						<li>b</li>
						<li>c</li>
						<li>d</li>
						<li>e</li>
					</ul>
				</li>
				<li id="categori_b">b
					<ul id="categori_b_list" class="cates">
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
					</ul>
				</li>
				<li id="categori_c">c
					<ul id="categori_c_list" class="cates">
						<li>ㄱ</li>
						<li>ㄴ</li>
						<li>ㄷ</li>
						<li>ㄹ</li>
						<li>ㅁ</li>
					</ul>
				</li>
				<li id="categori_d">d
					<ul id="categori_d_list" class="cates">
						<li>ㅏ</li>
						<li>ㅑ</li>
						<li>ㅓ</li>
						<li>ㅕ</li>
						<li>ㅗ</li>
					</ul>
				</li>
				<li id="categori_e">e
					<ul id="categori_e_list" class="cates">
						<li>가</li>
						<li>나</li>
						<li>다</li>
						<li>라</li>
						<li>마</li>
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