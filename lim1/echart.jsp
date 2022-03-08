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
            tooltip: {
            trigger: 'item'
          },
          legend: {
            top: '5%',
            left: 'center'
          },
          series: [
          {
            name: 'year',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '40',
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: 285, name: '2018' },
              { value: 264, name: '2019' },
              { value: 302, name: '2020' },
              { value: 305, name: '2021' },
              { value: 587, name: '2022' }
            ]
          }
          ]
          };

        // 위에서 설정한 속성을 차트에 반영합니다.
        myChart.setOption(option);
    </script>
    </body>
</html>