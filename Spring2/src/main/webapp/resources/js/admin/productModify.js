/**
 * 관리자 상품 수정
 */
var img = document.querySelector("#img");
const preview = document.querySelector("#preview");
var item = document.querySelector("#item");
var category = document.querySelector("#category");
var money = document.querySelector("#money");
var cnt = document.querySelector("#cnt");
var state = document.querySelector("#state");

var msg = document.querySelector("#msg");

var monreg = /^[0-9]*$/;
var cntreg = /^[0-9]*$/;

function modify(){
	if(!img.value || !item.value || category.value=="선택" || !money.value || !cnt.value || state.value=="선택"){
		console.log(img.value);
		console.log(item.value);
		console.log(category.value);
		console.log(money.value);
		console.log(state.value);
		msg.innerHTML="모두 입력해주세요";
		msg.style.color="red";
	}else if(!monreg.test(money.value) || !cntreg.test(cnt.value)){
		msg.innerHTML="판매가와 재고에는 0상의 정수만 입력해주세요";
		msg.style.color="red";
	}else{
		msg.innerHTML="";
		var result = confirm("수정하시겠습니까?");
		if(result==true){
			btnForm.submit();
		}
	}
}
function remove(){
	var result = confirm("삭제하시겠습니까?");
	if(result==true){
		btnForm.submit();
	}
}
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
            preview.src = e.target.result
        }
        reader.readAsDataURL(input.files[0])
    }
}
img.addEventListener("change", e => {
    readImage(e.target)
})

