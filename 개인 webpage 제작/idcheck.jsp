<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<script>
function blankCheck(p){
	var id=p.id.value;
	id=id.trim();
	if(id.lenght<4){
		alert("���̵�� 4���� �̻� �Է��� �ּ���.");
		return false;
	}
}
</script>
</head>
<body>
<div style="text-align: center;">
	<h3>*���̵� �ߺ�üũ*</h3>
	<form method="post" action="idcheckpro.jsp" onsubmit="return blankCheck(this)">
	���̵� <input type="text" name="id">
	<input type="submit" value="�ߺ�Ȯ��">
</form>
</div>
</body>
</html>