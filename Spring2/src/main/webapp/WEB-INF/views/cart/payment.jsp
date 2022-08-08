<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart_Payment</title>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/cart_payment.css?ver=1">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
            <table>
                <tr>
                    <td rowspan="2" id="td_left">
                        <h1>주소</h1>
                        <br><span id="match">회원정보와 동일
                        <input type="checkbox" id="check"></span><br>
                        <input type="text" name="address" id="address"><br>
                        <input type="text" placeholder="상세주소">
                        <hr>
                        <h2>결제 수단</h2>
                            <img class="pay_img" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&h=144&c=c&webp=1">카드
                            <img class="pay_img" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=144&h=144&c=c&webp=1">핸드폰
                            <img class="pay_img" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=144&h=144&c=c&webp=1">계좌이체
                        </td>

                    </td>
                    <td>
                        <img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
                        <img src="https://www.ikea.com/kr/ko/images/products/baggebo-bookcase-white__1094764_pe863605_s5.jpg?f=xxs">
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>주문내역</h2>
                        <h4>제품가격 : 100000</h4>
                        <h4>배송비 : 20000</h4>
                        <hr>
                        <h2>결제</h2>
                        <h4>총 주문금액 : 120000</h4>
                    </td>
                </tr>
            </table>
            <a href="list">장바구니로</a>
            <a href="/">메인으로</a>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script type="text/javascript" src="../resources/js/cart_payment.js?ver=1"></script>
</body>
</html>