<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="/WEB-INF/menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title> Error </title>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="jquery-3.6.0.min.js"></script>
  <script src="echarts.js"></script>


  <!-- 페이지 자동으로 새로 고침하는 코드-->
  <META HTTP-EQUIV="refresh" CONTENT="15">
</head>


<body>

<br>
<!--제목-->
<h2><b> &nbsp; 날짜별 에러 리스트 현황 [Defective Product Occur List]</b></h2>

<br>


<!--리스트-->
<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
 
    

      <%

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
        String sql = "select count(*) as counter from defective_list_c";
        String select = "select *, count(*) as counter from defective_list_c group by year order by year asc";
      
        
        //out.println(sql);

        pstmt = conn.prepareStatement(sql); 
        ResultSet trs = pstmt.executeQuery(); 
        
        trs.next();
        int all = trs.getInt("counter"); // 전체에러 갯수
        trs.close();

        all = (int)Math.ceil((double)all);
    
        
        //out.println(sql);
        pstmt=conn.prepareStatement(select);
        rs = pstmt.executeQuery();

      %> 

      <!--그래프 불러오기-->
      <jsp:include page="echart.jsp"></jsp:include>

      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">전체에러의 수</th>
          <th style="background-color: #eeeeee; text-align: center;">연도</th>
          <th style="background-color: #eeeeee; text-align: center;">에러개수</th>
        </tr>
      </thead>

      <%

      while(rs.next()){
      
     
      String e_id = rs.getString("e_id");
 
   
      %> 

    

      <thead>
        <td><%=all%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("counter")%> </td>
      </thead>
      
      
    
      <% } %>

 
      </table>
      </div>
</div>
  

  <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>

  </body>
  </html>
