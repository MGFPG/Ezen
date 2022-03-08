<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./product/product_img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8",
   new DefaultFileRenamePolicy());


//폼에서 enctype="multipart/form-data"사용 >> request.getParameter사용시 null 값 나옴

String P = multi.getParameter("productid");
String productname = multi.getParameter("productname");
String productcount =  multi.getParameter("productcount");
String etc = multi.getParameter("etc");
String img = multi.getParameter("image");
fileName = multi.getFilesystemName("uploadFile");



try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "update product set productname=?,productcount=?,etc=?,productimg=? where productid = '" + P + "'" ;

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, productname);
pstmt.setString(2, productcount);
pstmt.setString(3, etc);

if(fileName == null){
	pstmt.setString(4, img);
}else{
	pstmt.setString(4, fileName);
}


int result = pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
		}



    if(result == 1){ // 성공
		response.sendRedirect("alert_complete_close.jsp");

		} else{ // 실패
			out.print("입력 실패");
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
%>

