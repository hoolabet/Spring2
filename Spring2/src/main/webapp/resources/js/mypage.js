/**
 * 마이페이지
 */
const admin=$("#admin_check").val();
console.log(admin);


let str="";
if(admin=="true"){
	//alert("관리자다.");
	str+=`<tr><td><a href="">회원목록</a></td></tr>`
	
}$("#mypage_list").html(str);