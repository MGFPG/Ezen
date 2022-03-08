<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./machine/img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8",
   new DefaultFileRenamePolicy());


//폼에서 enctype="multipart/form-data"사용 >> request.getParameter사용시 null 값 나옴

String P = multi.getParameter("m_code");
String machinename = multi.getParameter("machinename");
String manager =  multi.getParameter("manager");
String etc =  multi.getParameter("etc");
String machineimg =  multi.getParameter("machineimg");
fileName = multi.getFilesystemName("uploadFile");
String regdate =  multi.getParameter("regdate");
String pressure =  multi.getParameter("pressure");
String temp =  multi.getParameter("temp");
String progress =  multi.getParameter("progress");
String vibration =  multi.getParameter("vibration");
String humidity =  multi.getParameter("humidity");

try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "update machine set machinename=?,manager=?,etc=?,pressure=?,temp=?,vibration=?, humidity=?, progress=?, regdate=?, machineimg=? where m_code = '" + P + "'" ;

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, machinename);
pstmt.setString(2, manager);
pstmt.setString(3, etc);
pstmt.setString(4, pressure);
pstmt.setString(5, temp);
pstmt.setString(6, vibration);
pstmt.setString(7, humidity);
pstmt.setString(8, progress);
pstmt.setString(9, regdate);

if(fileName == null){
	pstmt.setString(10, machineimg);
}else{
	pstmt.setString(11, fileName);
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

