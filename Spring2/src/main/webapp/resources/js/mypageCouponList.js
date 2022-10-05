/**
 *  내 쿠폰 목록
 */

const id = $("#id").val();
console.log("id="+id);
let str='';

$.getJSON("/mypagecouponlist",{id},function(res){
	res.forEach(function(r){
		str+=`
			<div id="coupon_box">
				<p>${r.cpvo.cpname}</p>
				<p>${r.cpvo.cpreq}원 이상 구매시 `
				
		str+=
			(r.cpvo.cptype=="P"?
			`${r.cpvo.cpvalue}% 할인</P>`
			:`${r.cpvo.cpvalue}원 할인</P>`)
		str+=`<p>최대 적용금액${r.cpvo.cpmax}원</p>
			<p>${r.exp_date}까지 사용가능</p>
			</div>
			`
	})
	$("#cp_list").html(str);
})


//.done(function(res){
//		let cplist='';
//		console.log(res);
//		
//		
//		
////		if(res.length==0){
////			$("#cp_list").html("없음")
////		}else{
////			res.forEach(function(r){
////				cplist+=`
////					<p>쿠폰 :</p>
////					`
////			})
////			$("#cp_list").html(cplist)
////		}
//})