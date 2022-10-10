<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detail.id}의 상세페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/memberDetail.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<input type="hidden" value="${userInfo.admin}" id="admin_check">
			<input type="hidden" id="id" value="${detail.id}">

			<h1>회원 상세</h1>
			<div id="member_detail_box">
			<table id="member_detail">
				<tr>
					<td rowspan="4" id="user_img_td"><img src="${detail.userImg}" width="120px"></td>
					<td colspan="3">아이디 : ${detail.id}</td>
				</tr>
				<tr>
					<td>이메일 : ${detail.email}</td>
					<td colspan="2">이름 : ${detail.name}</td>
				</tr>
				<tr>
					<td>전화번호 : ${detail.phone}</td>
					<td>성별 : ${detail.gender}</td>
					<td>생년월일 : ${detail.birth_y}년${detail.birth_m}월${detail.birth_d}일</td>
				</tr>
				<tr>
					<td colspan="3">가입일 : ${detail.sign_date}</td>
				</tr>
			</table>
			
			
			</div>

			<h2>리뷰목록</h2>
			
			<div id="review_list">
			
			</div>
			
			<input type="hidden" value="${paging.total}" id="Rtotal">
			<div class="page_button">
				<c:if test="${paging.total != 0}">
					<button id="prev" class="paging">&#60;</button>
    				<span id="pagination"></span>
    				<button id="next" class="paging">&#62;</button>
				</c:if>
			</div>
			<h2>문의목록</h2>
			<div id="qna_list">
			
			</div>
			<input type="hidden" value="${pagingQna.total}" id="RtotalQna">
			<div class="page_button">
				<c:if test="${pagingQna.total != 0}">
					<button id="prevQ" class="pagingQ">&#60;</button>
    				<span id="paginationQna"></span>
    				<button id="nextQ" class="pagingQ">&#62;</button>
				</c:if>
			</div>
	
	

	
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/memberDetail.js"></script>
	<script type="text/javascript" src="/resources/js/mypageBoardList.js?ver=1.1"></script>
</body>
</html>