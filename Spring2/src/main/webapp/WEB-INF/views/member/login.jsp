<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">

<link rel="stylesheet" type="text/css" href="/resources/css/login.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">







			<h1 id="title">login</h1>
			<form action="/member/login" method="post">
				<div id="login_box">
					<table id="login_table">
						<tr>
							<td><input type="text" placeholder="아이디" name="id"
								class="loginInput" id="idchk"></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="비밀번호"
								name="password" class="loginInput" id="pwchk"></td>
						</tr>
						<tr>
							<td>
								<div id="loginsub_box">
									<p id="login_msg"></p>
									<input type="submit" value="로그인" id="loginsub">
								</div>
								
								<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
								<div id="google_id_login" style="text-align: center">
								<a href="${google_url}">구글 로그인</a>
								</div>
							</td>
						</tr>
<!-- 						카카오톡로그인 -->
						<tr>
							<td>
								<div class="kakaobtn">
									<input type="hidden" name="kakaoemail" id="kakaoemail">
									<input type="hidden" name="kakaoname" id="kakaoname">
									<input type="hidden" name="kakaobirth" id="kakaobirth">
									<input type="hidden" name="kakaogender" id="kakaogender">
									<a href="javascript:loginWithKakao();">
										카카오로그인
									</a>
								</div>
							</td>
						</tr>
					</table>
					<div id="link_box">
						<div id="link_findId">
							<a href="/member/findId">아이디/비밀번호 찾기</a>
						</div>
						<div id="link_signup">
							<a href="/member/signup">회원가입</a>
						</div>
					</div>
				</div>
			</form>


 
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>

<script>
   Kakao.init('f1c123290b579c96921a1001465238ef'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
<!-- 
<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/oauth2/code/kakao',
      scope:'profile_nickname,account_email,gender,birthday'
    });
    
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
            consloe.log(Kakao.Auth.getAccessToken());
          }
        })
        .catch(function(err) {
        	consloe.log("aa");
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>

 -->


		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="/resources/js/login.js"></script>
</body>
</html>