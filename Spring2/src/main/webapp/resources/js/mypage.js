/**
 * 마이페이지
 */
const admin=$("#admin_check").val();
console.log(admin);




let str_menu="";
if($("#user_id").val()!=""){
		
	str_menu=`<a href="">주문목록</a><br>
		 	  <a href="">찜목록</a><br>
		 	  <a href="">쿠폰</a><br>
		 	  <a href="">게시글 관리</a><br>
		 	  <a href="/member/destination">배송지</a><br>`
}else{
	str_menu=`<a href="/member/login">로그인</a><br>`
}
$("#mypage_login_list").html(str_menu);


$("#user_name").on("click",function(){
	$(location).attr('href', '/member/modifyInfoPWCheck');
})