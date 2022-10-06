<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<link rel="stylesheet" href="../resources/css/board_write.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>상품수정등록</h1>
				<form action="/board/modify" method="post" id="form">
				<input type="hidden" name="pno" value="${detail.pno}">
					<table>
						<tr>
							<td><label>상품명</label></td>
							
							<td><input type="text" name="pname" value="${detail.pname}"></td>
						</tr>
						<tr>
							<td><label>가격</label></td>
							<td><input type="text" name="price" value="${detail.price}" id="num1"></td>
						</tr>
						<tr>
							<td><label>총수량</label></td>
							<td><input type="text" name="quantity" value="${detail.quantity}" id="num2"></td>
						</tr>
						<tr>
							<td><label>배송방법</label></td>
							<td><select name="delivery">
									<option value="조립배송"
									${detail.delivery == '조립배송' ? 'selected = selected' : ''}
									>조립배송</option>
									<option value="설치배송"
									${detail.delivery == '설치배송' ? 'selected = selected' : ''}
									>설치배송</option>
									<option value="직접 조립 및 설치"
									${detail.delivery == '직접 조립 및 설치' ? 'selected = selected' : ''}
									>직접 조립 및 설치</option>
							</select> </td>
						</tr>
						<tr>
							<td><label>소재</label></td>
							<td>
							<select name="quality">
									<option value="가죽"
									${detail.quality == '가죽' ? 'selected = selected' : ''}
									>가죽</option>
									<option value="패브릭"
									${detail.quality == '패브릭' ? 'selected = selected' : ''}
									>패브릭</option>
									<option value="우드"
									${detail.quality == '우드' ? 'selected = selected' : ''}
									>우드</option>
									<option value="스테인리스"
									${detail.quality == '스테인리스' ? 'selected = selected' : ''}
									>스테인리스</option>
									<option value="기타혼합"
									${detail.quality == '기타혼합' ? 'selected = selected' : ''}
									>기타혼합</option>
							</select>
							
							</td>
						</tr>
						
						<tr>
							<td><label>카테고리-장소</label></td>
							<td><select name="category_area">
									<option value="10"
									${detail.category_area == 10 ? 'selected = selected' : ''}
									>10:거실</option>
									<option value="20"
									${detail.category_area == 20 ? 'selected = selected' : ''}
									>20:주방</option>
									<option value="30"
									${detail.category_area == 30 ? 'selected = selected' : ''}
									>30:옷방,드레스룸</option>
									<option value="40"
									${detail.category_area == 40 ? 'selected = selected' : ''}
									>40:침실</option>
									<option value="50"
									${detail.category_area == 50 ? 'selected = selected' : ''}
									>50:화장실</option>
									<option value="60"
									${detail.category_area == 60 ? 'selected = selected' : ''}
									>60:서재</option>
									<option value="70"
									${detail.category_area == 70 ? 'selected = selected' : ''}
									>70:아이방</option>
									<option value="80"
									${detail.category_area == 80 ? 'selected = selected' : ''}
									>80:야외</option>

							</select></td>
						</tr>
						<tr>
							<td><label>카테고리-용도</label></td>
							<td><select name="category_type">
									<option value="1"
									${detail.category_type == 1? 'selected = selected' : ''}
									>1:테이블</option>
									<option value="2"
									${detail.category_type == 2? 'selected = selected' : ''}
									>2:의자</option>
									<option value="3"
									${detail.category_type == 3? 'selected = selected' : ''}
									>3:침대</option>
									<option value="4"
									${detail.category_type == 4? 'selected = selected' : ''}
									>4:소파</option>
									<option value="5"
									${detail.category_type == 5? 'selected = selected' : ''}
									>5:서랍,수납장</option>
									<option value="6"
									${detail.category_type == 6? 'selected = selected' : ''}
									>6:진열장</option>
									<option value="7"
									${detail.category_type == 7? 'selected = selected' : ''}
									>7:기타소품</option>
							</select></td>
						</tr>
						
						<tr>
							<td><label>썸네일</label></td>
							<td><input type="file" name="thumbnailFile" 
								id="uploadThumb">
								<div id="thumbImg">${detail.image.fullPath}</div>
								<div id="thumb"></div></td>
						</tr>
						<tr>
							<td><label>첨부파일</label></td>
							<td><input type="file" name="uploadFile" multiple
								id="upload" ></td>
						</tr>
						<tr>
							<td><label>내용</label></td>
							<td><div contenteditable="true" id="divContent">${detail.content}</div>
								<div>
									<textarea name="content" id="content">${detail.content}</textarea>
								</div></td>
						</tr>
					</table>
					<button class="btn">수정하기</button>
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
	<script src="../resources/js/board_modify.js"></script>
</body>
</html>