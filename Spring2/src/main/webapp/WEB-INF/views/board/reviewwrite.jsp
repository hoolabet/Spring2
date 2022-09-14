<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/review.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
<div id="entry_area">
	<%@ include file="../header.jsp"%>
	<div id="content_area">
		<div id="container">
			<!-- 리뷰 시작 -->
			<div id="write">
				<h3>리뷰 작성</h3>
				<form method="post" id="form" action="/board/reviewwrite">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"></td>
							<th>제품번호</th>
							<td><input type="text" name="pno"></td>
						</tr>
						<tr>
							<th>평점</th>
							<td colspan="3">
								<input type="radio" value="1" name="scope">1
								<input type="radio" value="2" name="scope">2
								<input type="radio" value="3" name="scope">3
								<input type="radio" value="4" name="scope">4
								<input type="radio" value="5" name="scope">5
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="content"></textarea></td>
						</tr>
						<tr>
							<th>사진 첨부</th>
							<td colspan="3"><input type="file" id="file" name="uploadFile" accept=".jpg,.jpeg,.png"></td>
						</tr>
						<tr>
							<th>사진 미리보기</th>
							<td colspan="3"><div id="uploadResult"></div></td>
						</tr>
					</table>
					<!-- 지워야함 -->
					<!-- <div id="uploadResult">
					
							<ul>
							</ul>
					</div> -->
					<!-- 지워야함 -->
					
					<input type="button" value="작성" id="wbtn">
				</form>
			</div>
			<!-- 리뷰 끝 -->
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</div>			
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
</html>