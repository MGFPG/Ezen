<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="component_javaScript.jsp" %>


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
      var n = parseFloat(document.getElementById('c_count').value);
      //nowByte의 값을 받아와서 검사함
      var c1 = $('#nowByte').text();
      var c2 = parseInt(c1); 

      if (f.c_name.value == "") {
        alert("원료명 입력 필수");
        f.c_name.focus();
        return false;
      
      }if (f.c_count.value == "") {
        alert("수량 입력 필수");
        f.c_count.focus();
        return false;
      
      }if (f.qty.value == "") {
        alert("재고 단위를 설정해주세요.");
        f.qty.focus();
        return false;  

      }if (isNaN(n)) {
        window.alert("재고량은 숫자만 입력해주세요.");
        f.c_count.focus();
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
    <form method="post" action="./component_add_process.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
      <h2>자재 추가하기 </h2>
      <fieldset>
        <legend><h5>아래 내용을 입력하세요</h5></legend>   
        <table >    
          <label for="c_name" >원료명 : </label>
            <input type="text" id="c_name" name="c_name" placeholder="원료명 입력" >

        <br><br>
        <label for="etc" >설명 : </label> <br>
          <textarea rows="5" class="form-control" id="etc" name="etc" 
            onkeyup="fn_checkByte(this)"></textarea >
        <!--글자수 실시간 체크-->
        <sup>(<span name="nowByte" id="nowByte">0</span>/45bytes)</sup>
        
        <br><br>  
        <label for="c_count" ></label>재고 :  </label>
         <!--최대 수량 제한 maxlength-->
          <input type="text" name="c_count" id="c_count" placeholder="수량 입력" maxlength='6' size = 12px;> 
        <select name="qty" id ="qty" style="width:110px">
          <option value="">단위 선택</option>
          <option value="EA">개(ea)</option>
          <option value="KG">kg</option>
          <option value="BOX">박스(box)</option>
          <option value="L">리터(L)</option>
        </select> 
        
        
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