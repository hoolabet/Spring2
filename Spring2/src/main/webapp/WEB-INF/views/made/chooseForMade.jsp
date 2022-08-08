<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/chooseForMade.css">
<title>제작 페이지</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
            <h1>제작 페이지</h1>
            <div id="choose_div">
                <form action="/made/chooseForMade" method="post">
                    <table>
                        <tr>
                            <td colspan="3">선택1</td>
                        </tr>
                        <tr>
                            <td>a</td>
                            <td>b</td>
                            <td>c</td>
                        </tr>
                        <tr>
                            <td><input class="choose_1" type="radio" name="choose_1" value="a"></td>
                            <td><input class="choose_1" type="radio" name="choose_1" value="b"></td>
                            <td><input class="choose_1" type="radio" name="choose_1" value="c"></td>
                        </tr>
                        <tr>
                            <td colspan="3">선택2</td>
                        </tr>
                        <tr>
                            <td>d</td>
                            <td>e</td>
                            <td>f</td>
                        </tr>
                        <tr>
                            <td><input class="choose_2" type="radio" name="choose_2" value="d"></td>
                            <td><input class="choose_2" type="radio" name="choose_2" value="e"></td>
                            <td><input class="choose_2" type="radio" name="choose_2" value="f"></td>
                        </tr>
                        <tr>
                            <td colspan="3">선택3</td>
                        </tr>
                        <tr>
                            <td>g</td>
                            <td>h</td>
                            <td>i</td>
                        </tr>
                        <tr>
                            <td><input class="choose_3" type="radio" name="choose_3" value="g"></td>
                            <td><input class="choose_3" type="radio" name="choose_3" value="h"></td>
                            <td><input class="choose_3" type="radio" name="choose_3" value="i"></td>
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
                    <input type="submit" value="submit">
                </form>
            </div>
            <br> <a href="/">메인으로</a>
        </div>
        <div id="result">
            <span id="result_1"></span>
            <span id="result_2"></span>
            <span id="result_3"></span>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script src="../resources/js/chooseForMade.js"></script>
</body>
</html>