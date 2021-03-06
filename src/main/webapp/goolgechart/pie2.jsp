<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); // 절대 경로
%>
 
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['item', 'cnt'],
          ['그렇다',     3],
          ['아니다',      2],
        ]);

        var options = {
          title: '설문 결과',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
  </body>
</html>

