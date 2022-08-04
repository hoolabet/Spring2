window.onload = function() {
	const check = document.querySelector("#check")
	const address = document.querySelector("#address")

	check.onchange = () => {
		if(check.checked==true) {
			address.value="회원주소"
		} else {
			address.value=""
		}
	}
}