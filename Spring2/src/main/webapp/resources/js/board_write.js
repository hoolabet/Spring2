/**
 * 
 */
if($("#adminCheck").val() === "false" ||$("#adminCheck").val() === ""){
	alert("관리자 외 접근불가")
	location.href="/board/list"
}
const reg = new RegExp("(.*)\.(exe|zip|alz)$")
const maxSize = 5242880;
function checkExtension(fileName, fileSize) {
	if (fileSize >= maxSize) {
		alert("파일용량 초과")
		return false;
	}
	if (reg.test(fileName)) {
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
}

let i = 0;

$("#upload").on("change",function(e) {
		e.preventDefault();
		// .jsp의 form태그를 대체(FormData함수)
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		// console.log(inputFile);
		var files = inputFile[0].files;
		console.log(files);
			for (let j = 0;  j < files.length; j++) {
				// 함수 호출(checkExtension)
				if (!checkExtension(files[j].name, files[j].size)) {
					return false;
				}
				// .jsp의 파일선택을 통해 선택한 파일들을 form태그에 추가
				formData.append("uploadFile", files[j]);
				}// for문 끝
				// ajax를 통해서 uploadController에 파일 관련 데이터 전송
				$.ajax({
						type : "POST",
						url : "/uploadAjaxAction",
						data : formData, 
						contentType : false, 
						processData : false,
						dataType : "json",
						success : function(result) {
							console.log(result);
							let str = "";						
							$(result).each(function(index,obj) {
									// console.log(obj.uploadPath)
									console.log(i)
									if (obj.image) {
										var filePath = encodeURIComponent(obj.uploadPath+ "/s_"	+ obj.uuid+ "_"	+ obj.fileName);
										console.log(filePath)
										str += `<img src = "/display?fileName=${filePath}"><br>`;					
									} else {
										var filePath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid	+ "_"+ obj.fileName);
										str += `<a href="/download?fileName=${filePath}">${obj.fileName}</a>`
									}
									i++;										
								})//each문 끝
								$("#divContent").append(str);
								$("#content").val($("#divContent").html());
							}
				})// ajax끝
})// 체인지이벤트 끝

$("#divContent").on("input",function(){
	$("#content").val($("#divContent").html())
})

	var reg2 =  new RegExp("(.*?)\.(jpg|jpeg|png)$")
	function checkExtension2(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!reg2.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}

$("#uploadThumb").on("change",function(){
	const formData = new FormData();
	const inputFile = $("input[name='thumbnailFile']");
	let files = inputFile[0].files;
	console.log(files);
	for (let i = 0;  i < files.length; i++) {
		// 함수 호출(checkExtension)
		if (!checkExtension2(files[i].name, files[i].size)) {
			return false;
		}
		// .jsp의 파일선택을 통해 선택한 파일들을 form태그에 추가
		formData.append("uploadFile", files[i]);
		}// for문 끝
		// ajax를 통해서 uploadController에 파일 관련 데이터 전송
		$.ajax({
				type : "POST",
				url : "/uploadAjaxAction",
				data : formData, 
				contentType : false, 
				processData : false,
				dataType : "json",
				success : function(result) {
					console.log(result);
					let str = "";
					var input = "";							
					$(result).each(function(i,obj) {
							// console.log(obj.uploadPath)
							console.log(i)
							input += `<input type="hidden" name="image[${i}].fileName" value="${obj.fileName}" class="fileName"><br>`;
							input += `<input type="hidden" name="image[${i}].uuid" value="${obj.uuid}"><br>`;
							input += `<input type="hidden" name="image[${i}].image" value="${obj.image}"><br>`;
							input += `<input type="hidden" name="image[${i}].uploadPath" value="${obj.uploadPath}"><br>`;
							if (obj.image) {
								var filePath = encodeURIComponent(obj.uploadPath+ "/"	+ obj.uuid+ "_"	+ obj.fileName);
								var ThumbPath = encodeURIComponent(obj.uploadPath+ "/s_"	+ obj.uuid+ "_"	+ obj.fileName);
								input += `<input type="hidden" name="image[${i}].fullPath" value="${filePath}"><br>`;
								console.log(filePath)
								str += `<img src = "/display?fileName=${ThumbPath}"><br>`;					
							} else {
								alert('이미지만 등록가능합니다.')
								return false;
							}
							console.log(input)
							
						})//each문 끝
						$("#thumbImg").html(str);
						$("#thumb").html(input);
					}
		})// ajax끝
})

$(".btn").on("click",function(e){
	e.preventDefault();
	
	if(Math.ceil($("#num1").val())!=$("#num1").val()||$("#num1").val()<=0||Math.ceil($("#num2").val())!=$("#num2").val()||$("#num2").val()<=0){
		alert("양의 정수만 입력하세요")
	}
	else if(isNaN($("#num1").val())||isNaN($("#num2").val())){
		alert('숫자만 입력하세요')
	}else{
		if($("#pname").val()==='' || $("#thumb").html()===''||$("#num1").val() ===''||$("#num2").val() ===''){
			alert('폼을 다 작성해주세요')
		}else{
			$("#form").submit();	
		}
		
	}
})
