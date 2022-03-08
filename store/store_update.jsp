<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="store_javaScript.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>자세히 보기</title>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script type="text/javascript" lang="ko">

    // 수정 폼에서 저장하지 않고 닫을 시
    function nosave(){
      if (confirm("수정내용이 저장되지 않습니다. 계속할까요?")) {
        location.href = close();
        } else {
      }
    }

    var openWin;

    //textarea 바이트 수 체크하는 함수
    function fn_checkByte(obj){
      const maxByte = 45; //최대 45바이트
      const text_val = obj.value; //입력한 문자
      const text_len = text_val.length; //문자수
      let totalByte=0;

      for(let i=0; i<text_len; i++){
      const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
          // 영문,숫자: 1 한글 : 2
        if(uni_char.length>4){
            totalByte += 2;
        }else{
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

    <%
    String storeid = request.getParameter("storeid");

    try{

      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
      String sql="select * from store where storeid = '" + storeid + "'";
      
     // out.print(sql);


      pstmt = conn.prepareStatement(sql);
        
      rs = pstmt.executeQuery();

      if(rs.next()){
      
    %>

    <form method="post" action="store_update_process.jsp" action="return check();" >
      <h2>창고 정보 </h2>
      <fieldset>
        <table>    
          <label for="storename" >*창고명 : </label>
            <input type="text" name="storename" placeholder="창고명을 입력하세요" maxlength='10' size='15' style='background-color:#FFE2D5;' value="<%=rs.getString("storename")%>">
            <br><br>

            <label for="storeid" style="color:#ff0000; font-weight:bold;">*창고번호(변경불가) : </label>
            <input type="text" name="storeid" placeholder="창고번호를 입력하세요" maxlength='10' size='15' style='color:#ff0000; font-weight:bold; background-color:#FFE2D5;' readonly value="<%=rs.getString("storeid")%>">

        <br><br>
        <label for="etc" >*설명 : </label> <br>
          <textarea rows="5" class="form-control" name="etc" onkeyup="fn_checkByte(this)" style='background-color:#FFE2D5;' ><%=rs.getString("etc")%></textarea >

        <!--글자수 실시간 체크-->
        <sup>(<span name="nowByte" id="nowByte">0</span>/45bytes)</sup>
        
        <br><br>
        <input type="submit" value="수정완료">
        <input type="button" value="창닫기" onclick="nosave();">    
      </fieldset>  
    </form>

    <%
                rs.close();
          }

          pstmt.close();
          conn.close();
        } catch(SQLException e) {
            out.println("DB에러"+e.toString());
        }
            %>

  </div>
</body>
</html>