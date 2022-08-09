<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/orderDetail.css">
<title>주문 상세</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form name="btnForm" action="/admin/orderList">
			<table border="1">
				<tr class="title">
   					 <td colspan="2">▶ 주문 상세</td>
				</tr>
				<tr>
					<td id="menu">상품명</td>
					<td>철제의자</td>
				</tr>
				<tr>
					<td id="menu">아이디</td>
					<td>aa11</td>
				</tr>
				<tr>	
					<td id="menu">주문자</td>
					<td>이름1</td>
				</tr>
				<tr>		
					<td id="menu">판매가</td>
					<td>5000</td>
				</tr>
				<tr>		
					<td id="menu">수량</td>
					<td>2</td>
				</tr>
				<tr>		
					<td id="menu">주문금액</td>
					<td>10000</td>
				</tr>
				<tr>		
					<td id="menu">현황</td>
					<td>
						<select>
							<option>입금대기</option>
							<option selected>입금확인</option>
							<option>배송중</option>
							<option>배송완료</option>
							<option>구매확정</option>
							<option>취소</option>
							<option>환불</option>
						</select>
					</td>
				</tr>
				<tr>		
					<td id="menu">송장번호</td>
					<td><input id="delNum" type="text" value="123456789"></td>
				</tr>
				<tr>
					<td id="menu">주소</td>
					<td colspan="6">울산</td>
				</tr>
				<tr>
					<td id="menu">전화번호</td>
					<td colspan="6">010-0000-0000</td>
				</tr>
				<tr>
					<td id="menu">기타요구사항</td>
					<td colspan="6"><textarea id="request">빠른배송</textarea></td>
				</tr>
				<tr>
					<td id="menu">관리자 메모</td>
					<td colspan="6"><textarea id="memo"></textarea></td>
				</tr>
			</table>
			<input class="btn" type="submit" value="뒤로가기">
			<input class="btn" type="submit" onclick="savebtn()" value="저장하기">
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script src="../resources/js/admin/orderDetail.js"></script>	
</body>
</html>