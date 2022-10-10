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
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/memInfo.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">


			<input type="hidden" id="admin_check" value="${userInfo.admin}">
			<input type="hidden" id="id" value="${userInfo.id}">
			<div id="form"></div>



			<h1>회원정보수정</h1>
			<div id="mody_box">
			<div id="mody_info_box">
				<h3 class="mody_box_text">기본정보 수정</h3>
				<div id="mody_info_text">
					<div id="user_img" style="background-image:url('${userInfo.userImg}')">
						<div id="modify_img" style="background-image:url('https://mblogthumb-phinf.pstatic.net/20151004_30/koowq_1443929591075FUCQX_PNG/%C4%AB%B8%DE%B6%F3_%BF%F8%C7%FC_%BE%C6%C0%CC%C4%DC-02.png?type=w2')">
						</div>
						<input type="file" id="user_imgfile">
					</div>
					<input type="button" value="프로필사진 수정" id="modify_u_img" class="modi_btn">
					
					<input type="hidden" value="${userInfo.email}" name="email" id="email_all">
					<input type="hidden" name="email">
					<input class="e_input" type="text" id="email">@<input class="e_input" type="text" id="direct"> 
					<select class="e_select" id="email_address">
						<option id="user_email" value="@user">직접입력</option>
						<option class="NG_email" value="@gmail.com">gmail.com</option>
						<option class="NG_email" value="@naver.com">naver.com</option>
					</select> 
					<div class="mail_check_box">
						<input type="submit" value="인증번호받기" id="email_btn">
						<input class="mail_check_input" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요" maxlength="6" id="email_num">
					</div>
					<p class="modi_msg" id="email_msg"></p>
					<input type="button" value="이메일 수정" id="email_mody_btn" class="modi_btn">
					
					<input type="hidden" value="${userInfo.phone}" name="phone" id="phone_all">
					<select class="p_select" id="phone_number">
						<option value="!010">010</option>
						<option value="!011">011</option>
						<option value="!018">018</option>
						<option value="!019">019</option>
					</select> 
					<input class="p_input" type="text" id="phone_val">
					<p class="modi_msg" id="phone_msg"></p>
					<input type="button" value="전화번호 수정" id="phone_btn" class="modi_btn">
				</div>
			</div>
			<div id="mody_pw_box">
				<h3 class="mody_box_text">비밀번호 수정</h3>
				<div id="mody_pw_text">
					<input type="password" placeholder="새로운 비밀번호" name="password" class="pw_input" id="pw_val">
					<input type="password" placeholder="비밀번호 재확인" name="password2" class="pw_input" id="pw_val2">
					<p class="modi_msg" id="pw_msg"></p>
					<input type="button" value="비밀번호 수정" id="pw_btn" class="modi_btn">
				</div>
			</div>
			<input type="button" value="계정삭제" id="delete" class="modi_btn">
			</div>
		
			

		
			

	
	
	
	
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/memInfo.js"></script>
</body>
</html>