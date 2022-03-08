<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>회원가입 처리 JSP</title>
    <style>
        #wrap{
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

	
        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");



   Connection conn=null;
   PreparedStatement pstmt=null; 
   ResultSet rs = null;

	try{

	String jdbcUrl="jdbc:mysql://localhost:3306/ezen";
     	String dbId="root";
    	String dbPass="oracle1234!@";

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
 	 String sql= "insert into users values (?,?,?,?,?,?,?)";

	//out.println(sql);

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,password);
	 pstmt.setString(3,name);
	 pstmt.setString(4,birthday);
	 pstmt.setString(5,email);
	 pstmt.setString(6,phone);
	 pstmt.setString(7,address);


	 pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);

 	}

%>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=name %></font>님 가입을 축하드립니다.
        <br><br>
        
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=password %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=name %></td>
            </tr>
                    
            <tr>
                <td id="title">생년월일</td>
                <td>
                <%=birthday %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=email %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=phone %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=address %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="확인" onclick="location.href='index.html'">
    </div>
</body>
</html>
