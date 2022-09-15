const id = $("#id").val();
let str = '';

loadCart();

function loadCart() {

	$.ajax({
		type:"get",
		url:"/cartlist/"+id+".json",
		data:id,
		contentType:"application/json; charset=utf-8",
		success:function(res){
			res.forEach(function(r,i) {
				str += `
					<table id="${i}" border="1" style="display:inline-block;border-collapse:collapse;">
					<tr>
					<td style="width:200px"><input type="checkbox" checked class="select_p"></td>
					<td><a href="/board/detail?pno=${r.pno}"><img src="/display?fileName=${r.ivo.fullPath}" style="width:200px; height:200px;"></a></td>
					<td style="width: 800px;">
					<p>${r.bvo.pname}</p>
					<p>
					<input type="button" value="▼" class="d${i}i" id="d${i}">
					<input type="text" value="${r.quantity}" size="2" readonly id="d${i}i">
					<input type="button" value="▲" class="d${i}i" id="${i}i">
					<input type="hidden" value="${r.bvo.price}" id="d${i}i_price">
					</p>
					<p>가격 : <span class="prices" id="d${i}i_price_quan">${r.bvo.price*r.quantity}</span></p>
					<p><input type="button" value="빼기" class="remove_btn" data-pno="${r.pno}"></p>
					</td>
					</tr>
					</table>
					`;
			})

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
				$(`#d${$(this).attr("id")}`).val(Number($(`#d${$(this).attr("id")}`).val())+1);
				$(`#d${$(this).attr("id")}_price_quan`).html($(`#d${$(this).attr("id")}`).val()*$(`#d${$(this).attr("id")}_price`).val());
				calcProduct();
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
//				if(this.checked){
//					calcProduct();
//				}else{
//					calcProduct();
//				}
				calcProduct();
			})
		}
	})
}

function calcProduct (){
	let price = 0;
	$(".prices").each(function(i,p) {
		price += Number(p.innerText);
	})
	console.log(price);
	$("#price").val(price);
}

$("#all_btn").on("click", function() {
	location.href = "/order/ready";
})




