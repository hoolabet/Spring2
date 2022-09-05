<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1.1">
<link rel="stylesheet" href="../resources/css/noticeDetail.css?ver=1">
<title>${detail.title}</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form action="modify" method="post">
				<table>
					<tr class="content_tr">
						<td>제목</td>
						<td>${detail.title}</td>
					</tr>
					<tr class="content_tr">
						<td>내용</td>
						<td>${detail.content}</td>
					</tr>
					<c:if test="${userInfo.admin}">
					<tr class="content_tr">
						<td colspan="2">
							<div class="files"></div> <input type="button" value="수정" id="modi">
						</td>
					</tr>
					</c:if>
					<tr class="modify_tr">
						<td>제목</td>
						<td><input type="text" name="title" value="${detail.title}"><br></td>
					</tr>
					<tr class="modify_tr">
						<td>내용</td>
						<td><div id="modi_editor" contenteditable="true"
								style="overflow:scroll; width: 500px; height: 500px; background-color: white;">${detail.content}</div></td>
					</tr>
					<tr class="modify_tr">
						<td colspan="2">
						<div class="files"></div>
						<div>
							<input type="file" id="upload_input" name="uploadFile" multiple>
						</div>
						<div id="thumbnails"></div>
						<input type="submit" value="수정" id="sub">
							<input type="hidden" name="content" id="content"> <input
							type="hidden" name="nono" value="${detail.nono}" id="nono">
						</td>
					</tr>
				</table>
			</form>
			<c:if test="${userInfo.admin}">
			<br>
			<form action="remove" method="post">
				<input type="submit" value="삭제"> <input type="hidden"
					name="nono" value="${detail.nono}">
			</form>
			</c:if>
			<a
				href="/notice/list?pageNum=${criValue.cri.pageNum}&amount=${criValue.cri.amount}&type=${criValue.cri.type}&search=${criValue.cri.search}">목록으로</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/noticeDetail.js?ver=1.1"></script>
</body>
</html>