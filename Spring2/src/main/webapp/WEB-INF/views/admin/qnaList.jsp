<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>QnA 목록</title>
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
					<div><label>QnA 목록</label></div>
					<table border="1">
						<tr id="menu">
							<td>제목</td>
							<td>내용</td>
						</tr>
						<c:forEach items="${qnalist}" var="qnalist">
							<tr>
								<td>${qnalist.title}</td>
								<td>${qnalist.content}</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>