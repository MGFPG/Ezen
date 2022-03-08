<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

	String PPname = request.getParameter("PPname");
    String PPid = request.getParameter("PPid");
    String PPetc = request.getParameter("PPetc");
    String startdate = request.getParameter("startdate");
    String enddate = request.getParameter("enddate");

	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "update ProductionPlanning set PPname=?, PPetc=?, startdate=?, enddate=? where PPid= '" +PPid+ "'";

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,PPname);
     pstmt.setString(2,PPetc);
     pstmt.setString(3,startdate);
     pstmt.setString(4,enddate);
    

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