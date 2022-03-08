
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>

<body>

<%
  //세션값 삭제하기

	session.removeAttribute("id");
	session.removeAttribute("u_name");


	
%>

<script>

	alert('로그아웃이 완료되었습니다.');

	location.href = 'index.jsp';

</script>

</body>


</html>