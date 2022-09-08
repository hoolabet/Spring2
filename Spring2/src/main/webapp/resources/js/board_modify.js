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
			input += `<input type="text" name="image[${i}].fileName" value="${attach.fileName}"><br>`;
			input += `<input type="text" name="image[${i}].uuid" value="${attach.uuid}"><br>`;
			input += `<input type="text" name="image[${i}].image" value="${attach.image}"><br>`;
			input += `<input type="text" name="image[${i}].uploadPath" value="${attach.uploadPath}"><br>`;
			input += `<input type="text" name="image[${i}].fullPath" value="${attach.fullPath}"><br>`;
	})//each문 끝
	$("#thumb").html(input);	
})//getJSON끝
