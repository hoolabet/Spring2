
const write = document.querySelector('#reivew_write');
const writelength = document.querySelector('#writelength');
write.addEventListener('input',()=>{
	const length = write.value.length
	writelength.innerText = length +"/100";
	if(length>100){
		write.value = write.value.substring(0,100);
		alert('100자 미만으로 작성하세요')
		writelength.innerText = "100/100"
	}
})

