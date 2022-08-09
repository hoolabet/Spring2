<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/productModify.css">
<title>관리자 상품 수정</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form name="btnForm" action="/admin/productList">
			<table border="1">
				<tr class="title">
					<td colspan="2">▶ 상품수정</td>
				</tr>
				<tr>
					<td id="menu">상품번호</td>
					<td>001</td>
				</tr>
				<tr>	
					<td id="menu">상품이미지</td>
					<td>
						<div><img id="preview"></div>
						<input type="file" id="img" accept="image/*" class="file">
					</td>
				</tr>
				<tr>	
					<td id="menu">상품명</td>
					<td><input type="text" value="철제의자" id="item"></td>
				</tr>
				<tr>	
					<td id="menu">상품설명</td>
					<td>
						<textarea id="script">철로 만든 의자</textarea>
						<div><input type="file" class="file"></div>
						<div><input type="file" class="file"></div>
						<div><input type="file" class="file"></div>
					</td>
				</tr>
				<tr>	
					<td id="menu">카테고리</td>
					<td>
						<select id="category">
							<option>테이블</option>
							<option selected>의자</option>
							<option>거실가구</option>
							<option>야외가구</option>
						</select>
					</td>
				</tr>
				<tr>	
					<td id="menu">판매가</td>
					<td><input type="text" value="5000" id="money"></td>
				</tr>
				<tr>	
					<td id="menu">재고</td>
					<td><input type="text" value="20" id="cnt"></td>
				</tr>
				<tr>	
					<td id="menu">판매상태</td>
					<td>
						<select id="state">
							<option>판매 예정</option>
							<option selected>판매중</option>
							<option>판매완료</option>
							<option>일시매진</option>
						</select>
					</td>
				</tr>
			</table>
			<div id="msg"></div>
			<input type="submit" value="뒤로가기" class="btn">
			<input type="button" onclick="modify()" value="수정" class="btn">
			<input type="button" onclick="remove()" value="삭제" class="btn">
			
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script src="../resources/js/admin/productModify.js"></script>
</body>
</html>