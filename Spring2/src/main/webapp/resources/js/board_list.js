/**
 * 
 */

$("#btn_Write").on("click",function(){
	location.href="/board/write"
})

const searchValue = $("#searchValue").val();
//console.log(searchValue)
const caValue = $("#caValue").val();
const catValue = $("#catValue").val();
$("#array").on("change",function(){
	console.log(this.value)
	location.href=`list?pageNum=1&amount=12&search=${searchValue}&type=&array=${this.value}&category_area=${caValue}&category_type=${catValue}`;
})

$(".priceformat").each(function(i, price){
	//console.log(i);
	//console.log(price);
})

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

const price = document.querySelectorAll(".priceformat");

for(let p of price){
	p.innerText = priceToString(p.innerText);
}