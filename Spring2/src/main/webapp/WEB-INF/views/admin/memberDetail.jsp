<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/memberDetail.css">
<title>회원상세정보</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form>
				<table border="1">
					<tr class="title">
						<td colspan="8">▶ 주문내역</td>
					</tr>
					<tr id="menu">
						<td>no.</td><td>주문일시</td><td>주문상품</td><td>주문자</td><td>수량</td><td>주문금액</td><td>결제방식</td><td>현황</td>
					</tr>
					<tr>
						<td>1</td><td>2022.08.02</td><td>철제의자</td><td>이름1</td><td>2</td><td>10000</td><td>무통장입금</td><td>입금확인</td>
					</tr>
				</table>
				<input class="btn" type="submit" value="뒤로가기"
					formaction="/admin/memberList">
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>