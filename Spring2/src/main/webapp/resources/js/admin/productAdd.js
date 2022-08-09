/**
 * 관리자 상품 등록
 */
var img = document.querySelector("#img");
const preview = document.querySelector("#preview");
var item = document.querySelector("#item");
var script = document.querySelector("#script");
var category = document.querySelector("#category");
var money = document.querySelector("#money");
var cnt = document.querySelector("#cnt");
var state = document.querySelector("#state");

var msg = document.querySelector("#msg");

var monreg = /^[0-9]*$/;
var cntreg = /^[0-9]*$/;

function btn(){
	if(!img.value || !item.value || !script.value|| category.value=="선택" || !money.value || !cnt.value || state.value=="선택"){
		msg.innerHTML="모든 사항을 입력해주세요";
		msg.style.color="red";
	}else if(!monreg.test(money.value) || !cntreg.test(cnt.value)){
		msg.innerHTML="판매가와 재고에는 0이상의 숫자만 입력해주세요";
		msg.style.color="red";
	}else{
		msg.innerHTML="";
		var result = confirm("추가하시겠습니까?");
		if(result==true){
			btnForm.submit();
		}
	}
}
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            preview.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
img.addEventListener("change", e => {
    readImage(e.target)
})




