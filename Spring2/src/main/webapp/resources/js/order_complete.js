/**
 * 
 */
const id = $("#id").val();

$.getJSON("/ordercheck",{id:id},function(res){
	res.forEach(function(r){
		const rData = {
				pno:r.pno,
				b_quantity:r.b_quantity
		}
		$.ajax({
			type:"put",
			url:"/orderafter",
			data:JSON.stringify(rData),
			contentType:"application/json; charset=utf-8",
			success:function(){
				const str = `
					<p>결제가 완료되었습니다.</p>
					<p>
						<input type="button" value="주문 내역 조회" id="research">
						<input type="button" value="홈으로" id="go_home">
					</p>
					`;
				$("#result").html(str);
			},
			error:function(){
				const str = `
					<p>결제에 실패했습니다.</p>
					<p>
						<input type="button" value="주문 내역 조회" id="research">
						<input type="button" value="홈으로" id="go_home">
					</p>
					`;
				$("#result").html(str);
			}
		})
		.done(function() {
			$("#go_home").on("click",function(){
				location.href = "/";
			})
			$("#research").on("click",function(){
				location.href = "/order/research";
			})
		})
	})
})

