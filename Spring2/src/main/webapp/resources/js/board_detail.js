//장바구니 플러스 마이너스버튼
const num = document.querySelector('#num');

const plus = document.querySelector('#btn_plus');

plus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity+ 1;
})

const minus = document.querySelector('#btn_minus');

minus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity - 1;
	if(quantity<1){
		num.value =0;
	}else{
		num.value = quantity -1;
	}
})
