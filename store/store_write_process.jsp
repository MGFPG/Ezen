<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

	String storename = request.getParameter("storename");
    String etc = request.getParameter("etc");

	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "insert into store(storename, etc) values (?,?)";

 	 pstmt=conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	 pstmt.setString(1,storename);
     pstmt.setString(2,etc);
    

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
			response.sendRedirect("store_write_process_2.jsp?num=" + num);
			
			} else{ // 실패
				out.print(num);
			}


    
 } catch(Exception e){
			e.printStackTrace();
	out.print(e);
		}

%>
