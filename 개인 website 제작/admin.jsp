<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
 String id=null;
 if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
  out.println("<script>");
  out.println("location.href='login.jsp'");
  out.println("</script>");
 }
 String delete_id=request.getParameter("id");
String info_id=request.getParameter("id");

 Connection conn = null;
 PreparedStatement pstmt =null;
 ResultSet rs = null;
 
 try{

	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
  
  pstmt=conn.prepareStatement("Delete from users where id=?");
  pstmt.setString(1, delete_id);
 pstmt.setString(1,info_id);
  pstmt.executeUpdate();
  
  out.println("<script>");
  out.println("location.href='list.jsp'");
  out.println("</script>");
 }catch(Exception e){
  e.printStackTrace();
 }
%>
 
 
 
    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
 
</body>
</html>
