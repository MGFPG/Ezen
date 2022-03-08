<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>

<%

String fileName = "";
String saveFolder = application.getRealPath("./members/img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "UTF-8", new DefaultFileRenamePolicy());
   
String NUM = multi.getParameter("NUM");
   String id = multi.getParameter("id");
   String pw= multi.getParameter("pw");
   String u_name = multi.getParameter("u_name");
   String phone = multi.getParameter("phone");
   String email = multi.getParameter("email");
   String birth = multi.getParameter("birth");
   String address = multi.getParameter("address");
	 String grade = multi.getParameter("grade");
	 String dept = multi.getParameter("dept");
   String warehouse = multi.getParameter("warehouse");
   //picture = multi.getFilesystemName("uploadFile");
   fileName = multi.getFilesystemName("uploadFile");
   String specifics = multi.getParameter("specifics");
 


		
try{
 	 
   
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
  

  String sql= "insert into user(id, pw, u_name, phone, email, birth, address, grade, dept, warehouse, picture, specifics ) values ('"+id+"','"+pw+"','"+u_name+"', '"+phone+"', '"+email+"', '"+birth+"', '"+address+"', '"+grade+"' , '"+dept+"', '"+warehouse+"', '"+fileName+"', '"+specifics+"');";

  pstmt=conn.prepareStatement(sql);
  pstmt.executeUpdate();


 out.print("<script>alert('회원 가입이 정상적으로 완료되었습니다.');</script>");
 out.print("<script>location.href = document.referrer;</script>");
 

 //response.sendRedirect("join.jsp"); 

 }catch(Exception e){ 
   e.printStackTrace();
   out.println("회원 가입에 실패하였습니다.");
   //response.sendRedirect("join_fail.jsp"); 업데이트 안 되었을 경우 노출할 페이지
 }finally{
   if(pstmt != null) 
     try{pstmt.close();}catch(SQLException sqle){}
   if(conn != null) 
     try{conn.close();}catch(SQLException sqle){}
 }
%>

