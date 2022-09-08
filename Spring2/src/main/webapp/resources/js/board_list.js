/**
 * 
 */

$("#btn_Write").on("click",function(){
	location.href="/board/write"
})

const searchValue = $("#searchValue").val();
//console.log(searchValue)

$("#array").on("change",function(){
	console.log(this.value)
	location.href=`list?pageNum=1&amount=12&search=${searchValue}&type=&array=${this.value}`;
})


