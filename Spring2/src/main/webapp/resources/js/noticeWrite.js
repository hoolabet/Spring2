/**
 * 
 */
const reg = new RegExp("(.*?)\.(exe|zip|alz)$");
const maxSize = 5242880;

function checkExtension(fileName, size){
	if(size > maxSize){
		alert("파일 용량 초과");
		return false;
	}
	
	if(reg.test(fileName)){
		alert("해당 확장자 파일은 업로드 할 수 없음");
		return false;
	}
	
	return true;
}

let i = 0;
$("#upload_input").on("change",function(e){
	//e.preventDefault();
	const formData = new FormData();
	const inputFile = $("#upload_input");
	const files = inputFile[0].files;
	
	for(j = 0; j < files.length; j++){
		console.log(files[j]);
		if(!checkExtension(files[j].fileName, files[j].size)){
			return false;
		} 
		formData.append("uploadFile", files[j]);
	}
	$.ajax({
		type: "post",
		url: "/notice/uploadAjaxAction",
		data: formData,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(r){
			alert("업로드성공.");
			let str = "";
			let img = "";
			let input = "";
			console.log(r);
			r.forEach((u)=>{
				input += `
					<input type="hidden" name="uvo[${i}].fileName" value="${u.fileName}">
					<input type="hidden" name="uvo[${i}].uuid" value="${u.uuid}">
					<input type="hidden" name="uvo[${i}].path" value="${u.path}">
					<input type="hidden" name="uvo[${i}].checkI" value="${u.checkI}">
					`;
				if(u.checkI){
					const fullPath = encodeURIComponent(`${u.path}/s_${u.uuid}_${u.fileName}`);
					const rfullPath = encodeURIComponent(`${u.path}/${u.uuid}_${u.fileName}`);
					input += `<input type="hidden" name="uvo[${i}].fullPath" value="${rfullPath}">`;
					img += `<img src="display?fileName=${fullPath}" style="display:block;margin:auto"><br>`;
				}else{
					const fullPath = encodeURIComponent(`${u.path}/${u.uuid}_${u.fileName}`);
					input += `<input type="hidden" name="uvo[${i}].fullPath" value="${fullPath}">`;
					str += `<a href="download?fileName=${fullPath}">${u.fileName}</a><br>`;
				}
				i++;
			})
			$("#thumbnails").html(str);
			$("#editor").html($("#editor").html()+img);
			$("#content").val($("#editor").html());
			$("form").append(input);
		}
	})
})

$("#sub").on("click",function(e){
	e.preventDefault();
	$("#content").val($("#editor").html());
	$("form[action='write']").submit();
})


