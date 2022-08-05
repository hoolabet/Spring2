<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_review.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>리뷰쓰기</h1>
				<form action="">
					<div id="starRate">
						<input type="radio" value="5" name="star" id="rate1"><label
							for="rate1">★</label> <input type="radio" value="4" name="star"
							id="rate2"><label for="rate2">★</label> <input
							type="radio" value="3" name="star" id="rate3"><label
							for="rate3">★</label> <input type="radio" value="2" name="star"
							id="rate4"><label for="rate4">★</label> <input
							type="radio" value="1" name="star" id="rate5"><label
							for="rate5">★</label> <span>평점을 남겨주세요</span>
					</div>
					<div id="title">
						<input type="text" name="title" placeholder="제목을 여기에 쓰세요">
					</div>
					<div id="img">
						<input type="text" placeholder="파일첨부">
						<button>찾기</button>
					</div>
					<div>파일이 첨부되어 미리 볼 수 있는 곳</div>
					<div id="write">
						<textarea rows="25%" cols="100%" id="review_write"></textarea>
						<label id="writelength">0/100</label>
					</div>
					<div id="btn">
						<button>글쓰기</button>
					</div>

				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="../resources/js/board_review.js"></script>
</body>
</html>