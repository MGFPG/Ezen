<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="product_javaScript.jsp" %>

<!--참고사이트 http://www.gemmy.org/main / 아이콘사용 https://fontawesome.com/-->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">

  <%
  // 현재 페이지를 받아옴 
    int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
    int onePageCnt=5; // 한페이지에 출력할 행의 갯수
    
    String dstart = request.getParameter("dstart");
    String dend = request.getParameter("dend");
    String store = request.getParameter("store");
    String ty = request.getParameter("type");
    String keyword = request.getParameter("keyword");
    String tempStart = request.getParameter("page");
    
    if(tempStart != null){ // 처음에는 실행되지 않는다.
        startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
      }
    
try {

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

    String select = "select productid,productname,productcount,storename,regdate from product ";
    String sql= "select count(*) as counter from product ";
    
    
    //조회 조건... 작동은 되는데 좀 더 정리 할수 있나 찾아보기
    try{
        if(ty.equals("productname") && keyword !=null){ //이름+키워드
            select = "select productid,productname,productcount,storename,regdate from product where productname like '%" + keyword + "%' ";
            sql= "select count(*) as counter from product where productname like '%" + keyword + "%' ";
        
        }else if (ty.equals("productid") && keyword !=null){ //코드 + 키워드
            select = "select productid,productname,productcount,storename,regdate from product where productid = '" + keyword + "'";
            sql= "select count(*) as counter from product where productid = '" + keyword + "'";
    
        }else if (!store.equals("")){ //창고명 전체
            select = "select productid,productname,productcount,storename,regdate from product where  = '" + store + "' ";
            sql= "select count(*) as counter from product where storename = '" + store + "' ";
        
        }else if (!store.equals("") && ty.equals("productid") && keyword !=null){ //  창고+코드+키워드
            int key = Integer.parseInt(keyword);
            select = "select productid,productname,productcount,storename,regdate from product where productid =  '" + keyword + "'  and storename = '" + store + "'";
            sql= "select count(*) as counter from product where productid = '" + keyword + "' and storename =  '" + store + "'";
    
        }else if (!store.equals("") && ty.equals("productname") && keyword !=null){ //카테고리+이름+키워드
            select = "select productid,productname,productcount,storename,regdate from product where (productname like '%" + keyword + "%') and storename = '" + store  + "'";
            sql= "select count(*) as counter from product where (productname like '%" + keyword + "%') and storename = '" + store + "'";
    
        }else if (!dstart.equals("")){  //날짜
            select = "select productid,productname,productcount,storename,regdate from product where date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "'";
            sql= "select count(*) as counter from product where date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "'";
        
        }else if (!dstart.equals("") && !store.equals("")){  //날짜 +창고
            select = "select productid,productname,productcount,storename,regdate from product where (date_format(regdate, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "') and storename = '" + store + "' ";
            sql= "select count(*) as counter from product where (date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "') and storename = '" + store + "' ";
        
        }else if (!dstart.equals("")&& ty.equals("productid") && keyword !=null){  //날짜 + 코드
            select = "select productid,productname,productcount,storename,regdate from product where (date_format(date, '%Y-%m-%d') between'" + dstart + "'and'" + dend + "') and productid = '" + keyword + "' and storename = '" + store + "'";
            sql= "select count(*) as counter from product where where (date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "') and productid = '" + keyword + "' and storename = '" + store + "'";
    
        }else if (!dstart.equals("")&& ty.equals("productname") && keyword !=null){  //날짜 + 이름 + 창고
            select = "select productid,productname,productcount,storename,regdate from product where (date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "') and (productname like '%" + keyword + "%') and storename = '" + store  + "'";

            sql= "select count(*) as counter from product where (date_format(date, '%Y-%m-%d') between '" + dstart + "' and '" + dend + "') and (storename like '%" + keyword + "%') and storename = '" + store  + "'";
        }else{

        }

    }finally{
            
      pstmt = conn.prepareStatement(sql);
      ResultSet trs = pstmt.executeQuery();
      
      trs.next();
      int count = trs.getInt("counter");
      int res = trs.getInt("counter");// 전체행 갯수
      trs.close();


      count = (int)Math.ceil((double)count/(double)onePageCnt);
      // 페이지 수 저장
      //out.print("x"+count);

      //sql= select + " ORDER  by regdate desc LIMIT 0 OFFSET 5";
      sql = select + " ORDER  by regdate desc LIMIT " + onePageCnt + " OFFSET " + startPage;

    
      pstmt=conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

     
    %>
    <script type="text/javaScript">

 //자재 삭제확인 함수.. include 하면 한글이 깨진다ㅠㅠ

    function product_delete(a) {
        if (confirm("삭제할까요?")) {
          document.location.href="./product_delete_process.jsp?id="+ a;
          } else {
        }
      }
  
      //전체 자료조회하거나 , 시작일>종료일 or 조건부족시 alert
      function findcheck(){
        var f = document.find;
        var d = f.dstart.value;
  
        if(f.dstart.value > f.dend.value){  
          alert("시작일은 종료일보다 클 수 없습니다.");
          return false;
  
        }else if(f.keyword.value =="" && f.dstart.value =="" && f.category.value ==""){
            if (confirm("모든 자료가 출력됩니다. 계속할까요?")) {
              return;
            } else {
              return false;
            }
        }else if (f.type.value == "" && f.keyword.value != ""){
          alert("키워드 입력시 조건 입력 필수 ");
          return false;
        }else{
          return;
          } 
      }
    </script>

</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

   <!--제목-->
   &emsp;<a class="text" href="bom.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>자재 관리</b></a>
  
 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
  <form method ="post" name="find" action="bom.jsp" onsubmit="return findcheck()" >
      &emsp; &emsp;
      <label for="Mname" ></label>최종수정일: </label>
      <input type="date" id="dstart" name="dstart">
      <b>~</b>
      <input type="date" id="dend" name="dend">&emsp;  

   <!-- 이거 창고테이블 완성후에 내용 불러오기로 하면..좋을텐데ㅋㅋ 선택하기 머 이런걸로--> 
              <label for="store" ></label>창고명 : </label>
      <select name="store" style="width:110px">
        <option value=""> 창고 선택</option>
        <option value="1">나중에 불러오기용</option>
        <option value="2">임시로 셀렉트로 설정중~~</option>
      </select>&emsp;

      <select name="type" id ="type" style="width:110px">
        <option value="">키워드 조건</option>
        <option value="productname">원료명</option>
        <option value="productid">원료코드</option>
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
          <th style="background-color: #eeeeee; text-align: center;">일련번호</th>
          <th style="background-color: #eeeeee; text-align: center;">부품코드</th>
          <th style="background-color: #eeeeee; text-align: center;">부품명</th>
          <th style="background-color: #eeeeee; text-align: center;">수량</th>
          <th style="background-color: #eeeeee; text-align: center;">보관창고</th>
          <th style="background-color: #eeeeee; text-align: center;">최종수정일자</th>
        </tr>
      </thead> 

      
      <%
      int serial=1;

      while(rs.next()){
      
        //PDcode>> 삭제,수정할 때 값 넘기기위해 선언된 변수
      String productid = rs.getString("productid");

       %>

      <thead>
        <td> <%=serial++%></td>
        <td><%=rs.getString("productid")%></td>
        
            
        <!--bom 정보보는 실행문 + 말풍선 삽입 *String이므로 ''안에 변수 넣어야함-->
        <td><%=rs.getString("productname")%>&emsp;
          <div style="font-size: 20px; color:blue; display:inline; cursor: pointer;" onclick="product_update('<%=productid%>')" data-bs-toggle="tooltip" title="정보 수정하기">
          <i class="fas fa-info-circle"></i></div>
        
        <!--bom 삭제하는 실행문 + 말풍선 삽입-->
        <div style="font-size: 20px; color:red; display:inline; cursor: pointer; "data-bs-toggle="tooltip"  title="삭제하기"  onclick="product_delete('<%=productid%>')">
          
          <i class="far fa-times-circle"></i>
        </div>
</td>
<td><%=rs.getString("productcount")%></td>
<td><%=rs.getString("storename")%></td>
        <td><%=rs.getString("regdate")%></td>
      </thead>
      <% } %>
 
    </table>
  </div>
</div>

<!--페이징하기-->
<div class="container">
	<% for(int i=1; i<=count; i++){ %>
	<a href="product.jsp">[<%=i%>]
	</a>
	<% };%> &emsp;
  <b>조회 결과 : <%=res%> 개</b>	<%
    }
    try{
        pstmt.close();
              conn.close();
              
        } catch(Exception e){
              e.printStackTrace();
        }

   } catch(Exception e){
              e.printStackTrace();
              out.print("__");
          }

   %>
</div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
