<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/cart_payment.js"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td>
				<h1>주소</h1> 
				<br>회원정보와 동일
				<input type="checkbox" checked="true"id="check"><br> 
				<input type="text" name="address"id="address"><br> 
				<input type="text" placeholder="상세주소">
			</td>
			<td>
				<h2>결제</h2>
				<h4>총 주문금액 : 100000</h4>
			</td>
		</tr>
		<tr>
			<td>
				<h2>주문정보</h2> 
				<img src="https://www.ikea.com/kr/ko/images/products/nikkeby-chest-of-4-drawers-grey-green__0729044_pe738503_s3.jpg">
				<h4>상품 이름</h4>
				<h4>가구 정보</h4>
			</td>
			<td>
				<h2>주문내역</h2>
				<h4>제품가격 : 100000</h4>
				<h4>배송비 : 20000</h4>
				<h4>총 주문금액 : 120000</h4>
			</td>
		</tr>
	</table>
	<a href="/cart/list">장바구니로</a>
	<a href="/">메인으로</a>
</body>
</html>