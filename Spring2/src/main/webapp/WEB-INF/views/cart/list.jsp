<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<h1>장바구니</h1>
		<hr>
		<table border="1">
			<tr>
				<td>
				    <input type="checkbox" name="furniture" value="chiffonier">
					<img src="https://www.ikea.com/kr/ko/images/products/nikkeby-chest-of-4-drawers-grey-green__0729044_pe738503_s3.jpg">
					<h4>상품 이름</h4> 가구 정보
				</td>
				<td>
				    <input type="checkbox" name="furniture" value="goblet">
					<img src="https://www.ikea.com/kr/ko/images/products/ikea-365-goblet-clear-glass__0712435_pe728848_s3.jpg">
					<h4>상품 이름</h4> 가구 정보
				</td>
			</tr>
			<tr>
				<td colspan="2">
				    <input type="submit" value="결제하기">
				</td>
			</tr>
		</table>
		    <p><a href="/cart/payment">결제창으로</a> <a href="/">메인으로</a></p>
	</form>
</body>
</html>