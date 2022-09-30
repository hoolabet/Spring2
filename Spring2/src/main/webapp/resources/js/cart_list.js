const id = $("#id").val();
let str = '';
let indexArr = [];
if(id == ""){
	console.log("haha");
}else{
	loadCart();
}

function loadCart() {
	indexArr = [];
	$.ajax({
		type:"get",
		url:"/cartlist/"+id+".json",
		data:id,
		contentType:"application/json; charset=utf-8",
		success:function(res){
			res.forEach(function(r,i) {
				indexArr = [...indexArr,i];
				if(r.ivo.fullPath.includes("http")){
					str += `
						<table border="1" style="display:inline-block;border-collapse:collapse;">
						<tr>
						<td style="width:200px"><input type="checkbox" checked id="${i}" class="select_p" data-pno="${r.pno}"></td>
						<td><a href="/board/detail?pno=${r.pno}"><img src="${r.ivo.fullPath}"style="width:200px; height:200px;"></a></td>
						<td style="width: 800px;">
						<p>${r.bvo.pname}</p>
						<p>
						<input type="button" value="▼" class="d${i}i" id="d${i}">
						<input type="text" value="${r.b_quantity}" size="2" readonly id="d${i}i">
						<input type="button" value="▲" class="d${i}i" id="${i}i" data-quan="${r.bvo.quantity}">
						<input type="hidden" value="${r.bvo.price}" id="d${i}i_price">
						</p>
						<p>가격 : <span class="prices" id="d${i}i_price_quan">${r.bvo.price*r.b_quantity}</span></p>
						<p><input type="button" value="빼기" class="remove_btn" data-pno="${r.pno}"></p>
						</td>
						</tr>
						</table>
						`;
				}else{
					str += `
						<table border="1" style="display:inline-block;border-collapse:collapse;">
						<tr>
						<td style="width:200px"><input type="checkbox" checked id="${i}" class="select_p" data-pno="${r.pno}"></td>
						<td><a href="/board/detail?pno=${r.pno}"><img src="/display?fileName=${r.ivo.fullPath}" style="width:200px; height:200px;"></a></td>
						<td style="width: 800px;">
						<p>${r.bvo.pname}</p>
						<p>
						<input type="button" value="▼" class="d${i}i" id="d${i}">
						<input type="text" value="${r.b_quantity}" size="2" readonly id="d${i}i">
						<input type="button" value="▲" class="d${i}i" id="${i}i" data-quan="${r.bvo.quantity}">
						<input type="hidden" value="${r.bvo.price}" id="d${i}i_price">
						</p>
						<p>가격 : <span class="prices" id="d${i}i_price_quan">${r.bvo.price*r.b_quantity}</span></p>
						<p><input type="button" value="빼기" class="remove_btn" data-pno="${r.pno}"></p>
						</td>
						</tr>
						</table>
						`;
				}
			})
			console.log(indexArr);
			$("#cart_list").html(str);
			calcProduct();
			str = '';
			$("input[value='▼']").on("click", function() {
				if($(`#${$(this).attr("id")}i`).val() > 1){
					$(`#${$(this).attr("id")}i`).val(Number($(`#${$(this).attr("id")}i`).val())-1);
					$(`#${$(this).attr("id")}i_price_quan`).html($(`#${$(this).attr("id")}i`).val()*$(`#${$(this).attr("id")}i_price`).val());
					calcProduct();
				}
			})
			$("input[value='▲']").on("click", function() {
				if($(`#d${$(this).attr("id")}`).val() == $(this).data("quan")){
					alert("재고가 부족합니다.")
				}else{
					$(`#d${$(this).attr("id")}`).val(Number($(`#d${$(this).attr("id")}`).val())+1);
					$(`#d${$(this).attr("id")}_price_quan`).html($(`#d${$(this).attr("id")}`).val()*$(`#d${$(this).attr("id")}_price`).val());
					calcProduct();
				}
			})
			$(".remove_btn").on("click", function() {
				if(confirm("장바구니에서 삭제하시겠습니까?")){
					const targetPno = $(this).data("pno");
					const rData = {id:id,pno:targetPno};
					$.ajax({
						type:"delete",
						url:"/cartremove",
						data:JSON.stringify(rData),
						contentType:"application/json; charset=utf-8",
						success:function(){
							alert("삭제되었습니다.");
						},
						error:function(){
							alert("삭제 실패");
						}
					})
					.done(function() {
						loadCart();
						calcProduct();
					})
				}
			})
			$(".select_p").on("change",function() {
				calcProduct();
			})
		}
	})
}

function calcProduct (){
	let price = 0;
	$(".prices").each(function(i,p) {
		if($(`#${i}`).prop("checked")){
			price += Number(p.innerText);
		}
	})
	$("#price").val(price);
}


$("#select_btn").on("click", function() {
	let howManyChecked = 0;
	indexArr.forEach(function(i) {
		if($(`#${i}`).prop("checked")){
			howManyChecked++;
			const cData = {
					id:id,
					pno:$(`#${i}`).data("pno"),
					b_quantity:$(`#d${i}i`).val()
			}
			$.ajax({
				type:"put",
				url:"/orderready",
				data:JSON.stringify(cData),
				contentType:"application/json; charset=utf-8"
			})
		}
	})
	if(howManyChecked == 0){
		alert("구매할 상품을 선택하세요.");
	}else{
		setTimeout(() => {
			location.href = "/order/ready";
		}, 100);
	}
})

$("#all_btn").on("click", function() {
	indexArr.forEach(function(i) {
		$(`#${i}`).prop("checked",true);
	})
	$("#select_btn").click();
})



