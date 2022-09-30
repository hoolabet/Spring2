<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>

  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 
 
// 2. 네이버 인증 토큰 받고 사용자 정보 바로 받음. 사용자 정보를 jsp에 보냄
 
  var naver_id_login = new naver_id_login("ShCxm8FSUJiZ45bW3WW0", "http://localhost:8080/member/naverlogin");
  // 접근 토큰 값 출력
//   alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  $("#id").val(naver_id_login.getProfileData('id'));
	  $("#userImg").val(naver_id_login.getProfileData('profile_image'));
	  $("#gender").val(naver_id_login.getProfileData('gender'));
	  $("#email").val(naver_id_login.getProfileData('email'));
	  $("#name").val(naver_id_login.getProfileData('name'));
	  $("#gender").val(naver_id_login.getProfileData('gender'));
      let birthday=naver_id_login.getProfileData('birthday');
      let birth=birthday.split('-');
      $("#birth_m").val(Number(birth[0]).toString());
      $("#birth_d").val(Number(birth[1]).toString());

  }
</script>
	<form action="/member/naverlogin" method="post">
		<input type="hidden" name="id" id="id"> 
		<input type="hidden" name="userImg" id="userImg"> 
		<input type="hidden" name="gender" id="gender"> 
		<input type="hidden" name="email" id="email"> 
		<input type="hidden" name="name" id="name"> 
		<input type="hidden" name="birth_m" id="birth_m"> 
		<input type="hidden" name="birth_d" id="birth_d">
		<input type="submit" id="submit">
	</form>
	
	<script>
	
// 3. 사용자 정보를 jsp에서 서버로 보냄
	
	window.addEventListener('load', function () {
	if($("#id").val()!=""){
		$("#submit").click();
		
	}
	})
	</script>
  </body>
</html>