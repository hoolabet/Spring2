/**
 * 
 */
$(document).ready(function(){
//	const pno = $("input[name='pno']").val();
//	$.getJSON("/attachlist", {pno:pno},function(attachlist){
//		console.log(attachlist)
//		var str="";
//		$(attachlist).each(function(i,attach){
//			//만약 image결과가 true이면
//			if(attach.image){
//				//아래를 실행
//				var filePath = encodeURIComponent(attach.uploadPath+"/s_" + attach.uuid + "_" + attach.fileName); //uri주소로 바꿔줌 \\ -> %로
//				console.log(filePath)
//				str+=`<img src = "/display?fileName=${filePath}">`;
//			}else{//그렇지 않으면
//				//다운로드 할 수 있도록 실행
//				var filePath = encodeURIComponent(attach.uploadPath+"/" + attach.uuid + "_" + attach.fileName); //uri주소로 바꿔줌 \\ -> %로
//				str = `<li><a href="/download?fileName=${filePath}">${attach.fileName}</a></li>`
//			}//if문 끝
//		})//each문 끝
//		$("#uploadResult").html(str);	
//	})//getJSON끝	
	$(".pno").each(function(i,x){
		const pno = x.value;
		$.getJSON("/attachlist", {pno:pno},function(attachlist){
			const str = `<a href="/board/detail?pno=${attachlist[0].pno}"><img src="/display?fileName=${attachlist[0].fullPath}" style="width:300px; height:200px;"></a>`;
			$(`#${attachlist[0].pno}`).append(str);
		})//getJSON끝
	})
})
	
	