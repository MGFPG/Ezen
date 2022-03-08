<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="error_js.jsp" %>


<%

String e_id = request.getParameter("e_id");

try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "delete from defective_list_c where e_id = '" + e_id + "'";
  
 
  pstmt = conn.prepareStatement(sql);

  int result = pstmt.executeUpdate();
              
  try{
    pstmt.close();
    conn.close();

  } catch(Exception e){
    e.printStackTrace();
    
  }



  if(result == 1){ // 성공
    
		//out.print("삭제 성공");
    //out.print("<script>alert('삭제가 완료되었습니다.'); </script>");
    out.print("<script> window.location=document.referrer; </script>");
    //현재 해당페이지는 action 페이지임, 이전페이지로 가서 새로고침하기(document.referrer)

		} else{ // 실패
			out.print("오류 발생! > 관리자에게 문의하세요.");
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
        %>

