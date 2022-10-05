setTimeout(()=>{
	if ($("#entry_area").height() < "1000") {
	    $("#content_area").height(800);
	}
	
},1500)

// $("#categori_btn_img").on("click", function () {
//     if ($("#categori").css("display") == "none") {
//         $(".cates").css("display", "none");
//         $("#categori").css("display", "block");
//     } else {
//         $("#categori").css("display", "none");
//     }
// })

// const cate = ["a", "b", "c", "d", "e"];

// cate.forEach((x) => {
//     $("#categori_" + x).on("click", function () {
//         if ($("#categori_" + x + "_list").css("display") == "none") {
//             $(".cates").css("display", "none");
//             $("#categori_" + x + "_list").css("display", "block");
//         } else {
//             $("#categori_" + x + "_list").css("display", "none");
//         }
//     })
// }
// )

$("#searchform").on("submit",function(e){
	e.preventDefault();
	if($("#search_input").val().length < 2){
		alert("두자이상 입력하세요")
	}else{
		this.submit();
	}
})

$("#search_btn").on("click", function(e){
	e.preventDefault();
	if($("#search_input").val().length < 2){
		alert("두자이상 입력하세요")
	}else{
		//alert("'"+$("#search_input").val()+"' 를 찾습니다.");
		$("#searchform").submit();
	}
	
})
$("#btnTop").on("click",function(){
	$('html, body').animate({scrollTop:0}, '300');
})
$(".cates li").on("click",function(){
	location.href=$(this).children().first().prop("href")
})
$(".cat_area").on("click",function(){
	console.log($(this).children().first().val());
	location.href=`/board/list?category_area=${$(this).children().first().val()}`
})
$("#categori_0").on("click",function(){
	console.log("aaaaaa")
	location.href="/board/list"
})
//displayToken()
//function displayToken() {
//    var token = getCookie('authorize-access-token');
//    if (token) {
//        Kakao.Auth.setAccessToken(token);
//        Kakao.Auth.getStatusInfo()
//            .then(function (res) {
//                if (res.status === 'connected') {
//                    const getToken = Kakao.Auth.getAccessToken();
//                    
//                }
//            })
//            .catch(function (err) {
//                Kakao.Auth.setAccessToken(null);
//            });
//    }
//}
//
//function getCookie(name) {
//    var parts = document.cookie.split(name + '=');
//    if (parts.length === 2) { return parts[1].split(';')[0]; }
//}
//
//Kakao.API.request({
//		url:'/v2/user/me',
//		data: {
//		    property_keys: ['kakao_account.email'],
//		  },
//		})
//		  .then(function(response) {
//		    console.log(response);
//		  })
//		  .catch(function(error) {
//		    console.log(error);
//		  });