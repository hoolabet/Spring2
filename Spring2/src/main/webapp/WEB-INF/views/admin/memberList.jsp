<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/memberList.css">
<title>관리자 회원 관리</title>
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
			<form>
				<table border="1">
					<tr class="title">
   						 <td colspan="7">▶ 회원 목록</td>
					</tr>
					<tr id="menu">
						<td>아이디</td>
						<td>이름</td>
						<td>회원번호</td>
						<td>주소</td>
						<td>성별</td>
						<td>가입날짜</td>
						<td>주문내역</td>
					</tr>
					<tr>
						<td>aa11</td>
						<td>이름1</td>
						<td>1111</td>
						<td>울산</td>
						<td>여</td>
						<td>2022-07-18</td>
						<td><input type="submit" value="주문내역"
							formaction="/admin/memberDetail"></td>
					</tr>
					<tr>
						<td>bb22</td>
						<td>이름2</td>
						<td>2222</td>
						<td>서울</td>
						<td>남</td>
						<td>2022-08-01</td>
						<td><input type="submit" value="주문내역"
							formaction="/admin/memberDetail"></td>
					</tr>
				</table>
				<input class="btn" type="submit" value="뒤로가기"
					formaction="/admin/list">
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>