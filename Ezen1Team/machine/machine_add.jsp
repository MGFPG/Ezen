<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script type="text/javascript" lang="ko">


	






    //폼 공백 체크 + 재고 숫자입력 검사 함수 
    function check() {

      var f = document.New; 
  
      //nowByte의 값을 받아와서 검사함
      var c1 = $('#nowByte').text();
      var c2 = parseInt(c1); 

      if (f.machinename.value == "") {
        alert("부품명 입력 필수");
        f.machinename.focus();
        return false;
      
      }if (c2>45) {
        window.alert("설명은 최대 45Byte까지만 입력가능합니다!");
        return false;
      }
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
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    <form method="post" action="./machine_add_process.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
      <h2>설비 추가하기 </h2>
      <fieldset>
        <legend><h5>아래 내용을 입력하세요</h5></legend>   
        <table >    
          <label for="machinename" >설비명 : </label>
            <input type="text" id="machinename" name="machinename" placeholder="설비명 입력" >

        <br><br>
        <label for="etc" >설명 : </label> <br>
          <textarea rows="5" class="form-control" id="etc" name="etc" 
            onkeyup="fn_checkByte(this)"></textarea >
        <!--글자수 실시간 체크-->
        <sup>(<span name="nowByte" id="nowByte">0</span>/45bytes)</sup>
        
      
        
        <!--연결된 데이터베이스 : department 에 연결하여 선택하여 호출-->
        <br><br>  
        <label for="manager" >관리자 : </label>
            <input type="text" id="manager" name="manager" placeholder="관리자 입력" >
        <br> <br>
        <label for="pressure" >압력 : </label>
            <input type="text" id="pressure" name="pressure" placeholder="압력 입력" >
        <br> <br>
        <label for="temp" >온도 : </label>
            <input type="text" id="temp" name="temp" placeholder="온도 입력" >
        <br> <br>
        <label for="vibration" >진동 : </label>
            <input type="text" id="vibration" name="vibration" placeholder="진동 입력" >    
        <br> <br>
        <label for="humidity" >습도 : </label>
            <input type="text" id="humidity" name="humidity" placeholder="습도 입력" >    
        <br> <br>
        <label for="progress" >상태 : </label>
  
            <select name="progress" id="progress">

              <option value="">상태 선택</option>
              <option value="작동중">작동중</option>
              <option value="수리중">수리중</option>
              <option value="대기">대기</option>
            </select>
        <br> <br>
        <label for="regdate" >등록일 : </label>
            <input type="date" id="regdate" name="regdate">
            <br> <br>
        이미지
    <input type="file" name="uploadFile" accept="image/jpeg,image/png"><br/><br/>
    
        </table>
  
        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
      </fieldset>  
    </form>
  </div>
</body>
</html>