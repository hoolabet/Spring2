<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>상품 등록</title>
</head>
<body>
<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form name="btnForm" action="/admin/productList">
			<div><label>제품 등록</label></div>
			<table border="1">
				<tr>
					<td id="menu">제품번호</td>
					<td id="bno">000</td>
				</tr>
				<tr>	
					<td id="menu">메인 카테고리</td>
					<td>
						<select id="main_category">
							<option>선택</option>
							<option>거실</option>
							<option>부엌</option>
							<option>방</option>
							<option>화장실</option>
						</select>
					</td>
				</tr>
				<tr>	
					<td id="menu">서브 카테고리</td>
					<td>
						<select id="sub_category">
							<option>선택</option>
							<option>거실장</option>
							<option>쇼파</option>
							<option>장식장</option>
							<option>진열장</option>
							<option>식탁</option>
							<option>아일랜드</option>
							<option>진열장</option>
						</select>
					</td>
				</tr>
				<tr>	
					<td id="menu">제품이미지</td>
					<td>
						<div><img id="preview"></div>
						<input type="file" name="img" accept="image/*" class="file">
					</td>
				</tr>
				<tr>	
					<td id="menu">제품명</td>
					<td><input type="text" name="pname"></td>
				</tr>	
				<tr>	
					<td id="menu">제품가격</td>
					<td><input type="text" id="money"></td>
				</tr>
				<tr>	
					<td id="menu">제품설명</td>
					<td>
						<textarea id="content"></textarea>
					</td>
				</tr>		
				<tr>	
					<td id="menu">총 수량</td>
					<td><input type="text" id="qty"></td>
				</tr>		
				<tr>
					<td id="menu">사이즈</td>
					<td><input type="text" id="size"></td>
				</tr>
				<tr>
					<td id="menu">소재</td>
					<td><input type="text" id="quality"></td>
				</tr>
				<tr>
					<td id="menu">배송방법</td>
					<td>
						<input type="checkbox" name="delivery" id="parcel">택배 배송
						<input type="checkbox" name="delivery" id="pickup">픽업 서비스
						<input type="checkbox" name="delivery" id="direct">직접 배송
					</td>
				</tr>
				<tr>	
					<td id="menu">등록일</td>
					<td id="regdate">0000-00-00</td>
				</tr>
			</table>
			<div id="msg"></div>
			<input type="submit" value="뒤로가기" class="btn">
			<input type="button" onclick="btn()" value="저장" class="btn">
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script src="../resources/js/admin/productAdd.js"></script>
</body>
</html>