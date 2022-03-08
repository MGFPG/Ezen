<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./machine/img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());

String machinename = multi.getParameter("machinename");
String etc =  multi.getParameter("etc");
String manager =  multi.getParameter("manager");
String pressure =  multi.getParameter("pressure");
String temp =  multi.getParameter("temp");
String progress =  multi.getParameter("progress");
fileName = multi.getFilesystemName("uploadFile");
String regdate =  multi.getParameter("regdate");
String vibration =  multi.getParameter("vibration");
String humidity =  multi.getParameter("humidity");



//out.print(machinename);
//out.print(etc);
//out.print(fileName);



	try {
		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);


		
		String sql = "insert into machine(machinename, etc, manager, pressure, temp, vibration, humidity, progress, machineimg,regdate) values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		
		pstmt.setString(1, machinename);
		pstmt.setString(2, etc);
		pstmt.setString(3, manager);
		pstmt.setString(4, pressure);
		pstmt.setString(5, temp);
		pstmt.setString(6, vibration);
		pstmt.setString(7, humidity);
 		pstmt.setString(8, progress);
		pstmt.setString(9, fileName);
		pstmt.setString(10, regdate);
	

		int result = pstmt.executeUpdate();

		
		rs = pstmt.getGeneratedKeys();  
		rs.next();  
		int num = rs.getInt(1);  


	try{
		pstmt.close();
		conn.close();

		} catch(Exception e){
		e.printStackTrace();
						
		}



		if(result == 1){ // 성공
			response.sendRedirect("machine_add_process_2.jsp?num=" + num);
			
			} else{ // 실패
				out.print(num);
			}


    
 } catch(Exception e){
			e.printStackTrace();

			out.print(etc);	
		}

%>

