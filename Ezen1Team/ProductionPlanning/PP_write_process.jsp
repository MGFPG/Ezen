<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="PP_javaScript.jsp" %>

    <% 

	request.setCharacterEncoding("utf-8"); 

	String PPname = request.getParameter("PPname");
    String PPetc = request.getParameter("PPetc");
    String startdate = request.getParameter("startdate");
    String enddate = request.getParameter("enddate");

	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "insert into ProductionPlanning(PPname, PPetc, startdate, enddate) values (?,?,?,?)";

 	 pstmt=conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	 pstmt.setString(1,PPname);
     pstmt.setString(2,PPetc);
     pstmt.setString(3,startdate);
     pstmt.setString(4,enddate);
 
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
			response.sendRedirect("PP_write_process_2.jsp?num=" + num);
			
			} else{ // 실패
				out.print(num);
			}


    
 } catch(Exception e){
			e.printStackTrace();
	out.print(e);
		}

%>