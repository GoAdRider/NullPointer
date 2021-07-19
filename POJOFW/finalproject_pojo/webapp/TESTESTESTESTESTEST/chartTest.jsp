<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript">
    
    var largeLayer = "";
    var smallLayer = "";
    var likesCount = 0;
    
	function updAction(){
	        $.ajax({
	            url : '/recipe/forChart.np?field=LARGE'
	            ,dataType : 'json'
	            ,success :  function(data){
	            	largeLayer = data.대분류
	            	smallLayer = data.소분류
	            	likesCount = data.좋아요
	            }
	            ,error: function(xhr, status, error){
	                alert(error);
	            }
	        });
	  
	    }
    
    
    
    
    
    ///////////////////////////////////////////////////////////////////
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	updAction();
        var data = google.visualization.arrayToDataTable([
          ['대분류', '좋아요'],
          [largeLayer, likesCount]
        ]);

        /*
        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        */
        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, null);
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>






