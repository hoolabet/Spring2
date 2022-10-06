/**
 * 
 */
const pno = $("input[name='pno']").val();
$.getJSON("/attachlist", {pno:pno},function(attachlist){
	console.log(attachlist)
	let input="";
	$(attachlist).each(function(i,attach){
		//만약 image결과가 true이면
			console.log(attach)
			var filePath = encodeURIComponent(attach.uploadPath+"/s_" + attach.uuid + "_" + attach.fileName); 
			//console.log(filePath)
			input +=`<img src = "/display?fileName=${filePath}" id="img"><br>`;
			input += `<input type="hidden" name="image[${i}].fileName" value="${attach.fileName}" class="fileName"><br>`;
			input += `<input type="hidden" name="image[${i}].uuid" value="${attach.uuid}"><br>`;
			input += `<input type="hidden" name="image[${i}].image" value="${attach.image}"><br>`;
			input += `<input type="hidden" name="image[${i}].uploadPath" value="${attach.uploadPath}"><br>`;
			input += `<input type="hidden" name="image[${i}].fullPath" value="${attach.fullPath}"><br>`;
	})//each문 끝
	$("#thumb").html(input);	
})//getJSON끝
$("#content").css("display","none");