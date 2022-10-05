/**
 * 마이페이지
 */
const admin=$("#admin_check").val();
console.log(admin);

const uimg=$("#user_img_input").val();
const uname=$("#user_name_input").val();
const id=$("#user_id").val();







let str_menu="";
if($("#user_id").val()!=""){

	str_menu=`<div id="mypage_user">
		<div id="user_img"
		style="background-image:url('${uimg}')"></div>
		<div id="modi_user_div">
		<div id="user_name">
		<p>${uname}<span id="modi_icon"> > </span></p>
		</div>
		<div id="user_reserves">
		<p>적립금 : <span id="money"></span>원</p>
		</div>
		<div id="user_bar">
		</div>
		<div id="user_coupon">
		<p><a href="/member/mypageCouponList">쿠폰 : <span id="cp_num"></span>장 ></a></p>
		</div>
		<div id="logout_link">
		<a href="/member/logout">로그아웃</a>
		</div>			
		</div>
		</div>	
		<div id="mypage_list">
		<a href="/member/wishList">찜목록</a><br>
		<a href="/member/mypageBoardList?id=${id}">게시글 관리</a><br>
		<a href="/member/destination">배송지</a><br>
		<a href="/member/deliveryTracking">배송조회</a>
		</div>`
		let n=0;
	
	$.getJSON("/mypagecouponlist",{id},function(res){
		res.forEach(function(r,i){
			n=i+1;
		})
		$("#cp_num").html(n);
	})
	$.getJSON("/researchpoint",{id},function(res){
		$("#money").html(res.point);
	})

}else{
	str_menu=`<div id="mypage_user">
		<div id="user_img"
		style="background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAxMTRfMjYy%2FMDAxNDg0MzcxOTkxNzA4._N73NTpWleCLp8M6gXR8vpdDAZoAQ2mTJLimKBYFtRwg.5LEqnsukFugxlrTdlYk5hkxEKoVdUbTVsjL6gqJ03vIg.PNG.koomarin%2F%253F%253F%253F%253F%257B%253F_%253F%253F%253F%253F%253F%253F%253F.png&type=sc960_832')"></div>
		<div id="modi_user_div">
		<div id="user_name">
		<p><a href="/member/login">로그인하세요<span id="modi_icon"> > </span></a></p>
		</div>			
		</div>
		</div>
		<div id="mypage_list">
		<a href="">배송조회</a>
		</div>`
}
$("#mypage_user_list").html(str_menu);


$("#user_name").on("click",function(){
	if($("#user_sns").val()!="true"){
		$(location).attr('href', '/member/modifyInfoPWCheck');

	}
})