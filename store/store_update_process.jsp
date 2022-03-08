<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

	String storename = request.getParameter("storename");
    String storeid = request.getParameter("storeid");
    String etc = request.getParameter("etc");

	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "update store set storename=?, etc=? where storeid= '" +storeid+ "'";

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,storename);
     pstmt.setString(2,etc);
    

	 pstmt.executeUpdate();

     //out.print(sql);


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {
 

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<script>
  alert("완료되었습니다.");
    location.href=close();
    opener.location.reload();
</script>
</head>
<body>

</body>
</html>