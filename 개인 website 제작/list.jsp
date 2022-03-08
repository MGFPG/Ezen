<%@page import="javax.sound.midi.MidiDevice.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

5<%
	String id=null;
	if((session.getAttribute("id"))== null || (!((String)session.getAttribute("id")).equals("admin"))){
 	out.println("<script>");
 	out.println("location.href='login.jsp'");
	out.println("</script>");
	}
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 
 pstmt=conn.prepareStatement("select * from users" );
 rs=pstmt.executeQuery();
 
}catch(Exception e){
 e.printStackTrace();
}
%>
<html>
<head>
<link rel="stylesheet" href="css/webstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<center>
<table border=1 width=300>
 <tr align=center><td colspan=2><font size=5>회원목록</font></td></tr>
 <% while(rs.next()){ %>
  <tr align=center>
   <td>
    <a href="user_info.jsp?id=<%=rs.getString("id") %>">
     <%=rs.getString("id") %>
    </a>
   </td>
   <td><a href="delete.jsp?id=<%=rs.getString("id") %>">삭제</a></td>
  </tr>
 <%} %>
</table>
<br><br>
<input type="button" onclick="location.href='main.jsp'" value="돌아가기">
</center>
</body>
</html>