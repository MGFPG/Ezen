<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="store_javaScript.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>신규 등록</title>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script type="text/javascript" lang="ko">

    //폼 공백 체크
    function check() {

      var f = document.New; 
      var n = parseFloat(document.getElementById('store').value);
      //nowByte의 값을 받아와서 검사함
      var c1 = $('#nowByte').text();
      var c2 = parseInt(c1); 
      
      }if (c2>45) {
        window.alert("설명은 최대 45Byte까지만 입력가능합니다!");
        return false;
      }

    var openWin;
    
    //textarea 바이트 수 체크하는 함수
    function fn_checkByte(obj){
      const maxByte = 45; //최대 45바이트
      const text_val = obj.value; //입력한 문자
      const text_len = text_val.length; //입력한 문자수
    
    let totalByte=0;
    for(let i=0; i<text_len; i++){
    	const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
        if(uni_char.length>4){
        	// 한글 : 2Byte
            totalByte += 2;
        }else{
        	// 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }
    
    if(totalByte>maxByte){
    	alert('최대 45Byte까지만 입력가능합니다.(한: 2Byte, 영/숫: 1Byte');
      document.getElementById("nowByte").innerText = totalByte;
      document.getElementById("nowByte").style.color = "red";
    }else{
      document.getElementById("nowByte").innerText = totalByte;
      document.getElementById("nowByte").style.color = "green";
      }
    }
  </script>
  
</head>
<body>

  <div style="position: relative; left: 50px; float: left;">

    <form method="post" action="store_write_process.jsp" onsubmit="return check();" >
      <h2>창고 신규 등록 </h2>
      <fieldset>
        <table>  
          <br>  
          <label for="storename" >*창고명 : </label>
            <input type="text" name="storename" placeholder="창고명을 입력하세요" maxlength='10' size='15' style='background-color:#FFE2D5;'>

        <br><br>
        <label for="etc" >*설명 : </label> <br>
          <textarea rows="5" class="form-control" name="etc" onkeyup="fn_checkByte(this)" style='background-color:#FFE2D5;'></textarea >

        <!--글자수 실시간 체크-->
        <sup>(<span name="nowByte" id="nowByte">0</span>/45bytes)</sup>
        
        <br><br>
        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
      </fieldset>  
    </form>
  </div>
</body>
</html>