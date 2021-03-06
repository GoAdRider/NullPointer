<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        $.ajax({
            url: '/recipe/forChart.np?field=LARGE',
            dataType: 'JSON',
            success: function (jsonData) {
                var data = new google.visualization.DataTable();
                data.addColumn('string', '대분류');
                data.addColumn('number', '좋아요');
                for (var i = 0; i < jsonData.length; i++) {
                    data.addRow([jsonData[i].대분류, jsonData[i].좋아요]);
                }
                var options = {
                        'title':'대분류별 좋아요 분포',
                        'width':400,
                        'height':400,
                        pieHole: 0.3
                };
                var chart = new google.visualization.PieChart(document.getElementById('myChart'));
                chart.draw(data, options);
                console.log(jsonData);
            }
        });
    }
    google.setOnLoadCallback(drawChart);
</script>
<div id="myChart" style=""></div>
</body>
</html>