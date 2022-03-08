<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE>
<html>

<head>
  <title>login_action</title>
</head>

<body>

<%

String id = "";
String pw = "";
String name = "";

if(request.getParameter("id") == ""){  %> //get으로 받은 아이디가 없는 경우 
  <script>
	 alert("아이디를 입력하세요"); // 아이디 입력하라는 경고창 띄우고

	 document.location.href='./login.jsp' //로그인 팝업창으로 이동(이전에 입력한 것 그대로 어떻게 ?) 

   function back() {
   history.go(-1); // 방법1
   }

	 </script>
   
    <% }
else if(request.getParameter("pw") == ""){ %> // 비밀번호 get으로 받은것이 없는 경우 
   
	 <script>
	 alert("비밀번호를 입력하세요"); // 비번 입력하라는 경고창 띄우고
	 document.location.href='./login.jsp' // 이전 페이지로 돌아가기 
	 </script>

    <% }
else{
	id = request.getParameter("id"); //ID값 가져옴
	pw = request.getParameter("pw"); //PW값 가져옴
    
	//여기서 부터 DB 연결 코드
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet res = null;

	String driverName="com.mysql.jdbc.Driver";
	Class.forName(driverName);

  String jdbcUrl="jdbc:mysql://192.168.0.38/ezen1"; 
  String dbId="root";
  String dbPass="oracle";
 	 
	String sql = "select * from user where id = '" + id + "' AND pw ='" + pw + "'";

	//out.println(sql);

  conn=DriverManager.getConnection( jdbcUrl,dbId ,dbPass );
  Statement st = conn.createStatement();

	if(st==null)
	{


	}


	ResultSet rs = st.executeQuery(sql); // 업데이트 구문 사용시에는 executeUpdate

	//executeQuery ->ResultSet 객체의 값을 반환함, select 구문을 수행할 때 사용됨
  //ExecuteUpdate ->Int 타입의 값을 반환, SELECT 구문을 제외한 다른 구문을 수행할 때 사용
	//Execute -> Boolean 타입의 값을 반환, 모든 구문을 수행할 수 있음

	Boolean check = false;

	if(rs.next()) 
    {
			name = rs.getString("name");

    	session.setAttribute("id", id); 
			session.setAttribute("name", name);
			
    %> 

 			  <script>
  			 alert("정상적으로 로그인이 완료되었습니다.");
				 document.location.href='./index.jsp' // 이전 페이지로 돌아가기
				</script>
 
        
        <%

		}else  { //ID,PW가 일치하지 않는 경우
        %>

   <script>
	 alert("입력하신 ID와 PW는 없는 정보입니다. 회원 등록 먼저 진행해주세요.");
	 document.location.href='./index.jsp' // 이전 페이지로 돌아가기
	 </script>


    <%    }

		rs.close();
		conn.close();


	}
%>
</body>
</html>

