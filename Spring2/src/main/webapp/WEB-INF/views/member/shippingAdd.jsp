<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/shippingAdd.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
		
		
		
		
		
			<h1>배송지 관리</h1>
			<p>배송지 목록</p>
			<table>
				<colgroup>
				   <col style="width:13%">
				   <col style="width:75%">				   
				   <col style="width:12%">
					   
				<thead class="a">
					<tr>
						<th>이름</th>
						<th>배송지 정보</th>
						<th>수정</th>
					</tr>
					<tr>
						<td colspan="3" id="table_line"></td>
					</tr>
					
				</thead>
				<tbody>
					<tr>
						<td rowspan="2" id="tbody_name">김00</td>
						<td id="tbody_add">울산광역시 남구 무슨동 00-00 무슨무슨무슨무스아파트 000동 000호 울산광역시 남구 무슨동 00-00 무슨무슨무슨무스아파트 000동 000호</td>
						<td rowspan="2" id="tbody_modify"><a href="/member/modifyAdd">수정</a></td>
					</tr>
					
					<tr>
						<td id="tbody_phone">010-0000-0000</td>
					</tr>
					
				</tbody>
			</table>
			
			<a href="">배송지 추가</a>
			










		</div>
		<%@ include file="../footer.jsp"%>	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>