<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	$('[name="radio"]').bind("click", function(){

		alert("click " + $(this).val());

	});



		$(".buttons").bind("click", function(){

			alert("click " + $(this).text());

		});
})


</script>
<div id = "div_radi">
	<button type = "button" name ="radio" value="흐">라디오1</button>
	<button type = "button" name ="radio" value="하">라디오2</button>
</div>


<span class = "buttons">Bold button</span>

<span class = "buttons">Italic button</span>
</body>
</html>