<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/inquiry.css"
	type="text/css">
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
						<input type="button" value="뒤로가기" id="listback">
						<div id="pro">
							<table>
								<tr>
									<th class="fixhv">상품 번호</th>
									<td class="fixhv">${pro.pno}</td>
									<th class="fixhv">상품명</th>
									<td class="fixhv"><a class="hv" href="/board/detail?pno=${pro.pno}"
										id="Iwrite">${pro.pname}</a></td>
								</tr>
							</table>
							<div id="wrorlo">
								<c:if test="${not empty userInfo.id && userInfo.id ne 'aaaaa'}">
									<a href="/board/inquirywrite?pno=${pro.pno}">문의하기</a>
								</c:if>
								<c:if test="${empty userInfo.id}">
									<p>
										문의사항을 작성하시려면 <a href="../member/login">로그인</a>해 주세요
									</p>
								</c:if>
							</div>
							<input type="hidden" value="${userInfo.id}" name="userInfo">
						</div>
						<!-- 문의사항 목록 -->
						<div id="list">
							<form>
								<c:forEach items="${list}" var="list">
									<input type="hidden" name="pno" value="${list.pno}" id="pno">
									<input type="hidden" name="id" value="${list.id}" class="id">
									<input type="hidden" name="answer" value="${list.answer}"
										id="answer">
									<input type="hidden" name="ino" value="${list.ino}" class="ino">
									<input type="hidden" name="secret" value="${list.secret}"
										class="secret">

									<table>
										<tr>
											<th>아이디</th>
											<td class="msk"></td>
											<th>등록일</th>
											<td>${list.regdate}</td>
											<td class="yorn"><c:if test="${not empty list.answer}">
													<span id="complete"> 답변완료</span>
												</c:if> <c:if test="${empty list.answer}">
											미답변
										</c:if></td>
										</tr>
										<tr id="question">
											<th>질문</th>
											<td colspan="4"><c:choose>
													<c:when
														test="${list.secret eq 1 && list.id ne userInfo.id && userInfo.id ne 'aaaaa'}">
												비밀글 입니다.	
											</c:when>
													<c:otherwise>
												<div class="tdleft">${list.question}</div>
											</c:otherwise>
												</c:choose></td>
										</tr>
										<!-- 답변이 있는 경우 -->
										<c:choose>
											<c:when
												test="${not empty list.answer && list.secret eq 1 && list.id ne userInfo.id && userInfo.id ne 'aaaaa'}">
												<tr id="answer">
													<th>답변</th>
													<td colspan="4">비밀글 입니다.</td>
												</tr>
											</c:when>
											<c:when test="${not empty list.answer}">
												<tr id="answer">
													<th>답변</th>
													<td colspan="4" class="tdleft">${list.answer}</td>
												</tr>
											</c:when>
										</c:choose>
									</table>
									<div id="ibtn">
										<!-- 로그인 아이디와 작성한 아이디가 같을 경우 삭제버튼 생성 -->
										<c:if test="${list.id eq userInfo.id }">
											<input class="delete" type="button" value="삭제"
												data-ino="${list.ino}">
										</c:if>
										<!-- 관리자 아이디로 로그인시 -->
										<c:if test="${userInfo.id eq 'aaaaa' && empty list.answer}">
											<input class="answer" type="button" value="답변"
												data-ino="${list.ino}">
										</c:if>
										<c:if test="${userInfo.id eq 'aaaaa' && not empty list.answer}">
											<input class="answer" type="button" value="수정"
												data-ino="${list.ino}">
										</c:if>
									</div>
								</c:forEach>
							</form>
						</div>

						<div id="paging">
							<c:if test="${paging.prev}">
								<a class="hv"
									href="/board/inquiry?pno=${paging.cri.search}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
								var="num">
								<a id="${num}" class="numhv" class="pagenum"
									href="/board/inquiry?pno=${paging.cri.search}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
							</c:forEach>
							<c:if test="${paging.next}">
								<a class="hv"
									href="/board/inquiry?pno=${paging.cri.search}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquiry.js"></script>
<script type="text/javascript" src="/resources/js/inquirybackbtn.js"></script>
</html>