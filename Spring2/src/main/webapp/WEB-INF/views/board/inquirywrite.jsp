<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/inquiry.css" type="text/css">
</head>
<body>
<div id="entry_area">
	<%@ include file="../header.jsp"%>
	<div id="content_area">
		<div id="container">
			<div id="write">
				<h3>문의 작성</h3>
				<form method="post">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"></td>
							<th>제품번호</th>
							<td><input type="text" name="pno"></td>
						</tr>
						<tr>
							<th>문의사항</th>
							<td colspan="3"><textarea name="question"></textarea></td>
						</tr>
					</table>
					<input type="button" value="작성" id="wbtn">
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</div>				
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquiry.js"></script>
</html>