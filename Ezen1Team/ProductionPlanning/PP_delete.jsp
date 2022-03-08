<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String PPid = request.getParameter("PPid");


try{

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "delete from ProductionPlanning where PPid =    '" + PPid + "'";

  pstmt = conn.prepareStatement(sql);

  int result = pstmt.executeUpdate();

  try{
    pstmt.close();
    conn.close();

  } catch(Exception e){
    e.printStackTrace();
    
  }


  if(result == 1){ // 성공
        out.print("성공?");

		} else{ // 실패
			out.print("오류 발생!");
		}

 } catch(Exception e){
			e.printStackTrace();
            
		
		}
        %>

        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <script>
          alert("완료되었습니다.");
            location.href="PP.jsp"
        </script>
        </head>
        <body>
        
        </body>
        </html>
