<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/productList.css">
<title>관리자 상품 목록</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="nav">
				<ul>
					<li><a href="/admin/list">관리자 메인</a></li>
					<li><a href="/admin/productList">상품 목록</a></li>
					<li><a href="/admin/orderList">주문 내역</a></li>
					<li><a href="/admin/memberList">회원 관리</a></li>
				</ul>
			</div>
			<form>
			<table>
				<tr id="menu" class="title">
					<td colspan="10">▶ 상품목록</td>
				</tr>
				<tr id="menu">
					<td>상품번호</td><td>상품이미지</td><td>상품명</td><td>카테고리</td><td>판매가</td>
					<td>재고</td><td>판매상태</td><td>등록일</td><td>수정일</td><td>수정</td>
				</tr>
				<tr>
					<td>001</td>
					<td><img alt="이미지" src="https://img.freepik.com/free-photo/white-wall-living-room-have-sofa-and-decoration-3d-rendering_41470-3282.jpg?w=1480&t=st=1659663208~exp=1659663808~hmac=6eafbf34d73b547f24b6a54243db8753946140ffa0e15de13c4265269ab2d739"></td>
					<td>철제의자</td>
					<td>의자</td>
					<td>5000</td>
					<td>20</td>
					<td>판매중</td>
					<td>2022.06.24</td>
					<td></td>
					<td><input type="submit" value="수정" formaction="/admin/productModify"></td>
				</tr>
				<tr>
					<td>002</td>
					<td><img alt="이미지" src="https://img.freepik.com/free-photo/white-wall-living-room-have-sofa-and-decoration-3d-rendering_41470-3282.jpg?w=1480&t=st=1659663208~exp=1659663808~hmac=6eafbf34d73b547f24b6a54243db8753946140ffa0e15de13c4265269ab2d739"></td>
					<td>원형테이블</td>
					<td>테이블</td>
					<td>10000</td>
					<td>0</td>
					<td>판매종료</td>
					<td>2022.01.12</td>
					<td>2022.08.01</td>
					<td><input type="submit" value="수정" formaction="/admin/productModify"></td>
				</tr>
				<tr>
					<td>003</td>
					<td><img alt="이미지" src="https://img.freepik.com/free-photo/white-wall-living-room-have-sofa-and-decoration-3d-rendering_41470-3282.jpg?w=1480&t=st=1659663208~exp=1659663808~hmac=6eafbf34d73b547f24b6a54243db8753946140ffa0e15de13c4265269ab2d739"></td>
					<td>가죽쇼파</td>
					<td>거실가구</td>
					<td>800000</td>
					<td>0</td>
					<td>일시매진</td>
					<td>2022.07.09</td>
					<td>2022.07.15</td>
					<td><input type="submit" value="수정" formaction="/admin/productModify"></td>
				</tr>
			</table>
			<input class="btn" type="submit" value="뒤로가기" formaction="/admin/list">
			<input class="btn" type="submit" value="추가하기" formaction="/admin/productAdd">
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>