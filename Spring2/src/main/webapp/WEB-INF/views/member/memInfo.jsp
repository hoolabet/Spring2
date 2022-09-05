<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/memInfo.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">





			<h1>회원정보수정</h1>
			<input type="text" id="admin_check" value="${userInfo.admin}"><br>
			
			<div id="form"></div>
		
			
			<table>
				<tr>
					<td colspan="2"><p>기본 정보</p></td>
				</tr>
				<tr>
					<td class="signtable">
					<div id="user_img" style="background-image:url('${userInfo.userImg}')">
						<div id="modify_img" style="background-image:url('https://illustoon.com/photo/dl/3122.png')">
						</div>
						<input type="file" id="user_imgfile">
					</div>
					
					
					</td>
					<td class="tableInput">
						<input type="text" name="id" id="id" readonly value="${userInfo.id}">
						<p class="signmsg" id="idmsg"></p>
						<input type="button" value="프로필사진 수정" id="modify_u_img">
					</td>
				</tr>
				<tr>
					<td class="signtable">이메일</td>
					<td class="tableInput">
						<input type="hidden" value="${userInfo.email}" name="email" id="email_all">
						<input type="text" id="email_val">@
						<input type="text" id="direct">
						<select id="email_address">
							<option id="user_email" value="@user">직접입력</option>
							<option class="NG_email" value="@gmail.com">gmail.com</option>
							<option class="NG_email" value="@naver.com">naver.com</option>
						</select>
						
						<input type="button" value="수정" id="email_btn">
						<p class="signmsg" id="email_msg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">전화번호</td>
					<td class="tableInput">
						<input type="hidden" value="${userInfo.phone}" name="phone" id="phone_all">
						<select id="phone_number">
							<option value="!010">010</option>
							<option value="!011">011</option>
							<option value="!018">018</option>
							<option value="!019">019</option>
						</select>
						<input type="text" id="phone_val">
						<input type="button" value="수정" id="phone_btn">
						<p class="signmsg" id="phone_msg"></p>
					</td>
				</tr>
				<tr>
					<td colspan="2"><p>비밀번호 변경</p></td>
				</tr>
						
				<tr>
					<td class="signtable">새 비밀번호</td>
					<td class="tableInput">
						<input type="password" name="password" id="pw_val">
						<p class="signmsg" id="pw_msg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">비밀번호 확인</td>
					<td class="tableInput">
						<input type="password" name="password2" id="pw_val2">
						<p class="signmsg" id="pw_msg2"></p>
					</td>
				</tr>


				<tr>
					<td colspan="2" class="signtable">
						<input type="button" value="비밀번호 수정" id="pw_btn">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="계정삭제" id="delete">
						<a href="/member/mypage">마이페이지</a><br>
					</td>
				</tr>
			</table>
		
			
			<table id="mypage_list">
				
			</table>

	
	
	
	
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/memInfo.js"></script>
	<script type="text/javascript"src="/resources/js/memberList.js?ver=1.1"></script>
</body>
</html>