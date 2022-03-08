<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
        option = {
  backgroundColor: '#eeeee',
  title: {
    text: '공정별 에러현황',
    left: 'center',
    top: 20,
    textStyle: {
      color: '#ccc'
    }
  },
  tooltip: {
    trigger: 'item'
  },
  visualMap: {
    show: false,
    min: 80,
    max: 600,
    inRange: {
      colorLightness: [0, 1]
    }
  },
  series: [
    {
      name: '공정별 분류',
      type: 'pie',
      radius: '55%',
      center: ['50%', '50%'],
      data: [
        { value: 425, name: '프리징(E403)' },
        { value: 447, name: '배합(E401)' },
        { value: 428, name: '충전(E401)' },
        { value: 443
        , name: '포장(E402)' },
 
      ].sort(function (a, b) {
        return a.value - b.value;
      }),
      roseType: 'radius',
      label: {
        color: 'rgba(255, 255, 255, 0.3)'
      },
      labelLine: {
        lineStyle: {
          color: 'rgba(255, 255, 255, 0.3)'
        },
        smooth: 0.2,
        length: 10,
        length2: 20
      },
      itemStyle: {
        color: '#c23531',
        shadowBlur: 200,
        shadowColor: 'rgba(0, 0, 0, 0.5)'
      },
      animationType: 'scale',
      animationEasing: 'elasticOut',
      animationDelay: function (idx) {
        return Math.random() * 200;
      }
    }
  ]
};




        // 위에서 설정한 속성을 차트에 반영합니다.
        myChart.setOption(option);
    </script>
    </body>
</html>