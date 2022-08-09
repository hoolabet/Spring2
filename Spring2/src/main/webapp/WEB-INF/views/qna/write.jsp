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
						<td><input type="text" name="title" size="98" id="input_title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="30" cols="100" id="input_content"></textarea></td>
					</tr>
				</table>
				<br>
				<input type="button" value="제출" id="submit_btn">
                <input type="submit" style="display: none;" id="do_submit">
                <input type="submit" value="임시저장" id="save_btn">
			</form>
			<br> <a href="/">메인으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/qnaWrite.js?ver=1"></script>
</body>
</html>