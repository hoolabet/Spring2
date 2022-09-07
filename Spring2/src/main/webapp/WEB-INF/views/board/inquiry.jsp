<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/inquiry.css" type="text/css">
</head>
<body>
<div id="entry_area">
	<%@ include file="../header.jsp"%>
	<div id="content_area">
		<div id="container">
			<!-- 문의 시작 -->
			<div id="inquiry">
				<label>문의</label>
				<div id="list">
					<h3>문의 목록</h3>
					<c:forEach items="${list}" var="list">
						<table id="question">
							<tr>
								<th>아이디</th><td>${list.id}</td>
								<th>등록일</th><td>${list.regdate}</td>
							</tr>
							<tr>
								<th>질문</th>
								<td colspan="3">${list.question}</td>
							</tr>
							<tr id="answer">
								<th>답변</th>
								<td colspan="3">${list.answer}</td>
							</tr>
						</table>
					</c:forEach> 
					
					<div id="paging">
						<c:if test="${paging.prev}">
							<a href="/board/inquiry?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
							<a href="/board/inquiry?pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
						</c:forEach>
						<c:if test="${paging.next}">
							<a href="/board/inquiry?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
						</c:if>
					</div>
				</div>
				<div id="write">
					<h3>문의 작성</h3>
					<form method="post">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"></td>
								<th>제품번호</th>
								<td><input type="text" name="pno"></td>
							</tr>
							<tr>
								<th>문의사항</th>
								<td colspan="3"><textarea name="question"></textarea></td>
							</tr>
						</table>
						<input type="button" value="작성" id="wbtn">
					</form>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquiry.js"></script>
</html>