<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); // 절대 경로
%>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<script>

</script>

<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">

<DIV class="title_line">
 <i class="fas fa-home"></i><a href="../index.do"> 홈 </a> - <a href="../survey/list.do"> 설문조사</a> 
</DIV>
<DIV class="aside_left" style="padding-left: 6px;">결과보기</DIV> 
<DIV class='menu_line'></DIV>

 
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);

      var auto_reload = null;
      
      $(function() {
        auto_reload = setInterval(function() { drawChart() }, 3000); // 3초마다 자동 실행
        // clearInterval(auto_reload); // 자동 실행 중지
      });
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable(
            ${str}
         );

        var options = {
          title: '${survey_title}',
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


<jsp:include page="/menu/bottom.jsp" flush='false' />

