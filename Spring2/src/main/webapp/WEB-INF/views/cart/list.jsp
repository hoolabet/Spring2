<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_List</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/cart_list.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form>
				<input type="hidden" value="${userInfo.id}" id="id">
				<div id="cart_list"></div>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/cart_list.js?ver=1"></script>
</body>
</html>