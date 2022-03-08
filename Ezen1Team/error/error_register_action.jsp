<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>


<% 
   String e_id = request.getParameter("e_id");
   String p_name= request.getParameter("p_name"); // 제품명
   String f_name= request.getParameter("f_name"); // 생산이름(공정명)
   String e_type = request.getParameter("e_type"); // 에러타입
   String e_code = request.getParameter("e_code"); // 에러코드
   String m_code = request.getParameter("m_code"); // 설비코드
   String year = request.getParameter("year");
   String month = request.getParameter("month");
   String day = request.getParameter("day");
   String hour = request.getParameter("hour");
	 String e_date = request.getParameter("e_date"); // 등록 시간

	

   try{

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

    String sql= "insert into defective_list_c( p_name, f_name, e_type, e_code, m_code, year, month, day, hour, e_date) values ('"+p_name+"','"+f_name+"', '"+e_type+"', '"+e_code+"', '"+m_code+"', '"+year+"', '"+month+"', '"+day+"','"+hour+"', '"+e_date+"');";
 

    //out.print(sql);

    pstmt=conn.prepareStatement(sql);
    pstmt.executeUpdate();
 
    try{
      pstmt.close();
      conn.close();
  
      } catch(Exception e){
      e.printStackTrace();
              
      }

    out.print("<script>alert('등록이 정상처리 되었습니다.');</script>");
    out.print("<script> opener.parent.location.reload(); window.close();</script>");
    // 등록 > 확인 alert > 팝업창 닫고 부모창 새로고침 하게됨

    

	}catch(Exception e){ 
		e.printStackTrace();
		out.println("뭐가 문제 왜 안되지");
  
	}finally{
		if(pstmt != null) 
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
			try{conn.close();}catch(SQLException sqle){}
	}



  





 %>
