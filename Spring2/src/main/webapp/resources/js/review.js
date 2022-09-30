/**
 * 리뷰 작성 이미지 업로드
 */
$(document).ready(function(){
	
	
	// 업로드 파일 확장자 제한
	var reg =  new RegExp("(.*?)\.(jpg|jpeg|png)$")
	var maxSize=5242880;
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!reg.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	
	// change
	$("#file").change(function upload(e){
		e.preventDefault();
		
		var formData = new FormData();
		var inputFile=$("input[name='uploadFile']");
		
		var files=inputFile[0].files;
		
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			
			formData.append("uploadFile",files[i]);
		}
		$.ajax({
			type:"post",
			url:"/imgupload",
			data:formData,
			contentType:false,
			processData:false,
			dataType:"json",
			success: function(result){
				console.log(result)
				 
				var str="";
					
				$(result).each(function(i,obj){
					console.log(obj);
					console.log("이름"+obj.filename);
					
					str+="<input type='hidden' name='filename' value='"+obj.filename+"' >";
					str+="<input type='hidden' name='uuid' value='"+obj.uuid+"'>";
					str+="<input type='hidden' name='uploadpath' value='"+obj.uploadpath+"'>";
					str+="<input type='hidden' name='image' value='"+obj.image+"'>";
					
					if(obj.image){
						var filePath = encodeURIComponent(obj.uploadpath+"/s_"+obj.uuid+"_"+obj.filename);
						console.log(filePath);
						
						str+="<img src='\display?filename="+filePath+"'>"
						str+="<input type='hidden' value="+filePath+">" 
					}else{ 
						return false;
					}	
					
				})
				$("#uploadResult").html(str);
				
				
			}
			
		})
	}) // change end
	
	// click
	$("#wbtn").on("click",function(){
		var idVal=$("input[name=id]").val();
		var pnoVal=$("input[name=pno]").val();
		var scopeVal=$("input[type=radio]:checked").val();
		var contentVal=$("textarea[name=content]").val();
		
		if(idVal=="" || scopeVal=="" || contentVal==""){
			alert("평점과 내용을 입력해 주세요")
		}else{
			if(confirm("리뷰를 작성하시겠습니까?")){
				$("#form").submit();
			}else{
				return false
			}
			
		}
		
		
	}) // click end
	$("#wbtn_m").on("click",function(){
		var idVal=$("input[name=id]").val();
		var pnoVal=$("input[name=pno]").val();
		var scopeVal=$("input[type=radio]:checked").val();
		var contentVal=$("textarea[name=content]").val();
		
		if(idVal=="" || scopeVal=="" || contentVal==""){
			alert("평점과 내용을 입력해 주세요")
		}else{
			if(confirm("리뷰를 수정하시겠습니까?")){
				$("#form").submit();
			}else{
				return false
			}
			
		}
	}) // click end
	
	
})	// end
