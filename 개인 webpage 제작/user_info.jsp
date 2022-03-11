<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
 String id=null;
if((session.getAttribute("id")==null)||(!((String)session.getAttribute("id")).equals("admin"))){
 out.println("<script>");
 out.println("location.href='login.jsp'");
 out.println("</script>"); 
}
String info_id=request.getParameter("id");
 
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs = null;
 
try{

	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 
 pstmt=conn.prepareStatement("select * from users where id=?");
 pstmt.setString(1, info_id);
 rs = pstmt.executeQuery();
 rs.next();
}catch(Exception e){
 e.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
<link rel="stylesheet" href="css/webstyle.css">
</head>
<body>
<center>
    <div id="wrap">
        <br><br>
<b><font size="6">회원 정보 보기</font></b>
<br><br>
<table border=1 width=300>
 <tr align=center><td>아이디</td><td><%=rs.getString("id") %></td></tr>
 <tr align=center><td>비밀번호</td><td><%=rs.getString("password") %></td></tr> 
 <tr align=center><td>이름</td><td><%=rs.getString("name") %></td></tr>
 <tr align=center><td>생년월일</td><td><%=rs.getString("birthday") %></td></tr>
 <tr align=center><td>이메일</td><td><%=rs.getString("email") %></td></tr> 
 <tr align=center><td>휴대전화</td><td><%=rs.getString("phone") %></td></tr> 
 <tr align=center><td>주소</td><td><%=rs.getString("address") %></td></tr> 
 <tr align=center><td colspan=2><input type="button" onclick="location.href='list.jsp'" value="리스트로 돌아가기"></td>
</table>
</div>
</center>
</body>
</html>