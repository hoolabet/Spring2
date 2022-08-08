<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/qnaContent.css?ver=1">
<title>문의제목</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<table>
				<tr>
					<td>title</td>
					<td id="title">hi</td>
				</tr>
				<tr>
					<td>content</td>
					<td id="content">brbrbrbrbr</td>
				</tr>
			</table>
			<br> <a href="/qna/list">목록으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>