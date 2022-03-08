<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="error_js.jsp" %>


<!--참조사이트 http://www.gemmy.org/main -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title> 불량 발생 리스트 </title>
   <!-- 상단,사이드 메뉴바 불러오기-->
   <jsp:include page="/WEB-INF/menu.jsp"/>
  
   <!--제목-->
   &emsp;<a class="text" href="component.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>원료 관리</b></a>



  <jsp:include page="/WEB-INF/common_head.jsp"/>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="./jquery-3.6.0.min.js"></script>




  <!-- 페이지 자동으로 새로 고침하는 코드-->
  <META HTTP-EQUIV="refresh" CONTENT="15">
    <jsp:include page="/WEB-INF/common_head.jsp"/>
</head>


<body>

<br>
<!--제목-->

&emsp;<a class="text" href="error_line.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>에러 리스트 현황 [Defective Product Occur List]</b></a>


 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
 
  <form method ="post" name="find" action="" onsubmit="return findcheck();" >
      &emsp; &emsp;
      <label for="Mname" ></label> 검색기간 :  </label>
      <input type="date" id="dstart" name="dstart">
      <b>~</b>
      <input type="date" id="dend" name="dend"> &emsp;  

      <select name="type" id ="type" style="width:110px">
        <option value="">검색 조건</option>
        <option value="p_name">제품명</option>
        <option value="f_name">공정명</option>
        <option value="m_name">설비명</option>
      </select>  

        <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
      
        <input type="submit" value="조회">

        <button onclick =" add_error(); return false;"> 신규 등록</button>


      </form>    
   

</nav>






<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
 

      <%

      // 현재 페이지를 받아옴 
        int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
        int onePageCnt=12; // 한페이지에 출력할 행의 갯수

        String tempStart = request.getParameter("page");

        if(tempStart != null){ // 처음에는 실행되지 않는다.
            startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
          }
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
        String select = "select * from defective_list_c";
        String sql= "select count(*) as counter from defective_list_c";
        
        //out.println(sql);

        pstmt = conn.prepareStatement(sql); 
        ResultSet trs = pstmt.executeQuery(); 
        
        trs.next();
        int count = trs.getInt("counter"); // 전체행 갯수
        trs.close();

        count = (int)Math.ceil((double)count/(double)onePageCnt);
        // 페이지 수 저장
        //out.print("x"+count);

    
        sql= select + " ORDER  by e_date LIMIT " + onePageCnt + " OFFSET " + startPage;



        //out.println(sql);
        pstmt=conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

      %> 

      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">일련번호</th>
          <th style="background-color: #eeeeee; text-align: center;">제품명</th>
          <th style="background-color: #eeeeee; text-align: center;">공정명</th>
          <th style="background-color: #eeeeee; text-align: center;">에러타입</th>
          <th style="background-color: #eeeeee; text-align: center;">에러코드</th>
          <th style="background-color: #eeeeee; text-align: center;">설비코드</th>
    
          <th style="background-color: #eeeeee; text-align: center;">YEAR</th>
          <th style="background-color: #eeeeee; text-align: center;">MONTH</th>
          <th style="background-color: #eeeeee; text-align: center;">DAY</th>
          <th style="background-color: #eeeeee; text-align: center;">HOUR</th>
          <th style="background-color: #eeeeee; text-align: center;">등록시간</th>
         
        </tr>
      </thead>

      <%
       //위에 만들어진 form에 값 받아와서(rs.getString) 넣기


      while(rs.next()){
      //신규 회원이 추가되는 동안 rs.next로 [등록 회원 관리] 페이지에서 계속 받기
      //getString하고, getInt로 받는 차이? -> 결과는 동일함
     
      String e_id = rs.getString("e_id");
   
   
      %> 
      <thead>
        <td><%=rs.getString("e_id")%> </td>
        <td><%=rs.getString("p_name")%></td>
        <td><%=rs.getString("f_name")%> </td>
        <td><%=rs.getString("e_type")%></td>
        <td><%=rs.getString("e_code")%></td>
        <td><%=rs.getString("m_code")%></td>
        <td><%=rs.getString("year")%>년</td>
        <td><%=rs.getString("month")%>월</td>
        <td><%=rs.getString("day")%>일</td>
        <td><%=rs.getString("hour")%>시</td>
        <td><%=rs.getString("e_date")%>

        <button onclick ="error_update('<%=e_id%>')">수정</button>
        <button onclick ="error_delete('<%=e_id%>')">삭제</button>
        </td>

      </thead>
    
      <% } %>
 
      </table>
      </div>
      
        <!--일자 옆에 에러 수정, 삭제 버튼 추가 / e_id(primary키)으로 정보를 가져옴-->

         <!--<div style="font-size: 20px; color:red; display:inline; cursor: pointer;"  title="회원 삭제하기" onclick="member_delete()">

        <i class="far fa-times-circle"></i>-->


 
 <!--페이징하기  -->
  <div class="container">
    <% for(int i=1; i<=count; i++){ %>
    <a href="error_line.jsp?page=<%=i %>"> [<%=i%>] </a>
    <% }; %>

  </div>





  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


<div class="container mt-3">




  <p>페이징 > 블럭 설정하기</p>
  <ul class="pagination pagination-sm">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</div>





  <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>




  
  </body>
  </html>