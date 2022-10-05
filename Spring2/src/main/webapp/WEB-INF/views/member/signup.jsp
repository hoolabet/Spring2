<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/signup.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<h1 id="title">sign up</h1>
			<form action="/member/signup" method="post">
				<div id="signup_box">
					<div id="signup_box_text">
						<h4 class="signup_text" id="text_id">아이디</h4>
						<input class="signup_input" type="text" name="id" id="idchk">
						<p class="signup_msg" id="idmsg"></p>
						
						<h4 class="signup_text" id="text_pw">비밀번호</h4>
						<input class="signup_input" type="password" name="password" id="pwchk">
						<p class="signup_msg" id="pwmsg"></p>
						
						<h4 class="signup_text" id="text_pwc">비밀번호 재확인</h4>
						<input class="signup_input" type="password" name="pw2" id="pwchk2">
						<p class="signup_msg" id="pwmsg2"></p>
						
						<h4 class="signup_text" id="text_name">이름</h4>
						<input class="signup_input" type="text" name="name" id="nachk">
						<p class="signup_msg" id="namsg"></p>
						
						<h4 class="signup_text" id="text_birth">출생년월</h4>
						<select id="birth_year" class="birth_input" name="birth_y">
							<option>년도</option>
						</select> 
						<select id="birth_month" class="birth_input" name="birth_m">
							<option>월</option>
						</select> 
						<select id="birth_date" class="birth_input" name="birth_d">
							<option>일</option>
						</select>
						<p class="signup_msg" id="bimsg"></p>

						<h4 class="signup_text" id="text_gender">성별</h4>
						<div id="gender_input_box">
							<span id="g_input_m">
								<input class="gender_input" type="radio" name="gender" value="m"> 남 
							</span>
							<span id="g_input_f">
								<input class="gender_input" type="radio" name="gender" value="f"> 여
							</span>
						</div>
						<p class="signup_msg" id="genmsg"></p>

						<h4 class="signup_text" id="text_phone">전화번호</h4>
						<input type="hidden" name="phone"> 
						<select class="p_select" id="front_num">
							<option value="!010">010</option>
							<option value="!011">011</option>
							<option value="!018">018</option>
							<option value="!019">019</option>
						</select> 
						<input class="p_input" type="text" id="pchk">
						<p class="signup_msg" id="pmsg"></p>

						<h4 class="signup_text" id="text_email">이메일</h4>
						<input type="hidden" name="email">
						<input class="e_input" type="text" id="email">@<input class="e_input" type="text" id="direct"> 
						<select class="e_select" id="email_address">
							<option id="user_email" value="@user">직접입력</option>
							<option class="NG_email" value="@gmail.com">gmail.com</option>
							<option class="NG_email" value="@naver.com">naver.com</option>
						</select> 
						<div class="mail_check_box">
							<input type="submit" value="인증번호받기" id="email_btn">
							<input class="mail_check_input" disabled="disabled"
								placeholder="인증번호 6자리를 입력해주세요." maxlength="6" id="email_num">
						</div>
						<p class="signup_msg" id="email_msg"></p>
						
						<div id="signsub_box">
							<input type="submit" value="회원가입" id="signsub">
						</div>
					</div>
				</div>
				
				
				
				
				
			<!-- 
				
				<table>
					<tr>
						<td class="signtable">아이디</td>
						<td class="tableInput" id="idInput">
							<input type="text" name="id" id="idchk">
							<input type="submit" value="중복확인" id="idbtn">
							<p class="signmsg" id="idmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">비밀번호</td>
						<td class="tableInput">
							<input type="password" name="password" id="pwchk">
							<p class="signmsg" id="pwmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">비밀번호 확인</td>
						<td class="tableInput">
							<input type="password" name="pw2" id="pwchk2">
							<p class="signmsg" id="pwmsg2"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">이름</td>
						<td class="tableInput">
							<input type="text" name="name" id="nachk">
							<p class="signmsg" id="namsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">이메일</td>
						<td class="tableInput">
							<input type="hidden" name="email">
							<input type="text" id="email">@ <input type="text" id="direct"> 
						<select id="email_address">
								<option id="user_email" value="@user">직접입력</option>
								<option class="NG_email" value="@gmail.com">gmail.com</option>
								<option class="NG_email" value="@naver.com">naver.com</option>
						</select> <input type="submit" value="인증번호받기" id="email_btn">
							<div class="mail-check-box">
								<input class="form-control mail-check-input"
									placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
									maxlength="6">
							</div>
							<p class="signmsg" id="email_msg"></p>
						</td>

					</tr>
					<tr>
						<td class="signtable">성별</td>
						<td class="tableInput">
							<input type="radio" name="gender" value="m">남
							<input type="radio" name="gender" value="f">여
							<p class="signmsg" id="genmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">출생년월</td>
						<td class="tableInput">
							
							<select id="birth_year" class="birth_date" name="birth_y">
								<option>년도</option>
							</select>
							<select id="birth_month" class="birth_date" name="birth_m">
								<option>월</option>
							</select>
							<select id="birth_date" class="birth_date" name="birth_d">
								<option>일</option>
								
							</select>
							<p class="signmsg" id="bimsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">전화번호</td>
						<td class="tableInput">
						<input type="hidden" name="phone">
							<select id="front_num">
								<option value="!010">010</option>
								<option value="!011">011</option>
								<option value="!018">018</option>
								<option value="!019">019</option>
							</select>
							<input type="text" id="pchk">
							<input type="submit" value="중복확인" id="phbtn">
							<p class="signmsg" id="pmsg"></p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" id="signsub">
						</td>
					</tr>
				</table>
				
				 -->	
				
			</form>

<input type="hidden" value="${error}" id="error">



		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"src="/resources/js/signup.js?ver=1.1"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>