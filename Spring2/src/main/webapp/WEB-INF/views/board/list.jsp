<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_list.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>제품리스트</h1>
				<div id="p_write">
					<button id="btn_Write">상품등록</button>
				</div>
				<div id="p_list">
					<ul>
						<li id="popular"><a href="#">거실장(10)</a></li>
						<li id="last"><a href="#">쇼파(21)</a></li>
						<li id="lowprice"><a href="#">장식장(13)</a></li>
						<li id="highprice"><a href="#">진열장(12)</a></li>
					</ul>
				</div>
				<div id="array">
					<select>
						<option value="popular"><a href="#">인기순</a></option>
						<option value="last"><a href="#">최근등록순</a></option>
						<option value="lowprice"><a href="#">가격낮은순</a></option>
						<option value="highprice"><a href="#">가격높은순</a></option>
					</select>
				</div>
				<div id="list">
					<ul>
						<c:forEach items="${list}" var="boardlist">
							<li><a href="/board/detail?pno=${boardlist.pno}"> </a>
								<div id="${boardlist.pno}">
									<input class="pno" type="hidden" value="${boardlist.pno}">
								</div>
								<p>
									<a href="/board/detail?pno=${boardlist.pno}">${boardlist.pname}</a>
								</p>
								<p>가격 : ${boardlist.price}</p> <input type="text"
								value="${boardlist.pno}" name="pno"></li>
						</c:forEach>
					</ul>
				</div>
				 <%-- ${paging} --%>
				 <%-- ${num} --%>
				<!-- prev(이전)이 true이면 이전버튼 활성화 -->
				<c:if test="${paging.prev}">
					<a
						href="/board/list?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					<a href="/board/list?pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
				</c:forEach>
				<!-- next(다음)이 true이면 다음버튼 활성화 -->
				<c:if test="${paging.next}">
					<a
						href="/board/list?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
				</c:if>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script src="../resources/js/board_list.js"></script>
	<script src="../resources/js/imageAttach.js"></script>
</body>
</html>