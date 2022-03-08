<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="store_javaScript.jsp" %>

<% 
String N = request.getParameter("num");
int num = Integer.parseInt(N);
try {

  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String sql = "update store set storeid = concat('S', num) where num = " + num;

pstmt = conn.prepareStatement(sql);

 pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
			out.print("오류1");
		}


  }catch(Exception e){
			e.printStackTrace();
			out.print("오류2");
		}


%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<script>
  alert("정상처리 되었습니다.");
    location.href=close();
    opener.location.reload();
</script>
</head>
<body>

</body>
</html>
