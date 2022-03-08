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

  <jsp:include page="/WEB-INF/menu.jsp"/>


  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="./jquery-3.6.0.min.js"></script>




  <!-- 페이지 자동으로 새로 고침하는 코드-->
  <META HTTP-EQUIV="refresh" CONTENT="15">
</head>


<body>

<br>
<!--제목-->
<h2><b> &nbsp; 에러 리스트 현황 [Defective Product Occur List]</b></h2>

 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
  <form method ="post" name="find" action="" onsubmit="return findcheck();" >
      &emsp; &emsp;
      <label for="Mname" ></label>최초 등록(최종수정)일: </label>
      <input type="date" id="dstart" name="dstart">
      <b>~</b>
      <input type="date" id="dend" name="dend"> &emsp;  

      <select name="type" id ="type" style="width:110px">
        <option value="">키워드 조건</option>
        <option value="componame">원료명</option>
        <option value="compoid">원료코드</option>
      </select>  

        <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
      
        <input type="submit" value="조회">
      </form>    
       

</nav>




<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
 

      <%

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
        String sql = "select count(*) as counter from defective_list_c";
        String select = "select * ,count(*) as counter from defective_list_c group by e_type";
      
        
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

      <thead>
        <tr>
          
          <th style="background-color: #eeeeee; text-align: center;">에러타입</th>
          <th style="background-color: #eeeeee; text-align: center;">에러개수</th>
          <th style="background-color: #eeeeee; text-align: center;">전체에러개수</th>
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
        
        <td><%=rs.getString("e_type")%></td>
        <td><%=rs.getString("counter")%> </td>
        <td><%=all%></td>
        <td><%=rs.getString("e_date")%>

        <button onclick ="error_update('<%=e_id%>')">수정</button>
        <button onclick ="error_delete('<%=e_id%>')">삭제</button>
        </td>


 
   
      </thead>
      

        <!--일자 옆에 에러 수정, 삭제 버튼 추가 / e_id(primary키)으로 정보를 가져옴-->

         <!--<div style="font-size: 20px; color:red; display:inline; cursor: pointer;"  title="회원 삭제하기" onclick="member_delete()">

        <i class="far fa-times-circle"></i>-->
    
     
    
      <% } %>
 
      </table>
      </div>

  <!--신규 회원 등록 페이지로 이동하는 버튼 만들기-->

  <!--새창에서 열리도록 설정하는 함수와 버튼 코드
  <script>
    function memberadd(){
    window.open("./member_register.jsp")
    }
  </script>
  <input type="button" value="신규 등록" onclick="member_register;" >

-->
 
 


  <!--  
  history.go() 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="history.go(0)"></form>
  window.location.href=window.location.href 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="window.location.href=window.location.href"></form>
  
  * 페이지가 자동으로 새로 고침되도록 하려면 
  다음과 같은 meta 태그를 head 태그 사이에 추가하면 됨
  <META HTTP-EQUIV="refresh" CONTENT="15">

  -->

  



  <!--회원 삭제 / 조회 함수
  <script >
    
 

      if(f.dstart.value > f.dend.value){  
        alert("시작일은 종료일보다 클 수 없습니다.");
        return false;
          
      }else{
        return;
    } 
  }
  </script>-->

  <button onclick ="add_error(); return false;"> 신규 등록</button>


  <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>

  </body>
  </html>
