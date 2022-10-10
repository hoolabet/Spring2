const id = $("#id").val();
let str = '';

loadWishList();

function loadWishList() {

	$.ajax({
		type:"get",
		url:"/member/wishList/"+id+".json",
		data:id,
		contentType:"application/json; charset=utf-8",
		success:function(res){
			res.forEach(function(r,i) {
				str += `

					<div class="each_wishlist">
						<li>
							<div class="img_wishlist">
								<a href="/board/detail?pno=${r.pno}">
									<img src="/display?fileName=${r.ivo.fullPath}" style="width:200px; height:200px; border-radius:30px;">
								</a>
								<div class="remove_icon">
									<img src="https://emojigraph.org/media/microsoft/white-heart_1f90d.png" style="width:50px; height:50px;">
								</div>	
							</div>
							<p class="wish_pname"><a href="/board/detail?pno=${r.pno}">${r.bvo.pname}</a></p>
							<input type="hidden" value="${r.bvo.price}" id="d${i}i_price">
							<p class="wish_price"><span id="d${i}i_price_quan">${r.bvo.price}</span>원</p>
							<input type="hidden" class="remove_pno" data-pno="${r.pno}">
	
						</li>
					</div>
					`;
			})

			

			$("#wish_list").html(str);
			str="";
			$(".remove_icon").on("click", function() {
				if(confirm("위시리스트에서 삭제하시겠습니까?")){
					const targetPno = $(".remove_pno").data("pno");
					const rData = {id:id,pno:targetPno};
					$.ajax({
						type:"delete",
						url:"/wishListremove",
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
						loadWishList();


					})
				}
			})
		}
	})
}




//<table id="${i}" border="1"
//style="display:inline-block;border-collapse:collapse;">
//<tr>
//<td style="width:200px"><input type="checkbox" checked></td>
//<td><a href="/board/detail?pno=${r.pno}"><img
//src="/display?fileName=${r.ivo.fullPath}" style="width:200px;
//height:200px;"></a></td>
//<td style="width: 800px;">
//<p>${r.bvo.pname}</p>
//<p>
//<input type="hidden" value="${r.bvo.price}" id="d${i}i_price">
//</p>
//<p>가격 : <span id="d${i}i_price_quan">${r.bvo.price}</span></p>
//<p><input type="button" value="삭제" class="remove_btn"
//data-pno="${r.pno}"></p>
//</td>
//</tr>
//</table>
