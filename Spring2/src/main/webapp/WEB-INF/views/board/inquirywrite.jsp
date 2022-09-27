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
			<div id="write">
				<h3>문의 작성</h3>
				<form>
					<input type="hidden" name="id" value="${userinfo.id}">
					<table>
						<tr>
							<th>제품번호</th>
							<td><input type="text" value="${pro.pno}" name="pno" readonly></td>
							<th>제품이름</th>
							<td><input type="text"  value="${pro.pname}" name="pname" readonly></td>
						</tr>
						<tr>
							<th>공개 설정</th>
							<td colspan="3">	
								<input type="checkbox" name="secret" value="1">비공개
							</td>
						</tr>
						<tr>
							<th>문의사항</th>
							<td colspan="3"><textarea  name="question"></textarea></td>
						</tr>
						<tr>
							<th colspan="4">안내사항</th>
						</tr>
						<tr>
							<td colspan="4">
								<p>- 문의내용에 대한 답변은 '상품 상세페이지'에서 확인 가능 합니다.</p>
								<p>- 배송,결제,교환/반품 문의는 고객센터로 문의 바랍니다.</p>
								<p>- 상품과 관련 없거나 부적합한 내용을 기재하시는 경우, 사전 고지 없이 삭제 또는 차단될 수 있습니다.</p>
							</td>
						</tr>
					</table>
					<input type="button" value="작성" id="wbtn">
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</div>				
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/inquiryWrite.js"></script>
</html>