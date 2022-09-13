/**
 * 
 */
$(document).ready(function(){
	$(".pno").each(function(i,x){
		const pno = x.value;
		$.getJSON("/attachlist", {pno:pno},function(attachlist){
			const str = `<a href="/board/detail?pno=${attachlist[0].pno}"><img src="/display?fileName=${attachlist[0].fullPath}" style="width:300px; height:200px;"></a>`;
			$(`#${attachlist[0].pno}`).append(str);
		})//getJSON끝
	})
})
