<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰적용</title>
</head>
<body>
	<input type="hidden" value="${userInfo.id}" id="id">
	<input type="hidden" value="${cart.cpno}" id="already">
	<table>
	<c:forEach items="${coupon}" var="coupon">
		<tr>
			<td>${coupon.cpvo.cpname}</td>
			<td>
				<c:choose>
					<c:when test="${coupon.cpvo.cptype eq 'P'}">
						${coupon.cpvo.cpvalue}% 할인
					</c:when>
					<c:otherwise>
						${coupon.cpvo.cpvalue}원 할인
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				최소주문금액 : ${coupon.cpvo.cpreq}원
			</td>
			<td>
				최대할인금액 : ${coupon.cpvo.cpmax}원
			</td>
			<td>사용가능기한 : ~${coupon.exp_date}</td>
			<td>
				<input type="radio" name="sel" value="${coupon.cpno}" id="r${coupon.cpno}" data-cpmax="${coupon.cpvo.cpmax}" data-cpreq="${coupon.cpvo.cpreq}">
				<input type="button" value="쿠폰적용취소" class="cancel" data-cpno="${coupon.cpno}">
				<input type="hidden" value="${coupon.cpvo.cpvalue}" id="${coupon.cpno}">
			</td>
		</tr>
	</c:forEach>
		<tr>
			<td>${cart.bvo.pname}</td>
			<td>가격 : ${cart.bvo.price}</td>
			<td>수량 : ${cart.b_quantity}</td>
			<td>
				총가격 : ${cart.bvo.price*cart.b_quantity}
				<input type="hidden" value="${cart.bvo.price*cart.b_quantity}" id="bPriceS">
			</td>
			<td>
				할인적용금액 : <span id="dcp"></span>
				<input type="hidden" value="${cart.bvo.price*cart.b_quantity}" id="pp">
				<input type="hidden" id="cpno_val">
				<input type="hidden" id="pno_val" value="${cart.pno}">
			</td>
		</tr>
	</table>
	<button id="done">적용하기</button>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/coupon.js?ver=1"></script>
</body>
</html>