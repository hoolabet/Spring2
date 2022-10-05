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
			<div id="write">
				<h3>리뷰 수정</h3>
				
				<form method="post" id="form" action="/board/reviewmodify">
					<input type="hidden" value="${userInfo.id}" name="id">
					<input type="hidden" value="${rlist.rno}" name="rno">
					<table id="t_reviewWrite">
						<tr>
							<th>제품번호</th>
							<td><input type="text"  value="${pro.pno}" name="pno" readonly class="input"></td>
							<th>제품이름</th>
							<td><input type="text"  value="${pro.pname}" name="pname" readonly class="input"></td>
						</tr>
						<tr>
							<th>평점</th>
							<td colspan="3" style="text-align: center" id="starRate">
								<input type="radio" value="5" name="scope" id="rate1" ${rlist.scope == 5? 'checked = "true"':'' }>
									<label for="rate1">★</label> 
								<input type="radio" value="4" name="scope"id="rate2" ${rlist.scope == 4? 'checked = "true"':'' }>
									<label for="rate2">★</label> 
								<input type="radio" value="3" name="scope" id="rate3" ${rlist.scope == 3? 'checked = "true"':'' }>
									<label for="rate3">★</label> 
								<input type="radio" value="2" name="scope"id="rate4" ${rlist.scope == 2? 'checked = "true"':'' }>
									<label for="rate4">★</label> 
								<input type="radio" value="1" name="scope" id="rate5" ${rlist.scope == 1? 'checked = "true"':'' }>
									<label for="rate5">★</label> 
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="content" id="modify_Content">${rlist.content}</textarea></td>
						</tr>
						<tr>
							<th>사진 첨부</th>
							<td colspan="3"><input type="file" id="file" name="uploadFile" accept=".jpg,.jpeg,.png">
								
							</td>
						</tr>
						<tr>
							<th>사진 미리보기</th>
							<td colspan="3"><div id="uploadResult">
							<c:if test="${rlist.filename ne null}">
								<c:url value="http://localhost:8080/board/display?" var="url">
									<c:param name="filename" value="${rlist.uploadpath}/s_${rlist.uuid}_${rlist.filename}" />
								</c:url>
								<img src="${url}">
								<input type='hidden' name='filename' value="${rlist.filename}" >
								<input type='hidden' name='uuid' value="${rlist.uuid}">
								<input type='hidden' name='uploadpath' value="${rlist.uploadpath}">
								<input type='hidden' name='image' value="${rlist.image}">
							</div>
							</c:if>
							</td>
						</tr>
					</table>
				
					
					<input type="button" value="수정하기" id="wbtn_m">
				</form>
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
<script type="text/javascript" src="/resources/js/reviewmodify.js"></script>
</html>