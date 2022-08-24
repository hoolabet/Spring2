<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>관리자 상품 목록</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="nav">
				<ul>
					<li><a href="/admin/main">관리자 메인</a></li>
					<li><a href="/admin/productList">상품 목록</a></li>
					<li><a href="/admin/orderList">주문 내역</a></li>
					<li><a href="/admin/memberList">회원 관리</a></li>
					<li><a href="/admin/qnaList">QnA 목록</a></li>
				</ul>
			</div>
			<div id="main">
				<form>
				<div><label>상품목록</label></div>
				<table border="1">
					<tr id="menu" >
						<td>상품번호</td><td>상품이름</td><td>카테고리 1</td><td>카테고리 2</td>
						<td>상품가격</td><td>재고</td><td>등록일</td>
					</tr>
					<tr>
						<td>상품번호</td>
						<td>상품이름</td>
						<td>카테고리 1</td>
						<td>카테고리 2</td>
						<td>상품가격</td>
						<td>재고</td>
						<td>등록일</td>
					</tr>
					
				</table>
				<input class="btn" type="submit" value="뒤로가기" formaction="/admin/list">
				<input class="btn" type="submit" value="추가하기" formaction="/admin/productAdd">
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>