<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  
 <!-- 페이지 자동으로 새로 고침하는 코드-->
  <META HTTP-EQUIV="refresh" CONTENT="15">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <jsp:include page="/WEB-INF/common_head.jsp"/>
 

 
  <%


  

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);





String sql = "select count(*) as counter from defective_list_c";
String select = "select * ,count(*) as counter from defective_list_c group by f_name";
      
        
        //out.println(sql);

        pstmt = conn.prepareStatement(sql); 
        ResultSet trs = pstmt.executeQuery(); 
        
        trs.next();
        int all = trs.getInt("counter"); 
        trs.close();

        all = (int)Math.ceil((double)all); // 전체 에러개수
    
        
        //out.println(sql);
        pstmt=conn.prepareStatement(select);
        rs = pstmt.executeQuery();


      

%>




   

</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

  <br>
  <!--제목-->
  <h2><b> &nbsp; 공정별 에러 리스트 현황 [Defective Product Occur List]</b></h2> 
 

 
<!--조회 결과 fun.jsp에 삭제,추가 실행함수 있음-->
<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">총 발생 에러</th>
          <th style="background-color: #eeeeee; text-align: center;">공정명</th>
          <th style="background-color: #eeeeee; text-align: center;">에러코드</th>
          <th style="background-color: #eeeeee; text-align: center;">에러타입</th>
          <th style="background-color: #eeeeee; text-align: center;">에러개수</th>
          
         

        </tr>
      </thead> 

      <%
     

      while(rs.next()){
      
     

       %>
<thead>
  <td rowspan="4"><%=all%></td>
  <td><%=rs.getString("f_name")%></td>
  <td><%=rs.getString("e_code")%></td>
  <td><%=rs.getString("e_type")%></td>
  <td><%=rs.getString("counter")%> </td>    
  
  
  
  


      </thead>
    
      <% } %>
    </table>
  </div>


<br>
<br>
<br>
      <!--그래프 불러오기-->
      <jsp:include page="f_chart.jsp"></jsp:include>





<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>
