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
    function setPlan(a,b,c){
      opener.document.getElementById("PPname").value = a;
      opener.document.getElementById("startdate").value = b;
      opener.document.getElementById("enddate").value = c;
      window.close();
      }


   </script>
<%

Statement statement = null;
      
Class.forName("com.mysql.jdbc.Driver");

String driver = "com.mysql.jdbc.Driver";

conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

statement=conn.createStatement();

String sql="select * from productionplanning";

pstmt=conn.prepareStatement(sql);

rs = pstmt.executeQuery();

%>
</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    <form method="post"  name ="New" enctype="multipart/form-data" >
      <h2>계획서 선택 </h2>
      <fieldset>   
        <table >
          <thead>
            <tr>
            <th>계획명</th>  
            <th>예정시작일자</th> 
            <th>예정종료일자</th>  
            <th>선택</th>    
            </tr>  
            </thead>

          <%
          while(rs.next()){

          String PPname = rs.getString("PPname");
          String startdate = rs.getString("startdate");
          String enddate = rs.getString("enddate");
          %> 
          <tr> 
            <td><input type="text" id="PPname"name="PPname" value="<%=PPname%>" readonly></td>
            <td><input type="text" id="startdate"name="startdate" value="<%=startdate%>" readonly></td>  
            <td> <input type="text" id="enddate"name="enddate" value="<%=enddate%>" readonly></td> 
            <td>  <input type="button" value="선택" onclick="setPlan('<%=PPname%>','<%=startdate%>','<%=enddate%>')"></td> 
            
          </tr>
          <%} %>
          
          
         
        </table>
      </fieldset>  
    </form>
  </div>
</body>
</html>