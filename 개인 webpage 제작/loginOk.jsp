<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 성공</title>
</head>
<body>

<% request.setCharacterEncoding("utf-8");%> 

<% 
String id =request.getParameter("id");
String password = request.getParameter("password");

Connection conn =null;
PreparedStatement pstmt=null; 
ResultSet rs = null;

  try{
 	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";
 	 
 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

pstmt=conn.prepareStatement("select * from users where id=?");
pstmt.setString(1,id);
rs=pstmt.executeQuery();

if(rs.next()){
if(password.equals(rs.getString("password"))){
	session.setAttribute("id",id);
	out.println("<script>");
	out.println("location.href='main.jsp'"); 
	out.println("</script>");
	}
}
         
	out.println("<script>");
    out.println("location.href='login.jsp'");
    out.println("</script>");
    
    }catch(Exception e){
        e.printStackTrace();
    }
%>

</body>
</html>

