<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/noticeWrite.css?ver=1">
<title>notice write</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form action="write" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="50"><br>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><div id="editor" contenteditable="true" style="overflow:scroll; width:500px; height:500px;background-color:white;"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="upload_div">
								<input type="file" multiple id="upload_input" name="uploadFile" multiple>
							</div>
							<div id="thumbnails"></div>
						</td>
					</tr>
				</table>
				<input type="hidden" name="content" id="content">
				<br> <input type="submit" value="제출" id="sub">
			</form>
			<a href="list">목록으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/noticeWrite.js?ver=1.2"></script>
</body>
</html>