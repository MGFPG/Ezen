<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8"); 

        String id = (String)session.getAttribute("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
 
   Connection conn = null;
PreparedStatement pstmt=null;
   ResultSet rs = null;
 
 	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
    
    pstmt=conn.prepareStatement("UPDATE users SET password=?,email=?,phone=?,address=? WHERE ID = '"+id+"'");
 
    pstmt.setString(1,password);
    pstmt.setString(2,email);
    pstmt.setString(3,phone);
    pstmt.setString(4,address);
    out.println("---------------------result------------------");
pstmt.executeUpdate();
    

 }catch(Exception e){
    e.printStackTrace();    
    }
 
 response.sendRedirect("main.jsp");
%>    
    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
 
</body>
</html>