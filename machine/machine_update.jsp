<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>

<%


String m_code=request.getParameter("m_code");

String driver = "com.mysql.jdbc.Driver";

  try {
    Class.forName(driver);
  } 
    catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement statement = null;
  ResultSet resultSet = null;

  try{
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
    statement=conn.createStatement();


  String sql="select * from machine where m_code = '" + m_code + "'";
  resultSet = statement.executeQuery(sql);

  %>

  <table>
    <%
    while(resultSet.next()){
    
    //bom_update_process에서 쓸 값을 받아서 넘김 (이미지 if구문) >>form action주소 참고
    String i = resultSet.getString("machineimg");
   
    %>






<!DOCTYPE html>

<head>
<Title>추가</Title>







<style>
  .picture {
  max-width: 250px;
  max-height: 250px;
}
</style>







</head>





<body>

  

  
  <form method="post" action="machine_update_process.jsp?image=<%=i%>" enctype="multipart/form-data"  onsubmit="return save();">
       <input type="hidden" name="m_code" value="<%=m_code%>" /><br/>  
    설비명 : <input type="text" name="machinename" value="<%=resultSet.getString("machinename")%>" /> <br/>  
    설명 : <input type="text" name="etc" value="<%=resultSet.getString("etc")%>"/><br/>
    관리자 : <input type="text" name="manager" value="<%=resultSet.getString("manager")%>"/><br/>
    압력 : <input type="text" name="pressure" value="<%=resultSet.getString("pressure")%>"/><br/>
    온도 : <input type="text" name="temp" value="<%=resultSet.getString("temp")%>"/><br/>
    진동 : <input type="text" name="vibration" value="<%=resultSet.getString("vibration")%>"/><br/>
    습도 : <input type="text" name="humidity" value="<%=resultSet.getString("humidity")%>"/><br/>
    상태 :  <select name="progress" id="progress">

      <option value="">상태 선택</option>
      <option value="작동중">작동중</option>
      <option value="수리중">수리중</option>
      <option value="대기">대기</option>
    </select><br/>


    등록일 : <input type="date" name="regdate" id="regdate" value="<%=resultSet.getString("regdate")%>"/><br/>
  
    <b>파일 변경 : </b><input type="file" name="uploadFile" accept="image/jpeg,image/png" > <br><br>
          <img class="picture" 
          src="/Ezen1Team/machine/img/<%=resultSet.getString("machineimg")%>"
          alt="등록된 이미지 없음"><br>
          <label for="machineimg"><b>이미지 파일명: </label>
            <%=resultSet.getString("machineimg")%></b> <br><br>

    <button type="submit">수정</button>
  


  </form>




  <%
}conn.close();
  } catch (Exception e) {
    e.printStackTrace();
    out.print("망함");
  }
%>

</body>
</html>