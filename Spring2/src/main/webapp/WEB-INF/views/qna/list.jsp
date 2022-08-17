<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/qnaList.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<table>
				<tr>
					<td id="td_1">게시물 번호</td>
					<td id="td_2">제목</td>
					<td id="td_3">작성자</td>
					<td id="td_4">작성일</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="/qna/content">hi</a></td>
					<td>hello</td>
					<td>0000-00-00</td>
				</tr>
			</table>
			<br><br>
			<form action="write" method="post">
				<input type="submit" value="글쓰기">
			</form>
			<br> <a href="/">메인으로</a>
		</div>
		${list}
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>