<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/detail.css">
</head>
<body>
	<div id="container">
		<h1>상품상세페이지</h1>
		<table>
			<tr>
				<td><input type"text" value="제목을 여기다 쓰세요"></td>
				<td>조회수 : <input type"text" value="조회수는 여기에"></td>
			</tr>
			<tr>
				<td colspan="2"><img alt="chicken"
					src="http://dhcdn.design.co.kr/cms/img/2018/01/M.1517374741.1643.3.jpg">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<p>
						제품의 상세 내용이 들어갈 페이지 입니다.<br> 제품을 구매하도록 잘 작성해 주세요
					</p>
				</td>
			</tr>
		</table>
		<a href="#">수정하기</a> <a href="#">삭제하기</a>
		<div id="reviewlist">
			<div>총평점</div>
			<button>리뷰쓰기</button>
			<div>
				<fieldset>
				<span>개별평점</span>
					<input type="radio" value="5" name="star" id="rate1"><label>★</label>
					<input type="radio" value="4" name="star" id="rate2"><label>★</label>
					<input type="radio" value="3" name="star" id="rate3"><label>★</label>
					<input type="radio" value="2" name="star" id="rate4"><label>★</label>
					<input type="radio" value="1" name="star" id="rate5"><label>★</label>
				</fieldset>
			</div>
			<img alt="가구사진"
				src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/165890122221285125.jpeg?gif=1&w=144&h=144&c=c&webp=1">
			<p>잘쓰고 있습니다.</p>

		</div>
	</div>
</body>

</html>

