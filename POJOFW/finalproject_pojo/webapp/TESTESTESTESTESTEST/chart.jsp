<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!--Load the AJAX API-->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="ajax-sample.js"></script>
	</head>

	<body>
		<!--Div that will hold the pie chart-->
		<div id="chart_div"></div>
		<button id="btn" type="button" onclick="drawChart()">reflesh</button>
	</body>
</html>