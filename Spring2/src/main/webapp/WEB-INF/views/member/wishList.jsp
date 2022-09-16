<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/wishList.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">




			<h1 id="wish_title">찜 목록</h1>
			<form>
				<input type="hidden" value="${userInfo.id}" id="id">
				<div id="list">
					<ul id="wish_list">
					</ul>
				</div>
			</form>



		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/wishList.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>