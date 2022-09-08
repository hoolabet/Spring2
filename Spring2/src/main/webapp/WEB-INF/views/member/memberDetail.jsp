<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detail.id}의 상세페이지</title>


<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/memberDetail.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">



			<h1>회원 상세</h1>
			<div id="member_detail">
			<table border="1">
				<tr>
					<td><img src="${detail.userImg}" width="100px"></td>
					<td>아이디 : ${detail.id}</td>
					<td>이름 : ${detail.name}</td>
				</tr>
				<tr>
					<td>이메일 : ${ }</td>
				</tr>
			</table>
			
			
			</div>


	
	
	
	
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/memberDetail.js"></script>
</body>
</html>