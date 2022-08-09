<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/orderList.css">
<title>관리자 주문 내역</title>
</head>
<body>
<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="nav">
				<ul>
					<li><a href="/admin/list">관리자 메인</a></li>
					<li><a href="/admin/productList">상품 목록</a></li>
					<li><a href="/admin/orderList">주문 내역</a></li>
					<li><a href="/admin/memberList">회원 관리</a></li>
				</ul>
			</div>
			<div id="main">
				<table id="total">
					<tr class="title">
						<td colspan="7">▶ 전체 주문현황</td>
					</tr>
					<tr id="menu">
						<td>입금대기</td>
						<td>입금확인</td>
						<td>배송중</td>
						<td>배송완료</td>
						<td>구매확정</td>
						<td>취소</td>
						<td>환불</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</table>
				<form>
				<table border="1">
					<tr class="title">
						<td colspan="7">▶ 주문 목록</td>
					</tr>
					<tr id="menu">	
						<td>주문일시</td><td>주문상품</td><td>주문자</td><td>수량</td>
						<td>주문금액</td><td>결제방식</td><td>주문관리</td>
					</tr>
					<tr>	
						<td>2022.08.02</td>
						<td>철제의자</td>
						<td>이름1</td>
						<td>2</td>
						<td>10000</td>
						<td>무통장입금</td>
						<td><input type="submit" value="주문관리" formaction="/admin/orderDetail"></td>
					</tr>
					<tr>	
						<td>2022.08.01</td>
						<td>가죽쇼파</td>
						<td>이름2</td>
						<td>1</td>
						<td>800000</td>
						<td>카드</td>
						<td><input type="submit" value="주문관리" formaction="/admin/orderDetail"></td>
					</tr>
				</table>
				<input class="btn" type="submit" value="뒤로가기" formaction="/admin/list">
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>