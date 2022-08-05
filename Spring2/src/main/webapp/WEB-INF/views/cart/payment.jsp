<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_Payment</title>
<link rel="stylesheet" href="../resources/css/home.css">
<script type="text/javascript" src="../resources/js/cart_payment.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/home.js"></script>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<table>
				<tr>
					<td>
						<img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
					</td>
					<td>
						<h4>상품 이름</h4>
						<h4>가구 정보</h4>
					</td>
					<td>
						<h2>주문내역</h2>
						<h4>제품가격 : 100000</h4>
					</td>
					<td>
						<h1>주소</h1> 
						<br>회원정보와 동일 
						<input type="checkbox" checked="true" id="check"><br> 
						<input type="text" name="address" id="address"><br> 
						<input type="text" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td>
						<img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
					</td>
					<td>
						<h4>상품 이름</h4>
						<h4>가구 정보</h4>
					</td>
					<td>
						<h2>주문내역</h2>
						<h4>제품가격 : 100000</h4>
					</td>
					<td>
						<h2>결제</h2>
						<h4>배송비 : 20000</h4>
						<h4>총 주문금액 : 100000</h4>
					</td>
				</tr>
			</table>
			<a href="/cart/list">장바구니로</a> 
			<a href="/">메인으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>