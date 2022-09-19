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
			<table border="1" style="display:inline";"border-collapse:collapse";>
			<c:forEach items="${payment}" var="payment">
				<tr>
					<td>${payment.payno}</td>
					<td><a href="/order/detail?payno=${payment.payno}">주문상세정보</a></td>
					<td>${payment.price}</td>
					<td>${payment.payment_date}</td>
				</tr>
			</c:forEach>
			</table>
			<br>
			<c:if test="${paging.prev}">
				<a
					href="/order/research?pageNum=${paging.endPage-10}&amount=${paging.cri.amount}&search=${paging.cri.search}">이전</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a
					href="/order/research?pageNum=${num}&amount=${paging.cri.amount}&search=${paging.cri.search}">${num}</a>
			</c:forEach>
			<c:if test="${paging.next}">
				<a
					href="/order/research?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}&search=${paging.cri.search}">다음</a>
			</c:if>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/order_research.js?ver=1"></script>
</body>
</html>