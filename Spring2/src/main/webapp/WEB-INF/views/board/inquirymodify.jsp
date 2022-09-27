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
			<div id="modify">
				
				<h3>문의 답변</h3>
				<input type="hidden" name="userid" value="${userinfo.id}"> 
				 
				<input type="hidden" name="id" value="${detail.id}"> 
				<input type="hidden" name="id" value="${detail.id}"> 
				<input type="hidden" name="ino" value="${detail.ino}"> 
				<table>
					<tr>
						<th>제품번호</th>
						<td><input type="text" name="pno" value="${pro.pno}" id="pno" readonly></td>
						<th>제품이름</th>
						<td><input type="text" name="pname" value="${pro.pname}" id="pname" readonly></td>
					</tr>
					<tr>
						<th>문의사항</th>
						<td colspan="3"><textarea name="question" id="question" readonly>${detail.question}</textarea></td>
					</tr>
					<tr>
						<th>답변</th>
						<td colspan="3"><textarea name="answer" id="adminanswer">${detail.answer}</textarea></td>
					</tr>
				</table>
				<input type="submit" value="작성" id="wbtn">
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</div>			
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquirymodify.js"></script>

</html>