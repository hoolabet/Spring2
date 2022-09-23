<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/review.css"
	type="text/css">

</head>
<body>
<div id="entry_area">
	<%@ include file="../header.jsp"%>
	<div id="content_area">
		<div id="container">
			<!-- 리뷰 시작 -->
			<div id="write">
				<h3>리뷰 작성</h3>
				
				<form method="post" id="form" action="/board/reviewwrite">
					<input type="hidden" value="${userInfo.id}" name="id" class="input">
					
					<table id="t_reviewWrite">
						<tr>
							<th>제품번호</th>
							<td><input type="text"  value="${pro.pno}" name="pno" class="input"></td>
							<th>제품이름</th>
							<td><input type="text"  value="${pro.pname}" name="pname" class="input"></td>
						</tr>
						<tr>
							<th>평점</th>
							<td colspan="3" style="text-align: center">
								<input type="radio" value="1" name="scope" class="input">1
								<input type="radio" value="2" name="scope" class="input">2
								<input type="radio" value="3" name="scope" class="input">3
								<input type="radio" value="4" name="scope" class="input">4
								<input type="radio" value="5" name="scope" class="input">5
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="content"></textarea></td>
						</tr>
						<tr>
							<th>사진 첨부</th>
							<td colspan="3"><input type="file" id="file" name="uploadFile" accept=".jpg,.jpeg,.png"></td>
						</tr>
						<tr>
							<th>사진 미리보기</th>
							<td colspan="3"><div id="uploadResult"></div></td>
						</tr>
					</table>
				
					
					<input type="button" value="작성" id="wbtn">
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
	<script src="../resources/js/home.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
</html>