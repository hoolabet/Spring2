


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

//kakao.init("f1c123290b579c96921a1001465238ef");
//Kakao.isInitialized();

function loginWithKakao() {
    Kakao.Auth.authorize({
    	redirectUri:'http://localhost:8080/snscheck',
    	scope:'profile_nickname,account_email,gender,birthday,openid',
        
    });
    
}


// 아래는 데모를 위한 UI 코드입니다.
displayToken()
function displayToken() {
    var token = getCookie('authorize-access-token');
    if (token) {
        Kakao.Auth.setAccessToken(token);
        Kakao.Auth.getStatusInfo()
            .then(function (res) {
                if (res.status === 'connected') {
                    const getToken = Kakao.Auth.getAccessToken();
                    
                }
            })
            .catch(function (err) {
                Kakao.Auth.setAccessToken(null);
            });
    }
}

function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
}


//function loginWithKakao(){
//	window.kakao.Auth.login({
//		scope:'profile_nickname,account_email,gender,birthday',
//		success:function(authObj){
//			console.log(authObj);
//			window.kakao.API.request({
//				url:'/v2/user/me',
//				success:res => {
//					const email = res.kakao_account.email;
//					console.log(email);
//				}
//			})
//		}
//	})
//}



