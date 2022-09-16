<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/review.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
<div id="entry_area">
	<%@ include file="../header.jsp"%>
	<div id="content_area">
		<div id="container">	
			<!-- 리뷰 시작 -->
			<div id="review">
				<div>
					
				</div>
				<label>리뷰</label>
				<div id="pro">
					<table>
						<tr>
							<th>상품 번호</th>
							<td>${pro.pno}</td>
							<th>상품명</th>
							<td><a href="/board/detail?pno=${pro.pno}" id="Rwrite">${pro.pname}</td>
						</tr>
					</table>
					<a href='/board/reviewwrite?pno=${pro.pno}'>리뷰 작성하기</a>
				</div>
				<div id="scopecnt">	</div>
				<div id="index">
					<a href="/board/newreview">최신순 /</a>
					<a href=""> 베스트순</a>
				</div> 
				
				<!-- 리뷰 목록  -->
				<div id="list">
					<h3>리뷰 목록</h3>
					<c:forEach items="${list}" var="list">
						<table>
							<tr>
								<th>리뷰번호</th>
								<td colspan="3">
									<input type="hidden" name="pno" value="${list.pno}" id="pno">
									<input type="hidden" name="rno" value="${list.rno}" id="rno">
									<input type="hidden" name="uuid" value="${list.uuid}">
									<input type="hidden" name="uploadpath" value="${list.uploadpath}">
									<input type="hidden" name="filename" value="${list.filename}">
									<input type="hidden" name="image" value="${list.image}">
									${list.rno}
								</td>
							</tr>
							<tr>
								<th>아이디</th><td>${list.id}</td>
								<th>등록일</th><td>${list.regdate}</td>
							</tr>
								<tr>
								<th>평점</th>
								<td colspan="3">${list.scope}</td>
							</tr>
							
							<c:choose>
								<c:when test="${empty list.uuid }">
								</c:when>
								<c:otherwise>
									<tr>
										<th>사진</th>
										<td colspan="3">
											<c:url value="http://localhost:8080/board/display?" var="url">
												<c:param name="filename" value="${list.uploadpath}/s_${list.uuid}_${list.filename}" />
											</c:url>
											<img src="${url}">
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
							<tr>
								<th>내용</th>
								<td colspan="3">${list.content}</td>
							</tr>
						</table>
					</c:forEach>
					
					<div id="paging">
						<c:if test="${paging.prev}">
							<a href="/board/newreview?pno=${paging.cri.pno}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
							<a href="/board/newreview?pno=${paging.cri.pno}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
						</c:forEach>
						<c:if test="${paging.next}">
							<a href="/board/newreview?pno=${paging.cri.pno}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 리뷰 끝 -->
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	
</div>
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/newreview.js"></script>
<script type="text/javascript" src="/resources/js/reviewWrite.js"></script>
</html>