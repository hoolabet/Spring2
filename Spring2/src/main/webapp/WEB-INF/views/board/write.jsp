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
<link rel="stylesheet" href="../resources/css/board_write.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>상품등록</h1>
				<form action="/board/write" method="post" id="form">
					<table>
						<tr>
							<td><label>상품명</label></td>
							<td><input type="text" name="pname" id="pname"></td>
						</tr>
						<tr>
							<td><label>가격</label></td>
							<td><input type="text" name="price" id="num1"></td>
						</tr>
						<tr>
							<td><label>총수량</label></td>
							<td><input type="text" name="quantity" id="num2"></td>
						</tr>
						<tr>
							<td><label>배송방법</label></td>
							<td><select name="delivery">
									<option value="조립배송">조립배송</option>
									<option value="설치배송">설치배송</option>
									<option value="직접 조립 및 설치">직접 조립 및 설치</option>
							</select> </td>
						</tr>
						<tr>
							<td><label>소재</label></td>
							<td>
							<select name="quality">
									<option value="가죽">가죽</option>
									<option value="패브릭">패브릭</option>
									<option value="우드">우드</option>
									<option value="스테인리스">스테인리스</option>
									<option value="기타혼합">기타혼합</option>
							</select>
							
							</td>
						</tr>
						<tr>
							<td><label>카테고리-장소</label></td>
							<td><select name="category_area">
									<option value="10">10:거실</option>
									<option value="20">20:주방</option>
									<option value="30">30:옷방,드레스룸</option>
									<option value="40">40:침실</option>
									<option value="50">50:화장실</option>
									<option value="60">60:서재</option>
									<option value="70">70:아이방</option>
									<option value="80">80:야외</option>

							</select></td>
						</tr>
						<tr>
							<td><label>카테고리-용도</label></td>
							<td><select name="category_type">
									<option value="1">1:테이블</option>
									<option value="2">2:의자</option>
									<option value="3">3:침대</option>
									<option value="4">4:소파</option>
									<option value="5">5:서랍,수납장</option>
									<option value="6">6:진열장</option>
									<option value="7">7:기타소품</option>
							</select></td>
						</tr>
						<tr>
							<td><label>썸네일</label></td>
							<td><input type="file" name="thumbnailFile" 
								id="uploadThumb">
								<div id="thumbImg"></div>
								<div id="thumb"></div></td>
						</tr>
						<tr>
							<td><label>첨부파일</label></td>
							<td><input type="file" name="uploadFile" multiple
								id="upload"></td>
						</tr>
						<tr>
							<td><label id="label_content">내용</label></td>
							<td><div contenteditable="true" id="divContent"></div>
								<div>
								<input type="text" name="content" id="content" >
									
								</div></td>
						</tr>
					</table>
					<button id="btn">글쓰기</button>
				</form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../resources/js/board_write.js"></script>
</body>
</html>