<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<input type="hidden" value="${userInfo.id}" id="id">
			<table border="1" style="display:inline">
			<c:forEach items="${detail}" var="detail">
				<tr>
					<td><img src="/display?fileName=${detail.ivo.fullPath}" style="width:100px; height:100px;"></td>
					<td><a href="/board/detail?pno=${detail.pno}">상품명 : ${detail.bvo.pname}</a></td>
					<td>가격 : ${detail.bvo.price}</td>
					<td>수량 : ${detail.b_quantity}</td>
					<td>합계 : ${detail.bvo.price*detail.b_quantity}</td>
					<td>주문 일자 : ${detail.order_date}</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2">결제 금액 : ${payment.price}</td>
					<td colspan="2">수령인 : ${payment.name}</td>
					<td colspan="2">주소 : ${payment.address}</td>
				</tr>
			</table>
			<br>
			<a href="/order/research">주문내역 목록</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/order_detail.js?ver=1"></script>
</body>
</html>