<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
       <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
       <style>
         body {
         font-family:"Lucida Grande","Droid Sans",Arial,Helvetica,sans-serif;
         }
        .legend {
             border: 1px solid #555555;
              border-radius: 5px 5px 5px 5px;
              font-size: 0.8em;
              margin: 10px;
               padding: 8px;
         }
        .bld {
              font-weight: bold;
         }
        </style>

       <body>
           <div id="wordcloud" align="center" >
           </div>
           <div class="legend"  align="center" style="width:60%;">
           빈도수가 높은 단어는 크지만 흐립니다. 빈도수가 낮은 단어는 작지만 진합니다.<br>
           Commonly used words are larger and slightly faded in color.  Less common words are smaller and darker.
           </div>
       </body>

<script>
    var frequency_list = $.ajax({
            url: "./words.csv",
            dataType: "json",
            async: false,
            success:function(data){
            }
        }).responseText;
   
    var frequency_text = [{"text":"비트룻 샐러드","size":40},{"text":"라이언즈","size":15},{"text":"measure","size":10},{"text":"핀토스","size":35},{"text":"유니콘즈","size":30},{"text":"청룡","size":20}];
   
    var x = JSON.parse(frequency_list);
    var color = d3.scale.linear()
            .domain([0,1,2,3,4,5,6,10,15,20,100])
            .range(["#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"]);

    d3.layout.cloud().size([800, 300])
            .words(x)
            .rotate(0)
            .fontSize(function(d) { return d.size; })
            .on("end", draw)
            .start();

    function draw(words) {
        d3.select("#wordcloud").append("svg")
                .attr("width", 850)
                .attr("height", 350)
                .attr("class", "wordcloud")
                .append("g")
                .attr("transform", "translate(320,200)")
                .selectAll("text")
                .data(words)
                .enter().append("text")
                .style("font-size", function(d) { return d.size + "px"; })
                .style("fill", function(d, i) { return color(i); })
                .attr("transform", function(d) {
                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                })
                .text(function(d) { return d.text; });
    }
</script>
</body>
</html>