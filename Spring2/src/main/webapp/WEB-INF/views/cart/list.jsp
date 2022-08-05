<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_List</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/cart_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/home.js"></script>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form action="">
				<h1>장바구니</h1>
				<hr>
				<table>
				<div id="left">
					<tr>
						<td> 
							<img src="https://www.ikea.com/kr/ko/images/products/nikkeby-chest-of-4-drawers-grey-green__0729238_pe738502_s5.jpg?f=xxs">
							<br><input type="checkbox" name="furniture" value="chiffonier">
							<h4>상품 이름</h4> 가구 정보
						</td>
						<td>
							<img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
							<br><input type="checkbox" name="furniture" value="chiffonier">
							<h4 id="red">상품 이름</h4> 가구 정보
						</td>
					</tr>
				</div>
				<div id="right">
					<tr>
						<td colspan="2">
							<input type="submit" value="결제하기">
						</td>
					</tr>
				</div>
				</table>
				<p><a href="/cart/payment">결제창으로</a> <a href="/">메인으로</a></p>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>