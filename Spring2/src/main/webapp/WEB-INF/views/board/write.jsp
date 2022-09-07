<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_write.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>상품등록</h1>
				<form action="/board/write" method="post" id="form">
					<table>
						<tr>
							<td><label>상품명</label></td>
							<td><input type="text" name="pname"></td>
						</tr>
						<tr>
							<td><label>가격</label></td>
							<td><input type="text" name="price"></td>
						</tr>
						<tr>
							<td><label>총수량</label></td>
							<td><input type="text" name="quantity"></td>
						</tr>
						<tr>
							<td><label>배송방법</label></td>
							<td><input type="text" name="delivery"></td>
						</tr>
						<tr>
							<td><label>소재</label></td>
							<td><input type="text" name="quality"></td>
						</tr>
						<tr>
							<td><label>카테고리-장소</label></td>
							<td><input type="text" name="category_area"><br>
								<label>10:거실<br> 20:주방<br> 30:옷방,드레스룸<br>
									40:침실<br> 50:화장실<br> 60:서재<br> 70:아이방<br>
									80:야외
							</label></td>
						</tr>
						<tr>
							<td><label>카테고리-용도</label></td>
							<td><input type="text" name="category_type"><br>
								<label>1:테이블<br> 2:의자<br> 3:침대<br> 4:소파<br>
									5:서랍,수납장<br> 6:진열장<br> 7:기타소품<br>
							</label></td>
						</tr>
						<tr>
							<td><label>썸네일</label></td>
							<td><input type="file" name="thumbnailFile" multiple
								id="uploadThumb">
								<div id="thumbImg"></div>
								<div id="thumb"></div></td>
						</tr>
						<tr>
							<td><label>첨부파일</label></td>
							<td><input type="file" name="uploadFile" multiple
								id="upload"></td>
						</tr>
						<tr>
							<td><label>내용</label></td>
							<td><div contenteditable="true" id="divContent"></div>
								<div>
									<textarea name="content" id="content"></textarea>
								</div></td>
						</tr>
					</table>
					<button id="btn">글쓰기</button>
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../resources/js/board_write.js"></script>
</body>
</html>