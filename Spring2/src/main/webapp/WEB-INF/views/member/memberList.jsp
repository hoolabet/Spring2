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
<link rel="stylesheet" type="text/css" href="/resources/css/memberList.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">





			<h1>회원목록</h1>
			
			<input type="hidden" value="${userInfo.admin}" id="admin_check">
			<div id="search_id">
				<input type="text" name="id" id="id" placeholder="아이디 검색"> 
				<input type="button" value="검색">
			</div>
			<table id="member_list">
				<thead>
				    <tr>
				      <th>User Image</th>
				      <th>User Id</th>
				    </tr>
				</thead>
				<tbody id="member_list_res">
				</tbody>
			</table>






		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="/resources/js/memberList.js"></script>
</body>
</html>