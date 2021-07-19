<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        //구글차트 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','Foods');
            data.addColumn('number','비중');
 
            data.addRows([ 
                ['피자',5],
                ['치킨',2],
                ['햄버거',3]
            ]);
            var opt = {
                    'title':'좋아하는 음식',
                    'width':200,
                    'height':200,
                    pieSliceText:'label',
                    legend:'none' 
            };
            var chart = new google.visualization.PieChart(document.getElementById('myChart'));
            chart.draw(data,opt);
        }
 
        </script>
    </head>
    <body>
        <div id="myChart"></div>
    </body>
</html>
