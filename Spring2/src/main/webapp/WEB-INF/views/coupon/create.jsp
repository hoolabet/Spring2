<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<title>쿠폰 생성 페이지</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<table border="1" style="display:inline;">
				<tr>
					<td>쿠폰이름  </td>
					<td><input type="text" id="cpname"></td>
				</tr>
				<tr>
					<td>할인타입  </td>
					<td>
						<select id="cptype">
							<option>타입</option>
							<option value="p">%</option>
							<option value="s">₩</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>할인율  </td>
					<td><select id="cpvalue"></select></td>
				</tr>
				<tr>
					<td>최소사용금액  </td>
					<td><select id="cpreq"></select></td>
				</tr>
				<tr>
					<td>최대적용금액  </td>
					<td><select type="text" id="cpmax"></select></td>
				</tr>
			</table>
			<br>
			<input type="button" id="create" value="쿠폰 생성">
			<br>
			<table border="1" style="display:inline-block;" id="list">
			
			</table>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/coupon_create.js?ver=1"></script>
</body>
</html>