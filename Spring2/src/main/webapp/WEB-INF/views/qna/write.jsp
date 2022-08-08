<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/qnaWrite.css?ver=1">
<title>문의 글쓰기</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form action="list" method="POST">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="80"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="30" cols="80"></textarea></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="제출">
			</form>
			<br> <a href="/">메인으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>