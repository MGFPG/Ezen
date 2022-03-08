<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="product_javaScript.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./product/product_img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());

String p_name = multi.getParameter("p_name");
String etc =  multi.getParameter("etc");
String p_box =  multi.getParameter("p_box");
String amount =  multi.getParameter("amount");
String category =  multi.getParameter("category");
fileName = multi.getFilesystemName("uploadFile");

	try {
		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);


		
		String sql = "insert into product(p_name,category,etc, p_box,amount, p_img ) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		
		pstmt.setString(1, p_name);
		pstmt.setString(2, category);
		pstmt.setString(3, etc);
		pstmt.setString(4, p_box);
		pstmt.setString(5, amount);
		pstmt.setString(6, fileName);

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
			response.sendRedirect("product_add_process_2.jsp?num=" + num);
			
			} else{ // 실패
				out.print(num);
			}


    
 } catch(Exception e){
			e.printStackTrace();

			out.print(etc);	
		}

%>

