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
            url: '/recipe/forChart.np?field=SMALL',
            dataType: 'JSON',
            success: function (jsonData) {
                var data = new google.visualization.DataTable();
                data.addColumn('string', '소분류');
                data.addColumn('number', '좋아요');
                for (var i = 0; i < jsonData.length; i++) {
                    data.addRow([jsonData[i].소분류, jsonData[i].좋아요]);
                }
                var options = {
                        'title':'소분류별 좋아요 분포',
                        'width':400,
                        'height':400,
                        pieSliceText:'label',
                        is3D:true,
                        slices:{
                        	0:{offset:0.5}
                        	,12:{offset:0.5}
                        }
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