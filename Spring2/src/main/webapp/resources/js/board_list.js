/**
 * 
 */

$("#btn_Write").on("click",function(){
	location.href="/board/write"
})
$(".category_type").on("click",function(){
	location.href=$(this).children().first().prop("href")
})

const searchValue = $("#searchValue").val();
//console.log(searchValue)
const caValue = $("#caValue").val();
const catValue = $("#catValue").val();
$("#array").on("change",function(){
	console.log(this.value)
	location.href=`list?pageNum=1&amount=12&search=${searchValue}&type=${$("#except").val()}&array=${this.value}&category_area=${caValue}&category_type=${catValue}`;
})


function priceToString(price) {
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

const price = document.querySelectorAll(".priceformat");

for(let p of price){
	p.innerText = priceToString(p.innerText);
}

$("#ch_soldout").on("click",function(){
	const except = $("#except").val();
	if(except === "except"){
		location.href=`list?pageNum=1&amount=12&search=${searchValue}&type=&array=${$("#array").val()}&category_area=${caValue}&category_type=${catValue}`;	
	}else{
		location.href=`list?pageNum=1&amount=12&search=${searchValue}&type=except&array=${$("#array").val()}&category_area=${caValue}&category_type=${catValue}`;
	}
})


$(".pageNumber").each(function(i,page){
	if(page.innerText == $("#currentPageNum").val()){
		$(this).css("font-weight","bold")
	}
})




