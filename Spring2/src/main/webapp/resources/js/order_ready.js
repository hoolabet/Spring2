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
	lastPrice -= $("#point_btn").data("point");
	$("#last_price").html(lastPrice);
	$("input[name='price']").val(lastPrice);
	price = $("input[name='price']").val();
	lastPrice = 0;
}

$("#point_btn").on("click", function() {
	if(Number($("#use_point").val()) > Number(price)){
		alert("상품 가격보다 많습니다.");
	}else{
		if($("#use_point").val() < 5000){
			alert("적립금은 5000원 부터 사용가능합니다.");
		}else if(Number($("#use_point").val()) > Number($("#able_point").val())){
			alert("적립금이 부족합니다.");
		}
		else{
			$(this).data("point",$("#use_point").val());
			sumPrice();
		}
	}
})

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
	const use_point = $("#point_btn").data("point");
	console.log(use_point);
	if(name == "" || address == "" || phone == "" || dmemo == ""){
		alert("배송지 정보를 입력하세요.");
	}else{
		const pmData = {
				id,
				price,
				name,
				address,
				phone,
				dmemo,
				use_point
		}
		$.ajax({
			type:"post",
			url:"/orderpayment",
			data:JSON.stringify(pmData),
			contentType:"application/json; charset=utf-8",
			success:function(){
				alert("결제 완료");
				$.ajax({
					type:"put",
					url:"/usepoint",
					data:JSON.stringify({id,use_point,state:"use"}),
					contentType:"application/json; charset=utf-8",
					success:function(){
						if(Number(price) > 5000){
							$.ajax({
								type:"put",
								url:"/usepoint",
								data:JSON.stringify({id,use_point:Math.ceil(price*0.05)}),
								contentType:"application/json; charset=utf-8",
								success:function(){
									
								}
							})
						}
					}
				})
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
	window.open("/coupon/coupon?pno="+pno,`${id}님의 쿠폰`,"width=1200, height=300");
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

$.getJSON("/researchpoint",{id},function(res){
	console.log(res);
	$("#research_point").html(res.point);
	$("#able_point").val(res.point);
})

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