


//var idchk=document.querySelector("#idchk");
//var pwchk=document.querySelector("#pwchk");
//var msg = document.querySelector("#msg");
//var loginsub= document.querySelector("#loginsub");

//loginsub.onclick=function(e){
//if(idchk.value==""){
//e.preventDefault();
//msg.innerHTML="아이디를 입력해주세요.";
//msg.style.color="red";
//}else if(pwchk.value==""){
//e.preventDefault();
//msg.innerHTML="비밀번호를 입력해주세요.";
//msg.style.color="red";
//}
//}

$("#loginsub").on("click",function(e){
	if($("#idchk").val()==""){
		e.preventDefault();
		$("#login_msg").text("아이디를 입력해주세요.").css("color","red");
	}else if($("#pwchk").val()==""){
		e.preventDefault();
		$("#login_msg").text("비밀번호를 입력해주세요.").css("color","red");
	}

})


// 카카오 아이디로 로그인
	// 1. 카카오에 인증코드 요청
function loginWithKakao() {
    Kakao.Auth.authorize({
    	redirectUri:'http://localhost:8080/snscheck',
    	scope:'profile_nickname,account_email,gender,birthday,openid',
        
    });
    
}
//카카오 아이디로 로그인 서버 확인하기


// 구글 아이디로 로그인
//$("#googleIdLogin_loginButton").on("click",function(){
//	$("#buttonDiv").click();
//})
$("#google_img").on("click",function(){

	$(".nsm7Bb-HzV7m-LgbsSe").click();
})
	// 1. 구글 버튼 부분. 인증 요청
  window.onload = function () {
    google.accounts.id.initialize({
      client_id: "757014794840-uob6irtj1rk48pr65ckeor3ichdktgpc.apps.googleusercontent.com",
      callback: handleCredentialResponse
    });
    google.accounts.id.renderButton(
      document.getElementById("buttonDiv"),
      { theme: "outline", size: "large" }  // customization attributes
    );
    google.accounts.id.prompt(); // also display the One Tap dialog
    
    
  }

  // 2. 인증 된 후 발급된 아이디 토큰을 서버로 넘김
  function handleCredentialResponse(response) {
      console.log("Encoded JWT ID token: " + response.credential);
      var id_token = response.credential;
      var xhr = new XMLHttpRequest();
  	  xhr.open('POST', 'http://localhost:8080/googlelogin');
  	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  	  xhr.onload = function() {
//  	    console.log('Signed in as: ' + xhr.responseText);
  	  };
  	  xhr.send('idtoken=' + id_token);
  	  setTimeout(function(){
  		  location.href="/";
  		  
  	  },1000);
    }
//구글 아이디로 로그인 서버 확인하기

  
  
  
// 네이버 아이디로 로그인
$("#naverIdLogin_loginButton").on("click",function(){
	$("#naverIdLogin").click();
})
  
  // 1. 네이버 버튼 부분. 인증 요청(naverlogin.jsp의 js에서 받음.)
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "ShCxm8FSUJiZ45bW3WW0",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://localhost:8080/member/naverlogin",
  			// 본인의 callBack url로 수정하세요.
			isPopup: false,
			loginButton: {color: "white", type: 3,height:40}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
naverLogin.init();
//네이버 아이디로 로그인 naverlogin.jsp 확인하기


