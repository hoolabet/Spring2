/**
 * 
 */
const id = $("input[name='id']").val();
let price = $("input[name='price']").val();

let lastPrice = 0;
sumPrice();
$(".prices").on("change", function() {
	sumPrice();
})
function sumPrice() {	
	$(".prices").each(function(i,p) {
		lastPrice += Number(p.innerText);
	})
	$("#last_price").html(lastPrice);
	$("input[name='price']").val(lastPrice);
	price = $("input[name='price']").val();
	lastPrice = 0;
}

$("input[name='destination']").on("change", function() {
	$("#dname").val($(`#${$(this).attr("id")}_dname`).val());
	$("#name").val($(`#${$(this).attr("id")}_name`).val());
	$("#phone").val($(`#${$(this).attr("id")}_phone`).val());
	$("#address").val($(`#${$(this).attr("id")}_address`).val());
	$("#dmemo").val($(`#${$(this).attr("id")}_dmemo`).val());

})

let pnoArr = [];
$(".order_pno").each(function(i,p) {
	pnoArr.push(p.value);
})

$("#pay").on("click", function() {
	const name = $("#name").val();
	const address = $("#address").val();
	const phone = $("#phone").val();
	const dmemo = $("#dmemo").val();
	if(name == "" || address == "" || phone == "" || dmemo == ""){
		alert("배송지 정보를 입력하세요.");
	}else{
		const pmData = {
				id:id,
				price:price,
				name:name,
				address:address,
				phone:phone,
				dmemo:dmemo
		}
		$.ajax({
			type:"post",
			url:"/orderpayment",
			data:JSON.stringify(pmData),
			contentType:"application/json; charset=utf-8",
			success:function(){
				alert("결제 완료");
				pnoArr.forEach(function(p) {
					const dataP = {id:id, pno:p};
					$.getJSON("/orderlist",dataP,function(res){
						const oData={
								id:res.id,
								pno:res.pno,
								b_quantity:res.b_quantity,
								cptno:res.cptno
						}
						$.ajax({
							type:"post",
							url:"/orderadd",
							data:JSON.stringify(oData),
							contentType:"application/json; charset=utf-8",
							success:function(){
								$.ajax({
									type:"delete",
									url:"/cartremove",
									data:JSON.stringify(oData),
									contentType:"application/json; charset=utf-8",
									success:function(){
										const dData = {
												id:res.id,
												cptno:res.cptno
										}
										console.log(dData);
										$.ajax({
											type:"put",
											url:"/removecoupon",
											data:JSON.stringify(dData),
											contentType:"application/json; charset=utf-8",
											success:function(){

											}
										})
									}
								})
							},
							error:function(){
								console.log("추가실패");
							}
						})
					})
					.fail(function() {
						alert("nono")
					})
				})
			},
			error:function(){
				alert("결제 실패");
			}
		})
		.done(function() {
			setTimeout(() => {
				location.href = "/order/complete";
			}, 3000);
		})
	}

})
$(".use_coupon").on("click",function(c){
	const pno = $(this).data("pno");
	window.open("/coupon/coupon?pno="+pno,`${id}님의 쿠폰`,"width=900, height=300");
})

setInterval(() => {
	
$(".use_coupon").each(function(i,t) {
	const pno = $(t).data("pno");
	let cptno = $(t).data("cptno");
	const bPrice = $(`#${pno}_ph`).val();
	const bPriceS = $(`#${pno}_psh`).val();
	let cptnoCheck = cptno;
	$.getJSON("/orderlist",{id:id,pno:pno}, function(res) {
		if(cptnoCheck != res.cptno){
			cptnoCheck = -1;
			$(t).data("cptno",res.cptno);
			$.getJSON("/getcoupon",{id:id,cptno:res.cptno},function(resc){
				if(resc.cpvo.cpvalue < 100 && resc.cpvo.cpvalue > 0){
					if((bPriceS*resc.cpvo.cpvalue/100) > resc.cpvo.cpmax){
						$(`#${pno}_ps`).html(bPriceS - resc.cpvo.cpmax);
					}else{
						$(`#${pno}_ps`).html(Math.floor(bPriceS*(100-resc.cpvo.cpvalue)/100));
					}
				}else if(resc.cpvo.cpvalue > 100){
					$(`#${pno}_p`).html(bPrice);
					$(`#${pno}_ps`).html(bPriceS-resc.cpvo.cpvalue);
				}else{
					$(`#${pno}_p`).html(bPrice);
					$(`#${pno}_ps`).html(bPriceS);
				}
				sumPrice();
			})
		}else if(cptnoCheck == 0){
			$(`#${pno}_p`).html(bPrice);
			$(`#${pno}_ps`).html(bPriceS);
			sumPrice();
		}
	})
})
}, 100);

$(window).on("beforeunload",function() {
	const cData = {
			cptno:0,
			id:id,
			b_quantity:-2
	}
	$.ajax({
		type:"put",
		url:"/detachcoupon",
		data:JSON.stringify(cData),
		contentType:"application/json; charset=utf-8",
		success:function(){
		}
	})
})