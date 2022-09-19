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
				
			}
		})
	})
})

