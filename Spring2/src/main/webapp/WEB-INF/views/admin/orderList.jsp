<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>관리자 주문 내역</title>
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
				<div><label>전체 주문현황</label></div>
				<table id="total" border="1">
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
				<div><label>주문 목록</label></div>
				<table border="1">
					<tr id="menu">	
						<td>주문일시</td><td>주문상품</td><td>주문자</td><td>수량</td>
						<td>주문금액</td><td>결제방식</td><td>주문관리</td>
					</tr>
					<tr>	
						<td>주문일시</td>
						<td>주문상품</td>
						<td>주문자</td>
						<td>수량</td>
						<td>주문금액</td>
						<td>결제방식</td>
						<td>주문관리</td>
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