<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="fair_javaScript.jsp" %>


<!--참고사이트 http://www.gemmy.org/main / 아이콘사용 https://fontawesome.com/-->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <link rel="stylesheet" href="../css/fair_css.css" type="text/css"> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <script src="js/bootstrap.js"></script>
  <jsp:include page="/WEB-INF/common_head.jsp"/>
  
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">

    </script>

</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

   <!--제목-->
   &emsp;<a class="text" href="fair.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>생산계획 관리</b></a>

  
 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
  <form method ="post" name="find" action="fair.jsp" onsubmit="return findcheck()" >
      &emsp; &emsp;
      <label for="Mname" ></label>최종수정일: </label>
      <input type="date" id="dstart" name="dstart">
      <b>~</b>
      <input type="date" id="dend" name="dend">&emsp;  

      <select name="type" id ="type" style="width:110px">
        <option value="">키워드 조건</option>
        <option value="productname">제품명</option>
        <option value="productid">제품코드</option>
      </select>  

        <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
    
      <input type="submit" value="조회" class="btn btn-success"> &emsp;
      <input type="button" value="신규 등록" class="btn btn-primary"  onclick="addproduct();" >
  </form>
</nav>


 
<!--조회 결과 fun.jsp에 삭제,추가 실행함수 있음-->
<div class="container"  >
  <table style="border: 1px;" id="dynamicTable">
    <thead>
    <tr>
    <th>이름</th>
    <th>직업</th>
    <th>나이</th>
    <th>취미</th>
    </tr>
    </thead>
    <tbody id="dynamicTbody">
      
    </tbody>
    </table>
    <button onclick="tableCreate()">table_append</button>
</div>



</body>
</html>
