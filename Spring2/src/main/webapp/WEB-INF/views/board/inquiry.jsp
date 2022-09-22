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
				<div id="list">
					<h3>문의 목록</h3>
					<div id="pro">
						<table>
							<tr>
								<th>상품 번호</th>
								<td>${pro.pno}</td>
								<th>상품명</th>
								<td><a class="hv" href="/board/detail?pno=${pro.pno}" id="Iwrite">${pro.pname}</a></td>
							</tr>
						</table>
						<p>답변이 있는 문의만 보기</p>
						<c:if test="${not empty userInfo.id}">
							<a href="/board/inquirywrite?pno=${pro.pno}">문의하기</a>
						</c:if>
						<c:if test="${empty userInfo.id}">
							<p>문의사항을 작성하시려면 <a class="hv" href="../member/login">로그인</a>해 주세요</p>
						</c:if>
						<input type="hidden" value="${userInfo.id}" name="userInfo">
					</div>
					<!-- 문의사항 목록 -->
					<div id="list">
					<form>
						<c:forEach items="${list}" var="list">
						<input type="hidden" name="pno" value="${list.pno}" id="pno">
						<input type="hidden" name="id" value="${list.id}" class="id">
						<input type="hidden" name="answer" value="${list.answer}" id="answer">
						<input type="hidden" name="ino" value="${list.ino}" class="ino">
						
							<table>
								<tr>
									<th>아이디</th><td class="msk"></td>
									<th>등록일</th><td>${list.regdate}</td>
								</tr>
								<tr id="question">
									<th>질문</th>
									<td colspan="3">${list.question}</td>
								</tr>
								<!-- 답변이 있는 경우 -->
								<c:if test="${not empty list.answer}">
									<tr id="answer">
										<th>답변</th>
										<td colspan="3">${list.answer}</td>
									</tr>
								</c:if>
								</table>
								<div id="ibtn">
									<!-- 로그인 아이디와 작성한 아이디가 같을 경우 삭제버튼 생성 -->
									<c:if test="${list.id eq userInfo.id }">
										<input class="delete" type="button" value="삭제" data-ino="${list.ino}">
									</c:if>
									<!-- 관리자 아이디로 로그인시 -->
									<c:if test="${userInfo.id eq 'aaaaa'}">
										<input class="answer" type="button" value="답변" data-ino="${list.ino}">
									</c:if>
								</div>
						</c:forEach>
					</form> 
					</div>
					
					<div id="paging">
						<c:if test="${paging.prev}">
							<a class="hv" href="/board/inquiry?pno=${paging.cri.search}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
							<a class="numhv" class="pagenum" href="/board/inquiry?pno=${paging.cri.search}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
						</c:forEach>
						<c:if test="${paging.next}">
							<a class="hv" href="/board/inquiry?pno=${paging.cri.search}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
						</c:if>
					</div>
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