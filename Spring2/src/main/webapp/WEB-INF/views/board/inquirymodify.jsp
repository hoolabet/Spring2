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
				<div id="modify">

					<h3>문의 답변</h3>
					<input type="button" value="뒤로가기" class="back">
					<input type="hidden" name="userid" value="${userinfo.id}">

					<input type="hidden" name="id" value="${detail.id}"> 
					<input type="hidden" name="id" value="${detail.id}"> 
					<input type="hidden" name="ino" value="${detail.ino}">
					<input type="hidden" name="answer" value="${detail.answer}">
						 
					<table class="cp">
						<tr>
							<th>제품번호</th>
							<td><input type="text" name="pno" value="${pro.pno}"
								id="pno" readonly></td>
							<th>제품이름</th>
							<td><input type="text" name="pname" value="${pro.pname}"
								id="pname" readonly></td>
						</tr>
						<tr>
							<th>문의사항</th>
							<td colspan="3"  class="tdleft">${detail.question}</td>
						</tr>
						<tr id="modifyanswer">
							<th>답변</th>
							<td colspan="3" id="reanswer"  class="tdleft">
							</td>
						</tr>
					</table>
					<input type="submit" value="작성" id="wbtn">
				</div>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquirymodify.js"></script>
<script type="text/javascript" src="/resources/js/inquirybackbtn.js"></script>

</html>