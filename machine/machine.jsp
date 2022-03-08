<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>

<!--참고사이트 http://www.gemmy.org/main / 아이콘사용 https://fontawesome.com/-->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">

  <jsp:include page="/WEB-INF/common_head.jsp"/>

  <%




  // 현재 페이지를 받아옴 
  int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
  int onePageCnt=10; // 한페이지에 출력할 행의 갯수

String pageStart = request.getParameter("page");
String part = request.getParameter("part");
String keyword = request.getParameter("keyword");



int count = 0;


if(pageStart != null){ // 처음에는 실행되지 않는다.
    startPage = (Integer.parseInt(pageStart)-1)*onePageCnt;
}
  
if(part == null){ // 처음에는 실행되지 않는다.
  part = "";
}




Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);





String select = "select m_code,machinename,etc,manager, pressure,temp,vibration, humidity, progress,regdate from machine ";




String sql= "select count(*) as counter from machine";


try{

if(part.equals("manager") ){ //이름+관리자
  select = "select m_code,machinename,etc,manager,pressure,temp, vibration, humidity, progress,regdate from machine where manager like '%" + keyword + "%' ";
  sql= "select count(*) as counter from machine where manager like '%" + keyword + "%' ";

}else if(part.equals("m_code") ){ //이름+관리자
  select = "select m_code,machinename,etc,manager,pressure,temp, vibration, humidity, progress,regdate from machine where m_code like '%" + keyword + "%' ";
  sql= "select count(*) as counter from machine where m_code like '%" + keyword + "%' ";

}}
finally{



pstmt = conn.prepareStatement(sql);

ResultSet trs = pstmt.executeQuery();

trs.next();

 count = trs.getInt("counter"); // 전체행 갯수
 int res = trs.getInt("counter");

//out.print(count);


trs.close();


count = (int)Math.ceil((double)count/(double)onePageCnt);
		// 페이지 수 저장

		//out.print("x"+count);


//sql= select + " ORDER  by nb desc LIMIT 0 OFFSET 5";
 sql= select + " ORDER  by m_code desc LIMIT " + onePageCnt + " OFFSET " + startPage;
 
 //out.println(sql);

 pstmt=conn.prepareStatement(sql);

 rs = pstmt.executeQuery();
}

%>




    <script type="text/javaScript">

 

    function machine_delete(m_code) {
        if (confirm("삭제?")) {
          document.location.href="machine_delete_process.jsp?m_code="+ m_code;
          } else {
        }
      }
  
      
    </script>

</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

   <!--제목-->
   &emsp;<a class="text" href="machine.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>설비</b></a>
  
 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
  <form method ="post" name="find" action="machine.jsp">
      &emsp; &emsp;
      
       
      <select name="part" id ="part" style="width:110px">
        <option value="">키워드 조건</option>
        <option value="m_code">설비코드</option>
        <option value="manager">관리자</option>
      </select>  

        <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
    
      <input type="submit" value="조회" class="btn btn-success"> &emsp;
      <input type="button" value="신규 등록" class="btn btn-primary"  onclick="addproduct();" >
  </form>
</nav>

 
<!--조회 결과 fun.jsp에 삭제,추가 실행함수 있음-->
<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
      <thead>
        <tr>
          
          <th style="background-color: #eeeeee; text-align: center;">설비코드</th>
          <th style="background-color: #eeeeee; text-align: center;">설비명</th>
          <th style="background-color: #eeeeee; text-align: center;">설명</th>
          <th style="background-color: #eeeeee; text-align: center;">관리자</th>
          <th style="background-color: #eeeeee; text-align: center;">압력(㎩)</th>
          <th style="background-color: #eeeeee; text-align: center;">온도(°C)</th>
          <th style="background-color: #eeeeee; text-align: center;">진동(Hz)</th>
          <th style="background-color: #eeeeee; text-align: center;">습도(g/m3)</th>
          <th style="background-color: #eeeeee; text-align: center;">상태</th>

          <th style="background-color: #eeeeee; text-align: center;">등록일</th>

        </tr>
      </thead> 


      <%
     

      while(rs.next()){
      
        //PDcode>> 삭제,수정할 때 값 넘기기위해 선언된 변수
      String m_code = rs.getString("m_code");

       %>


       <thead>
       
        <td><%=rs.getString("m_code")%></td>
        
            
        <!--bom 정보보는 실행문 + 말풍선 삽입 *String이므로 ''안에 변수 넣어야함-->
        <td><%=rs.getString("machinename")%>&emsp;
          


        
</td>
<td><%=rs.getString("etc")%></td>
<td><%=rs.getString("manager")%></td>
<td><%=rs.getString("pressure")%></td>
<td><%=rs.getString("temp")%></td>
<td><%=rs.getString("vibration")%></td>
<td><%=rs.getString("humidity")%></td>
<td><%=rs.getString("progress")%></td>
<td><%=rs.getString("regdate")%> &nbsp&nbsp&nbsp&nbsp&nbsp



<button class="w-btn w-btn-green" onclick="machine_update('<%=m_code%>')" data-bs-toggle="tooltip" title="관리칸에서 수정버튼">수정</button>
		<button class="w-btn w-btn-green" onclick="machine_delete('<%=m_code%>')" data-bs-toggle="tooltip" title="관리칸에서 삭제버튼">삭제</button>
    <button class="w-btn w-btn-green" onclick="location.href='machine_progress.jsp'" data-bs-toggle="tooltip" title="관리칸에서 삭제버튼">상태</button></td>
      </thead>
      <% } %>
 
    </table>
  </div>
</div>


<!--페이징하기-->
<div class="container">
	<% for(int i=1; i<=count; i++){ %>
	<a href="machine.jsp">[<%=i%>]
	</a>
	<% };%> &emsp;
 
</div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>
