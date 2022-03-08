<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<HTML>


1공정
<br>
  <label class="switch" >
    <input type="checkbox" onClick="swStart()">
    <span class="slider round"></span>
  </label>
  <p>OFF</p><p style="display:none;">ON</p>




  <HEAD>



<style>
  /* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}



div {
        background-color: orange;
        font-style: italic;
        width:100px;
    }





</style>






   
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
 <script>





 var check = $("input[type='checkbox']");
check.click(function(){
	$("p").toggle();
});






<!-- 타이머 -->
  var ms=0;
  var state=0;
  var now; 
  var then;
 
  
  function swStart()
 
 {
   if(state==1)
 
   { 
    state=0; 
    now=new Date(); 
    ms=now.getTime()-then.getTime() 
    document.watchForm.time.value=parseInt(ms/1000); 
   } else {
     state=1;
     then=new Date(); 
     then.setTime(then.getTime()-ms); 
     }
  }
 
  
 
  function swReset()
 
 {
   state=0;
   ms=0; 
   document.watchForm.time.value=parseInt(ms/1000);
 
 }
 
  
 
  function display()
 
 {
   setTimeout("display();",1000); 
   if (state==1)
 
   {
     now=new Date();
     ms=now.getTime()-then.getTime();
     document.watchForm.time.value=parseInt(ms/1000);
   }
 }
 <!-- 타이머 -->





 </script>
 
  </HEAD>
 








<!-- 타이머 -->
  <BODY onLoad="display()">
   <form name="watchForm">
    가동시간: <input type="text" name="time" style="border:1 solid gray;width:100px;text-align:right">
   
    <input type="button" name="resetButton" value="reset" onClick="swReset()"><br/>
<!-- 타이머 -->







  </BODY>
 </HTML> 