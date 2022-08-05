<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_review.css"
	type="text/css">
</head>
<body>
	<div id="header"></div>
	<div id="container">
		<h1>리뷰쓰기</h1>
		<form action="">
			<div id="starRate">
				<fieldset>
					<input type="radio" value="5" name="star" id="rate1"><label>★</label>
					<input type="radio" value="4" name="star" id="rate2"><label>★</label>
					<input type="radio" value="3" name="star" id="rate3"><label>★</label>
					<input type="radio" value="2" name="star" id="rate4"><label>★</label>
					<input type="radio" value="1" name="star" id="rate5"><label>★</label>
					<span>평점을 남겨주세요</span>
				</fieldset>
			</div>
			<div id="title">
				<div>
					<label>제목 :</label> <input type="text" name="title">
				</div>
			</div>
			<div id="img">
				<label>사진 :</label> <input type="text" placeholder="파일첨부">
				<button>찾기</button>
			</div>
			<div>파일이 첨부되어 미리 볼 수 있는 곳</div>
			<div>
				<textarea rows="30px" cols="50px" id="reivew_write"></textarea>
				<label id="writelength">0/100</label>
			</div>
			<button>글쓰기</button>
		</form>
	</div>
	<div id="footer"></div>
	<script type="text/javascript" src="../resources/js/board_review.js"></script>
</body>
</html>