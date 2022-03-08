<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>스탑워치 만들기</title>

</head>
<body>
<div style="margin: 100px">
    <h1 id="stopwatch" >
        00:00:00
    </h1>
    <div>
        <button onclick="startClock()">start</button>
        <button onclick="stopClock()">stop</button>
        <button onclick="resetClock()">reset</button>
    </div>
</div>
<script src="./stopwatch.js" type="text/javascript"></script>
</body>
</html>