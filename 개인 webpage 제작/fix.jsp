<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr"); 

   String id = request.getParameter("id");

 if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");
    } else {
        out.println("<script>");
        out.println("location.href='main.jsp'");
        out.println("</script>");
    }

 Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
   
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 수정</title>
</head>
<body>
   <form action="update.jsp" method="post">
      <table border="1" bordercolor="grey" align="center">
         <tr>
            <td colspan="2" bgcolor="lightblue" align="center"><%=id %>님 회원 정보 수정</td>
         </tr>

         <tr>
            <td bgcolor="lightgrey" align="center">비밀번호</td>
            <td><input type="password" name="password" ></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">비밀번호 확인</td>
            <td><input type="password" name="password_check"></td>
         </tr>

         <tr>
            <td bgcolor="lightgrey" align="center">이메일</td>
            <td><input type="" name="email"> 예)
               id@domain.com</td>
         </tr>
         <tr>
            <td align="center" bgcolor="lightgrey">휴대전화</td>
            <td><input type="text" name="phone" ></td>
         </tr>
	<tr>
            <td bgcolor="lightgrey" align="center">주소</td>
            <td><input type="text" name="address"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="수정완료"><input type="reset" value="다시 작성"></td>
      </table>
   </form>
</body>
</html>
