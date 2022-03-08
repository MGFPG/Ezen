<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./component/component_img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8",
   new DefaultFileRenamePolicy());


//폼에서 enctype="multipart/form-data"사용 >> request.getParameter사용시 null 값 나옴

String P = multi.getParameter("c_id");
String c_name = multi.getParameter("c_name");
String c_count =  multi.getParameter("c_count");
String etc =  multi.getParameter("etc");
String qty =  multi.getParameter("qty");
String img =  multi.getParameter("image");
fileName = multi.getFilesystemName("uploadFile");


try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "update component set c_name=?,c_count=?,etc=?,qty=?,c_img=? where c_id = '" + P + "'" ;

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, c_name);
pstmt.setString(2, c_count);
pstmt.setString(3, etc);
pstmt.setString(4, qty);

if(fileName == null){
	pstmt.setString(5, img);
}else{
	pstmt.setString(5, fileName);
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

