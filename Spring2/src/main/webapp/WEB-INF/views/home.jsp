<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/home_slick.css?ver=1">
<title>Home</title>
</head>
<body>

	<div id="entry_area">
		<%@ include file="header.jsp"%>
		<div id="content_area">
			<div id="banner">
				<div id="area">
					<div class="slider-wrap">
						<div class="cont">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Eo_circle_red_number-1.svg/800px-Eo_circle_red_number-1.svg.png">
						</div>
						<div class="cont">
							<img
								src="https://cdn-icons-png.flaticon.com/512/3601/3601634.png">
						</div>
						<div class="cont">
							<img
								src="https://w.namu.la/s/3db13b3fdd97ce006e49fa8be1ee4ca464806aa4d559b44e72a4fdd43d7cddc7f23cb592ca44e4c38209e9964ec0d5df6186fb3705ff348f0105c467ca70a529d7a7f75b3ae6226c69ff7a8bd731c950691b5b15b438c429a65e87b597cc4941">
						</div>
						<div class="cont">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Icon_4_yellow.svg/1200px-Icon_4_yellow.svg.png">
						</div>
						<div class="cont">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/5_icon.svg/1024px-5_icon.svg.png">
						</div>
					</div>
					<div class="slick-arrow slick-prev">
						<i class="fa fa-angle-left"></i>
					</div>
					<div class="slick-arrow slick-next">
						<i class="fa fa-angle-right"></i>
					</div>
				</div>
			</div>
			<a href="/cart/list">장바구니</a> <a href="/made/chooseForMade">제작</a> <a
				href="/member/login">로그인</a> <a href="/board/list">상품목록</a> <a
				href="/member/memberList">회원 찾기</a>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
		integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
  Kakao.init('f1c123290b579c96921a1001465238ef'); // 사용하려는 앱의 JavaScript 키 입력
</script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/home_slick.js?ver=1"></script>
</body>
</html>
