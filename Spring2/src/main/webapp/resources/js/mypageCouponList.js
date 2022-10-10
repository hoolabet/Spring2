/**
 *  내 쿠폰 목록
 */

const id = $("#id").val();
console.log("id="+id);
let str='';

$.getJSON("/mypagecouponlist",{id},function(res){
	res.forEach(function(r){
		str+=`
			<div class="coupon_box">
			<div class="coupon_text_box">
				<p class="coupon_name">${r.cpvo.cpname}</p>
				<p class="coupon_value">`
		str+=
			(r.cpvo.cptype=="P"?
			`${r.cpvo.cpvalue}%</P>
			<p class="coupon_detail">${r.cpvo.cpreq}원 이상 구매시 최대 ${r.cpvo.cpmax}원 할인</p>`
			:`${r.cpvo.cpvalue}원</P>
			<p class="coupon_detail">${r.cpvo.cpreq}원 이상 구매시 ${r.cpvo.cpvalue}원 할인</p>`)
		str+=`
			<p class="coupon_date">사용기간 : ${r.exp_date} 까지</p>
			</div>
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