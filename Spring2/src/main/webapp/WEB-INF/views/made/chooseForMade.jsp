<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<link rel="stylesheet" href="../resources/css/chooseForMade.css?ver=1.1">
<title>제작 페이지</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
            <h1>제작 페이지</h1>
            <div id="choose_div">
                <form action="/made/chooseForMade" method="post">
                	<input type="hidden" name="id" value="${userInfo.id}">
                    <table>
                        <tr>
                            <td colspan="3">가구선택</td>
                        </tr>
                        <tr>
                            <td>TABLE</td>
                            <td>CHAIR</td>
                            <td>etc</td>
                        </tr>
                        <tr>
                            <td><input class="choose_1" type="radio" name="kind" value="1"></td>
                            <td><input class="choose_1" type="radio" name="kind" value="2"></td>
                            <td><input class="choose_1" type="radio" name="kind" value="7"></td>
                        </tr>
                        <tr>
                            <td colspan="3">재료</td>
                        </tr>
                        <tr>
                            <td>나무</td>
                            <td>철재</td>
                            <td>etc</td>
                        </tr>
                        <tr>
                            <td><input class="choose_2" type="radio" name="ingre" value="wood"></td>
                            <td><input class="choose_2" type="radio" name="ingre" value="iron"></td>
                            <td><input class="choose_2" type="radio" name="ingre" value="etc"></td>
                        </tr>
                        <tr>
                            <td colspan="3">치수</td>
                        </tr>
                        <tr>
                            <td>가로</td>
                            <td>세로</td>
                            <td>높이</td>
                        </tr>
                        <tr>
                            <td><input class="choose_3" type="text" name="len1" placeholder="가로"></td>
                            <td><input class="choose_4" type="text" name="len2" placeholder="세로"></td>
                            <td><input class="choose_5" type="text" name="len3" placeholder="높이"></td>
                        </tr>
                        <tr>
                            <td colspan="3">선택4</td>
                        </tr>
                    </table>
                    <br>
                    <div id="red" class="opt_color"></div>
                    <div id="orange" class="opt_color"></div>
                    <div id="yellow" class="opt_color"></div>
                    <div id="green" class="opt_color"></div>
                    <div id="blue" class="opt_color"></div>
                    <div id="navy" class="opt_color"></div>
                    <div id="purple" class="opt_color"></div>
                    <div id="white" class="opt_color"></div>
                    <div id="black" class="opt_color"></div>
                    <br>
                    <input type="hidden" name="color" id="value_color">
                    <input type="submit" value="저장하기" id="sub">
                </form>
            </div>
            <br> <a href="/">메인으로</a> <a href="/made/list">목록으로</a>
        </div>
        <div id="result">
            <div id="result_1"></div>
            <div id="result_2"></div>
            <div id="result_3"></div>
            <div id="result_4"></div>
            <div id="result_5"></div>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/chooseForMade.js?ver=1"></script>
</body>
</html>