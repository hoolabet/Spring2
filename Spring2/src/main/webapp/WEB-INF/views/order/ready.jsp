<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_List</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<input type="hidden" name="id" value="${userInfo.id}"> <span><input
				type="radio" name="destination" checked>직접입력</span>
			<c:forEach var="des" items="${des}" varStatus="index">
				<span> <input type="radio" name="destination"
					id="des_${index.count}">${des.dname}
				</span>
				<input type="hidden" id="des_${index.count}_dname"
					value="${des.dname}">
				<input type="hidden" id="des_${index.count}_name"
					value="${des.name}">
				<input type="hidden" id="des_${index.count}_phone"
					value="${des.phone}">
				<input type="hidden" id="des_${index.count}_address"
					value="${des.address}">
				<input type="hidden" id="des_${index.count}_dmemo"
					value="${des.dmemo}">
			</c:forEach>
			<br> <input type="text" name="dname" id="dname"	placeholder="배송지명" required><br> 
			<input type="text" name="name" id="name" placeholder="이름" required><br> 
			<input type="text" name="phone" id="phone" placeholder="전화번호" required><br>
			<input type="text" name="address" id="address" placeholder="주소" required><br> 
			<input type="text" name="dmemo"	id="dmemo" placeholder="배송메모" required><br> <br>
			<c:forEach var="cart" items="${cart}">
				<input type="hidden" value="${cart.pno}" class="order_pno">
				<table border="1" style="display: inline-block; border-collapse: collapse;">
					<tr>
						<td><a href="/board/detail?pno=${cart.pno}"> 
								<c:choose>
								<c:when test="${fn:contains(cart.ivo.fullPath,'http')}">
								<img
								src="${cart.ivo.fullPath}"
								style="width: 200px; height: 200px;">
								</c:when>
								<c:otherwise>
								<img
								src="/display?fileName=${cart.ivo.fullPath}"
								style="width: 200px; height: 200px;">
								</c:otherwise>
								</c:choose>
						</a></td>
						<td style="width: 500px;">
							<p>${cart.bvo.pname}</p>
							<p>
								가격 : <span>${cart.bvo.price}</span>
								할인된 가격 : <span id="${cart.pno}_p">${cart.bvo.price}</span>
								<input type="hidden" id="${cart.pno}_ph" value="${cart.bvo.price}">
							</p>
							<p>
								<input type="text" value="${cart.b_quantity}" size="2" readonly>
							</p>
							<p>
								합계 : <span>${cart.bvo.price*cart.b_quantity}</span>
								할인된 합계 : <span class="prices" id="${cart.pno}_ps">${cart.bvo.price*cart.b_quantity}</span>
								<input type="hidden" id="${cart.pno}_psh" value="${cart.bvo.price*cart.b_quantity}">
							</p>
							<p>
								<input type="button" value="쿠폰 사용" class="use_coupon" data-pno="${cart.pno}" data-cptno="${cart.cptno}">
							</p>
						</td>
					</tr>
				</table>
				<br>
			</c:forEach>
			<p>
				<span>보유적립금 : </span>
				<span id="research_point"></span>
				<input type="hidden" id="able_point"><br>
				<input type="text" value="0" id="use_point">
				<input type="button" value="사용하기" id="point_btn" data-point="0"><br>
				총 결제금액 : <span id="last_price"></span> 
				<input type="hidden" name="price"> <br> 
				<input type="button" value="결제하기"	id="pay">
			</p>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/order_ready.js?ver=1"></script>
</body>
</html>