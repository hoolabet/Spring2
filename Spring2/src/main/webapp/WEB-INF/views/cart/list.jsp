<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_List</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/cart_list.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
            <form action="">
                <h1>장바구니</h1>
                <hr>
                <table>
                    <tr>
                        <td><img src="https://www.ikea.com/kr/ko/images/products/nikkeby-chest-of-4-drawers-grey-green__0729238_pe738502_s5.jpg?f=xxs">
                        </td>
                        <td><input type="checkbox" name="furniture" value="chiffonier"></td>
                        <td class="info">
                            <h4>상품 이름</h4> 
                            <p>가구 정보</p>
                            <select class="select">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                        <td class="coupon_td">
                            <span class="coupon" id="coupon1">쿠폰 입력</span>
                            <p class="st_content" id="st_content1">   
                                주문당 1개의 쿠폰만 사용할 수 있습니다.<br><br>                            
                                <input type="radio" name="list1" value="10%할인쿠폰"> 10%할인쿠폰 <br>
                                <input type="radio" name="list1" value="20%할인쿠폰"> 20%할인쿠폰 <br>
                                <input type="radio" name="list1" value="30%할인쿠폰"> 30%할인쿠폰 <br>
                                <input type="radio" name="list1" value="40%할인쿠폰"> 40%할인쿠폰 <br>
                                <input type="radio" name="list1" value="50%할인쿠폰"> 50%할인쿠폰 
                            </p>
                        </td>
                        <td class="info"> ₩ 200,000 </td>
                    </tr>
                    <tr>
                        <td><img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
                        </td>
                        <td><input type="checkbox" name="furniture" value="chiffonier"></td>
                        <td class="info">
                            <h4>상품 이름</h4> 
                            <p>가구 정보</p>
                            <select class="select">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                        <td class="coupon_td">
                            <span class="coupon" id="coupon2">쿠폰 입력</span>
                            <p class="st_content" id="st_content2">
                                주문당 1개의 쿠폰만 사용할 수 있습니다.<br><br>                            
                                <input type="radio" name="list2" value="10%할인쿠폰"> 10%할인쿠폰 <br>
                                <input type="radio" name="list2" value="20%할인쿠폰"> 20%할인쿠폰 <br>
                                <input type="radio" name="list2" value="30%할인쿠폰"> 30%할인쿠폰 <br>
                                <input type="radio" name="list2" value="40%할인쿠폰"> 40%할인쿠폰 <br>
                                <input type="radio" name="list2" value="50%할인쿠폰"> 50%할인쿠폰
                            </p>
                        </td>
                        <td class="info"> ₩ 100,000 </td>
                    </tr>
                </table>
                <p>
                    <a href="payment">결제창으로</a> <a href="/">메인으로</a>
                </p>
                <div id="paybox">
                    <input type="submit" value="결제하기" id="pay">
                </div>
                <div id="tot">
                    <img src="https://cdn-icons-png.flaticon.com/512/738/738737.png">
                </div>
            </form>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/cart_list.js?ver=1"></script>
</body>
</html>