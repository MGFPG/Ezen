<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>

<%

	request.setCharacterEncoding("euc-kr"); 

	String id = (String)session.getAttribute("id");
	String name;
	String birthday;
	String email;
	String phone;
	String address;	

	Connection conn =null;
	PreparedStatement pstmt=null; 
	ResultSet rs = null;

	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	pstmt=conn.prepareStatement("select * from users where id=?");
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	rs.next();
	name=rs.getString("name");
	birthday=rs.getString("birthday");
	email=rs.getString("email");
	phone=rs.getString("phone");
	address=rs.getString("address");

    %>

 <div id="wrap">
        <br><br>
<h3><font color="skyblue"><%=id%></font>님이 로그인하셨습니다.</h3>
<h2>나의 회원정보</h2>
        <table border ="1" align="center">
            <tr>
                <td>이름</td><td><%=name%></td>
            </tr>
            <tr>
                <td>생년월일</td><td><%=birthday %></td>
            </tr>
            <tr>
                <td>이메일</td><td><%=email %></td>
            </tr>
            <tr>
                <td>휴대전화</td><td><%=phone%></td>
            </tr>
            <tr>
                <td>주소</td><td><%=address %></td>
            </tr>
        </table>
    <br>
    <input type="button" value="정보수정" onclick="location.href='fix.jsp'">
    <input type="button" value="회원탈퇴" onclick="location.href='del.jsp'">
    <%
        if (id.equals("admin")) {
    %>
    <!-- //관리자(admin)접속시 -->
    <input type="button" onclick="location.href='list.jsp'" value="관리자모드 접속(목록 보기 가능)">
    <%
        }
    %>

<br><br>
    <form action ="login.jsp" align=center><input type="submit" value="로그아웃"></form>
</div>
</body>
</html>