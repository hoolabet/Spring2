/**
 * 
 */
$(document).ready(function(){
	$(".pno").each(function(i,x){
		const pno = x.value;
		const qu = $(".quantity")
		const squ = $(".s_quantity")
		if(qu[i].value == squ[i].value){
			console.log("품절")
		}
		$.getJSON("/attachlist", {pno:pno},function(attachlist){
			if(qu[i].value == 0){ //품절일때
				const str = `<a ><img src="/display?fileName=${attachlist[0].fullPath}" style="width:300px; height:200px;"><div class="img_soldout">sold out</div></a>`;
				$(`#${attachlist[0].pno}`).append(str);
			}else{
				const str = `<a href="/board/detail?pno=${attachlist[0].pno}"><img src="/display?fileName=${attachlist[0].fullPath}" style="width:300px; height:200px;"></a>`;
				$(`#${attachlist[0].pno}`).append(str);
			}
			
		})//getJSON끝
	})//each끝
})
