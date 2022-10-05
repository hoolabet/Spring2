<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<title>제작 페이지</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<h1>제작 목록</h1>
			<table border="1" style="display:inline;">
				<c:forEach items="${made}" var="made">
				<tr>
					<td>종류 : ${made.kind}</td>
					<td>재료 : ${made.ingre}</td>
					<td>가로 : ${made.len1}</td>
					<td>세로 : ${made.len2}</td>
					<td>높이 : ${made.len3}</td>
					<td>색상 : ${made.color}</td>
					<td>
						<input type="button" value="장바구니에 담기" data-mno="${made.mno}" class="cart_btn">
						<input 
							type="hidden" 
							id="${made.mno}"
							data-id="${made.id}"
							data-kind="${made.kind}"
							data-ingre="${made.ingre}"
							data-len1="${made.len1}"
							data-len2="${made.len2}"
							data-len3="${made.len3}"
							data-color="${made.color}"
						>
					</td>
					<td>
						<input type="button" value="삭제" class="made_remove" data-mno="${made.mno}">
					</td>
				</tr>
				</c:forEach>
			</table>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/made_list.js?ver=1"></script>
</body>
</html>