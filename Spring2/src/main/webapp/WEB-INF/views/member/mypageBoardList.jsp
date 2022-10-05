<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/mypage.css"></link> -->
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<h1 id="title">글 목록</h1>
			<input type="hidden" id="id" value="${userInfo.id}">
			
			<h4>리뷰목록</h4>
			
			<table id="review_list" border="1">
			
			</table>
			
			<input type="hidden" value="${paging.total}" id="Rtotal">
				<c:if test="${paging.total != 0}">
					<button id="prev" class="paging">&#60;</button>
    				<span id="pagination"></span>
    				<button id="next" class="paging">&#62;</button>
				</c:if>
			<h4>문의목록</h4>
			<div id="qna_list">
			
			</div>

		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/mypageBoardList.js?ver=1.1"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>