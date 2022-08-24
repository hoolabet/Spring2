<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>관리자 회원 관리</title>
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
				<form>
					<div><label>회원 목록</label></div>
					<table border="1">
						<tr id="menu">
							<td>아이디</td>
							<td>이름</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>성별</td>
							<td>생일</td>
							<td>주소1</td>
							<td>주소2</td>
							<td>주소3</td>
							<td>가입날짜</td>
						</tr>
						<c:forEach items="${memberlist}" var="memberlist">
							<tr>
								<td>${memberlist.id}</td>
								<td>${memberlist.name}</td>
								<td>${memberlist.email}</td>
								<td>${memberlist.phone}</td>
								<td>${memberlist.gender}</td>
								<td>${memberlist.birth}</td>
								<td>${memberlist.address1}</td>
								<td>${memberlist.address2}</td>
								<td>${memberlist.address3}</td>
								<td>${memberlist.sign_date}</td>
							</tr>
						</c:forEach>
					</table>
					<input class="btn" type="submit" value="뒤로가기"
						formaction="/admin/main">
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>