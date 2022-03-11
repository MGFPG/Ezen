<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<script>
function blankCheck(p){
	var id=p.id.value;
	id=id.trim();
	if(id.lenght<4){
		alert("아이디는 4글자 이상 입력해 주세요.");
		return false;
	}
}
</script>
</head>
<body>
<div style="text-align: center;">
	<h3>*아이디 중복체크*</h3>
	<form method="post" action="idcheckpro.jsp" onsubmit="return blankCheck(this)">
	아이디 <input type="text" name="id">
	<input type="submit" value="중복확인">
</form>
</div>
</body>
</html>