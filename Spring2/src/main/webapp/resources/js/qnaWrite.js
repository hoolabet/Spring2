if(localStorage.getItem("saveTitle") != null){
    if(confirm("저장된 작성글이 있습니다. 불러오겠습니까?")){
        $("#input_title").val(localStorage.getItem("saveTitle"));
        $("#input_content").val(localStorage.getItem("saveContent"));
    }
}

$("#save_btn").on("click", function(e){
    e.preventDefault();
    localStorage.setItem("saveTitle", $("#input_title").val());
    localStorage.setItem("saveContent", $("#input_content").val());
    alert("임시저장되었습니다.");
    location.href = "/qna/list";
})

$("#submit_btn").on("click", function(){
	localStorage.removeItem("saveTitle");
	localStorage.removeItem("saveContent");
    $("#do_submit").click();
})