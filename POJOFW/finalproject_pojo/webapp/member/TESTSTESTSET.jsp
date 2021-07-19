<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
    text:hover {
        stroke: black;
    }
  </style>
  <script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  <script src="./js/d3.layout.cloud.js"></script>
</head>
<body>
  <div id="cloud"></div>
  <script type="text/javascript">
    var weight = 3,   // change me
        width = 960,
        height = 500;

    var fill = d3.scale.category20();
    d3.json("/recipe/recipeList.np",type).then(function(data){
    	var circle = 
    	
    });
    
    function(d) {
        return {
          text: d.M_ID,
          size: +d.LIKECOUNT*weight
        }
      },
      function(data) {
        d3.layout.cloud().size([width, height]).words(data)
          //.rotate(function() { return ~~(Math.random() * 2) * 90; })
          .rotate(0)
          .font("Impact")
          .fontSize(function(d) { return d.size; })
          .on("end", draw)
          .start();

        function draw(words) {
          d3.select("#cloud").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(" + width/2 + "," + height/2 + ")")
            .selectAll("text")
              .data(words)
            .enter().append("text")
              .style("font-size", function(d) { return d.size + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
            .text(function(d) { return d.text; });
        }
      });
  </script>
</body>
</html>