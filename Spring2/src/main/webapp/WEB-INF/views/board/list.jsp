<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_list.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>제품리스트</h1>
				<div id="p_list">
					<ul>
						<li id="popular"><a href="#">거실장(10)</a></li>
						<li id="last"><a href="#">쇼파(21)</a></li>
						<li id="lowprice"><a href="#">장식장(13)</a></li>
						<li id="highprice"><a href="#">진열장(12)</a></li>
					</ul>
				</div>
				<div id="array">
					<select>
						<option value="popular"><a href="#">인기순</a></option>
						<option value="last"><a href="#">최근등록순</a></option>
						<option value="lowprice"><a href="#">가격낮은순</a></option>
						<option value="highprice"><a href="#">가격높은순</a></option>
					</select>
				</div>
				<div id="list">
					<ul>
						<li><a href="http://localhost:8080/board/detail"><img
								alt="chair"
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165580847056056090.jpg?gif=1&w=640&h=640&c=c&webp=1"></a>
							<p>
								<a href="http://localhost:8080/controller/board/detail">되게
									좋은 침대</a>
							</p>
							<p>가격문의</p></li>
						<li><a href="http://localhost:8080/board/detail"><img
								alt="chair"
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165580847056056090.jpg?gif=1&w=640&h=640&c=c&webp=1"></a>
							<p>
								<a href="http://localhost:8080/controller/board/detail">되게
									좋은 침대</a>
							</p>
							<p>가격문의</p></li>
						<li><a href="http://localhost:8080/board/detail"><img
								alt="chair"
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165580847056056090.jpg?gif=1&w=640&h=640&c=c&webp=1"></a>
							<p>
								<a href="http://localhost:8080/controller/board/detail">되게
									좋은 침대</a>
							</p>
							<p>가격문의</p></li>
						<li><a href="http://localhost:8080/board/detail"><img
								alt="chair"
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165580847056056090.jpg?gif=1&w=640&h=640&c=c&webp=1"></a>
							<p>
								<a href="http://localhost:8080/controller/board/detail">되게
									좋은 침대</a>
							</p>
							<p>가격문의</p></li>
					</ul>
				</div>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>

</html>

