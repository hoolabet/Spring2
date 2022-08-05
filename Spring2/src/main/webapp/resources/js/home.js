/**
 * 
 */

if ($("#entry_area").height() < "1000") {
    $("#content_area").height(800);
}

$("#categori_btn_img").on("click", function () {
    if ($("#categori").css("display") == "none") {
    	$(".cates").css("display", "none");
        $("#categori").css("display", "block");
    } else {
        $("#categori").css("display", "none");
    }
})

const cate = ["a", "b", "c", "d", "e"];

cate.forEach((x) => {
    $("#categori_" + x).on("click", function () {
        if ($("#categori_" + x + "_list").css("display") == "none") {
            $(".cates").css("display", "none");
            $("#categori_" + x + "_list").css("display", "block");
        } else {
            $("#categori_" + x + "_list").css("display", "none");
        }
    })
}
)

