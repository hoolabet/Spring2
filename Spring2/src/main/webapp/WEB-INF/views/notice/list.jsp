<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/qnaList.css?ver=1">
<title>notice</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<table>
				<tr>
					<td id="td_1">no</td>
					<td id="td_2">title</td>
					<td id="td_3">regdate</td>
				</tr>
				<c:forEach var="list" items="${noList}">
					<tr>
						<td>${list.nono}</td>
						<td><a href="detail?nono=${list.nono}">${list.title}</a></td>
						<td>${list.regdate}</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<form action="/notice/list" id="search_form">
				<input type="hidden" name="pageNum" value="1"> <input
					type="hidden" name="amount" value="${paging.cri.amount}"> <select
					name="type">
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="tc">제목+내용</option>
				</select> <input type="text" name="search"> <input type="submit"
					value="찾기">
			</form>
			<br> <br> <a
				href="/notice/list?pageNum=1&amount=${paging.cri.amount}&type=${paging.cri.type}&search=${paging.cri.search}">처음으로</a>
			<c:if test="${paging.prev}">
				<a
					href="/notice/list?pageNum=${paging.endPage-10}&amount=${paging.cri.amount}&type=${paging.cri.type}&search=${paging.cri.search}">이전</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a
					href="/notice/list?pageNum=${num}&amount=${paging.cri.amount}&type=${paging.cri.type}&search=${paging.cri.search}">${num}</a>
			</c:forEach>
			<c:if test="${paging.next}">
				<a
					href="/notice/list?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}&type=${paging.cri.type}&search=${paging.cri.search}">다음</a>
			</c:if>
			<a
				href="/notice/list?pageNum=${paging.realEnd}&amount=${paging.cri.amount}&type=${paging.cri.type}&search=${paging.cri.search}">맨끝으로</a>
			<br> <a href="write">글쓰기</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>