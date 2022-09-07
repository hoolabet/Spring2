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
				<label>리뷰</label>
				<div id="scopecnt">
					<table>
						<tr>
							<td rowspan="5">평균 평점</td>
							<td rowspan="5">${savg}</td>
							<td>5점</td>
							<td>${sc5}</td>
						</tr>
						<tr>
							<td>4점</td>
							<td>${sc4}</td>
						</tr>
						<tr>
							<td>3점</td>
							<td>${sc3}</td>
						</tr>
						<tr>
							<td>2점</td>
							<td>${sc2}</td>
						</tr>
						<tr>
							<td>1점</td>
							<td>${sc1}</td>
						</tr>
					</table>
				</div>
				<div id="index">
					<a href="/board/newreview">최신순</a>
					<a href="">베스트순</a>
				</div>
				<!-- 리뷰 목록  -->
				<div id="list">
					<h3>리뷰 목록</h3>
					<c:forEach items="${list}" var="list">
						<table>
							<tr>
								<th>리뷰번호</th>
								<td colspan="3">${list.rno}</td>
							</tr>
							<tr>
								<th>아이디</th><td>${list.id}</td>
								<th>등록일</th><td>${list.regdate}</td>
							</tr>
								<tr>
								<th>평점</th>
								<td colspan="3">${list.scope}</td>
							</tr>
							<tr>
								<th>사진</th>
								<td colspan="3">img</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">${list.content}</td>
							</tr>
						</table>
					</c:forEach>
					
					<div id="paging">
						<c:if test="${paging.prev}">
							<a href="/board/newreview?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
							<a href="/board/newreview?pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
						</c:forEach>
						<c:if test="${paging.next}">
							<a href="/board/newreview?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
						</c:if>
					</div>
				</div>
				
				<div id="write">
					 <h3>리뷰 작성</h3>
					 <form method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"></td>
								<th>제품번호</th>
								<td><input type="text" name="pno"></td>
							</tr>
							<tr>
								<th>평점</th>
								<td colspan="3">
									<input type="radio" value="1" name="scope">1
									<input type="radio" value="2" name="scope">2
									<input type="radio" value="3" name="scope">3
									<input type="radio" value="4" name="scope">4
									<input type="radio" value="5" name="scope">5
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"><textarea name="content"></textarea></td>
							</tr>
							<tr>
								<th>이미지첨부</th>
								<td colspan="3"><input type="file" name="uploadFile" multiple></td>
							</tr>
						</table>
						<input type="button" value="작성" id="wbtn">
					</form>
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
<script type="text/javascript" src="/resources/js/review.js"></script>
</html>