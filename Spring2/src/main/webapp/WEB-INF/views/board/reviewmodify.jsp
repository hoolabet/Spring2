<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<input type="text" value="${userInfo.id}" name="id">
					<input type="text" value="${rlist.rno}" name="rno">
					<table>
						<tr>
							<th>제품번호</th>
							<td><input type="text"  value="${pro.pno}" name="pno"></td>
							<th>제품이름</th>
							<td><input type="text"  value="${pro.pname}" name="pname"></td>
						</tr>
						<tr>
							<th>평점</th>
							<td colspan="3">
								<input type="radio" value="1" name="scope" ${rlist.scope == 1? 'checked = "true"':'' }>1
								<input type="radio" value="2" name="scope"  ${rlist.scope == 2? 'checked = "true"':'' }>2
								<input type="radio" value="3" name="scope"  ${rlist.scope == 3? 'checked = "true"':'' }>3
								<input type="radio" value="4" name="scope"  ${rlist.scope == 4? 'checked = "true"':'' }>4
								<input type="radio" value="5" name="scope"  ${rlist.scope == 5? 'checked = "true"':'' }>5
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="content">${rlist.content}</textarea></td>
						</tr>
						<tr>
							<th>사진 첨부</th>
							<td colspan="3"><input type="file" id="file" name="uploadFile" accept=".jpg,.jpeg,.png">
								
							</td>
						</tr>
						<tr>
							<th>사진 미리보기</th>
							<td colspan="3"><div id="uploadResult">
							<input type='text' name='filename' value="${rlist.filename}" >;
								<input type='text' name='uuid' value="${rlist.uuid}">;
								<input type='text' name='uploadpath' value="${rlist.uploadpath}">;
								<input type='text' name='image' value="${rlist.image}">;
							</div></td>
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