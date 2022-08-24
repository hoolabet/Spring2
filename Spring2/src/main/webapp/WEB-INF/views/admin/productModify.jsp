<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/adminMain.css">
<title>관리자 상품 수정</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<form name="btnForm" action="/admin/productList">
			<table border="1">
				<tr class="title">
					<td colspan="2">▶ 상품수정</td>
				</tr>
				<tr>
					<td id="menu">상품번호</td>
					<td>001</td>
				</tr>
				<tr>	
					<td id="menu">상품이미지</td>
					<td>
						<div><img id="img"></div>
						<input type="file" id="imgfile" accept="image/*" class="file">
					</td>
				</tr>
				<tr>	
					<td id="menu">상품명</td>
					<td><input type="text" value="철제의자" id="pname"></td>
				</tr>
				<tr>	
					<td id="menu">상품설명</td>
					<td>
						<textarea id="content">철로 만든 의자</textarea>
						<div><input type="file" class="file"></div>
						<div><input type="file" class="file"></div>
						<div><input type="file" class="file"></div>
					</td>
				</tr>
				<tr>	
					<td id="menu">메인 카테고리</td>
					<td>
						<select id="main_category">
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
					<td id="menu">판매가</td>
					<td><input type="text" value="5000" id="price"></td>
				</tr>
				<tr>	
					<td id="menu">총수량</td>
					<td><input type="text" value="20" id="qty"></td>
				</tr>
				<tr>	
					<td id="menu">판매수량</td>
					<td><input type="text" value="20" id="s_qty"></td>
				</tr>
				<tr>	
					<td id="menu">재고</td>
					<td><input type="text" value="20" id="stock"></td>
				</tr>
				<tr>	
					<td id="menu">판매상태</td>
					<td>
						<select id="state">
							<option>판매 예정</option>
							<option selected>판매중</option>
							<option>판매완료</option>
							<option>일시매진</option>
						</select>
					</td>
				</tr>
				<tr>	
					<td id="menu">등록일</td>
					<td><input type="text" id="regdate"></td>
				</tr>
				<tr>	
					<td id="menu">배송방법</td>
					<td><input type="text" id="delivery"></td>
				</tr>
				<tr>	
					<td id="menu">사이즈</td>
					<td><input type="text" id="size"></td>
				</tr>
				<tr>	
					<td id="menu">소재</td>
					<td><input type="text" id="quality"></td>
				</tr>
			</table>
			<div id="msg"></div>
			<input type="submit" value="뒤로가기" class="btn">
			<input type="button" onclick="modify()" value="수정" class="btn">
			<input type="button" onclick="remove()" value="삭제" class="btn">
			
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script src="../resources/js/admin/productModify.js"></script>
</body>
</html>