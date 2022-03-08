<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 폼</title>
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
 <div id="wrap">
        <br><br>
    <b><font size=6>로그인페이지</font></b>
<br><br><br>

<form action="loginOk.jsp" name ="login" method="post">
<table border="1">
    <tr>
    <td>아이디</td> 
    <td><input type="text" name="id" maxlength="20"></td>
    </tr>
    <tr>
    <td>비밀번호</td> 
    <td><input type="password" name="password"  maxlength="20"></td>
    </tr>
    </table>
<br>
<input type="submit" value="로그인"> <input type="button" value="돌아가기" onclick="location.href='index.html'">
</form>
</div>
</body>
</html>