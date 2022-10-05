<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰적용</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
</head>
<body>
	<input type="hidden" value="${userInfo.id}" id="id">
	<input type="hidden" value="${cart.cptno}" id="already">
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
				<input 
					type="radio" 
					name="sel" 
					value="${coupon.cptno}" 
					id="r${coupon.cptno}" 
					data-cpno="${coupon.cpno}"
					data-cpmax="${coupon.cpvo.cpmax}" 
					data-cpreq="${coupon.cpvo.cpreq}" 
					data-apply="${coupon.doApply}" 
					data-area="${coupon.category_area}" 
					data-type="${coupon.category_type}"
				>
				<input type="button" value="쿠폰적용취소" class="cancel" data-cptno="${coupon.cptno}">
				<input type="hidden" value="${coupon.cpvo.cpvalue}" id="${coupon.cptno}">
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
				<input type="hidden" id="cptno_val">
				<input type="hidden" id="cpno_val">
				<input type="hidden" id="pno_val" value="${cart.pno}">
				<input type="hidden" id="area_val">
				<input type="hidden" id="type_val">
			</td>
		</tr>
	</table>
	<button id="done">적용하기</button>
	<button id="close">취소</button>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/coupon.js?ver=1"></script>
</body>
</html>