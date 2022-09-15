<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅋ</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<p>
				결제가 완료되었습니다.
			</p>
			<p>
				<input type="button" value="주문 내역 조회">
				<input type="button" value="홈으로">
			</p>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>