<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>

</head>
<body>
<center>
<br><br><br>
<h2>Password를 입력하세요</h2>
<br>
 <form action="delpro.jsp" method="post">
<h4>password<input type="password" name="password"></h4>
<input type="submit" value="회원탈퇴">
<input type="button" value="취소" onclick="location='main.jsp'">
</form>

</body>
</html>
