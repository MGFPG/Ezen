<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="fair_javaScript.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <!--product에 연동하여 값만 빼내는 jsp-->
   <script type="text/javascript" lang="ko">

function setproduct(a,b,c){
    opener.document.getElementById("p_id").value = a;
    opener.document.getElementById("p_name").value = b;
    opener.document.getElementById("amount").value = c;
    window.close();
    }


   </script>
<%

Statement statement = null;
      
Class.forName("com.mysql.jdbc.Driver");

String driver = "com.mysql.jdbc.Driver";

conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

statement=conn.createStatement();

String sql="select p_name,p_id,amount from product";

pstmt=conn.prepareStatement(sql);

rs = pstmt.executeQuery();

%>
</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    
      <h2>제품 선택 </h2>
       
        <table class="table table-striped">
          <thead>
          <tr><th>제품 번호</th>  
          <th>제품명</th>    
          </tr>  
          </thead>

          <%

          int idx = 0;
          while(rs.next()){

          String p_id = rs.getString("p_id");
          String p_name = rs.getString("p_name");
          String amount = rs.getString("amount");
          %> 

          <thead>
            <tr>
            <td>
              <input type="text" id="p_id" name="p_id" value="<%=p_id%>">
            </td>
            <td>
              <input type="text" id="p_name" name="p_name" value="<%=p_name%>">
            </td>
            <td>
              <input type="button" value="선택" onclick="setproduct('<%=p_name%>','<%=p_id%>',<%=amount%>)";>
              <!--string은 ''안에 변수 , int 는 그냥 넣기-->
            </td>
          </tr>
          </thead>
          <%
        
          idx++;

        } %>
         
        </table>
        
  </div>
</body>
</html>