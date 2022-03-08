<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String name = request.getParameter("name");
   String id = request.getParameter("id");
   String password= request.getParameter("password");
   String email = request.getParameter("email");
   String year = request.getParameter("year");
   String month = request.getParameter("month");
   String day = request.getParameter("day");
   String address = request.getParameter("address");


	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

   Connection conn=null;
   PreparedStatement pstmt=null; 
   ResultSet rs = null;

   try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
 	 String sql= "insert into member values (?,?,?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	 pstmt.setString(1,name);
     	 pstmt.setString(2,id);
 	 pstmt.setString(3,password);
 	 pstmt.setString(4,email);
 	 pstmt.setString(5,year);
	 pstmt.setString(6,month);
	 pstmt.setString(7,day);
 	 pstmt.setString(8,address);

 	 out.println("회원가입에 성공하였습니다.");

 	}catch(Exception e){ 
 		e.printStackTrace();
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>

