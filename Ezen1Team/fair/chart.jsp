<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 다운받은 echarts 파일 -->
    <script src="echarts.js"></script>
</head>
<body>
<!-- 높이와 너비가 지정된 Dom 을 생성합니다 -->
<div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // DOM을 준비하고 echart 객체를 만듭니다.
        var myChart = echarts.init(document.getElementById('main'));

        // 차트 속성과 데이터를 지정합니다.
        var option = {
            title: {
            	text: 'ECharts entry example'
            },
            tooltip: {},
            legend: {
            	data:['Sales']
            },
            xAxis: {
            	data: ["shirt","cardign","chiffon shirt","pants","heels","socks"]
            },
            yAxis: {},
            series: [{
                name: 'Sales',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 위에서 설정한 속성을 차트에 반영합니다.
        myChart.setOption(option);
    </script>
    </body>
</html>