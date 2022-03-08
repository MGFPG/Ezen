<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>


<!--참고사이트 http://www.gemmy.org/main / 아이콘사용 https://fontawesome.com/-->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">

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
   &emsp;<a class="text" href="product.jsp" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>공정 관리</b></a>
  
 <!--조회 폼 // 조건을 check()로 확인 후 submit-->
 <nav class="navbar navbar-expand-md" style="margin: 10; padding: 0; background-color:lightgray">
  <form method ="post" name="find" action="fair".jsp" onsubmit="return findcheck()" >
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
        <option value="productname">제품명</option>
        <option value="productid">제품코드</option>
      </select>  

        <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
    
      <input type="submit" value="조회" class="btn btn-success"> &emsp;
      <input type="button" value="신규 등록" class="btn btn-primary"  onclick="addfair();" >
  </form>
</nav>

 
<!--조회 결과 fun.jsp에 삭제,추가 실행함수 있음-->
<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">일련번호</th>
          <th style="background-color: #eeeeee; text-align: center;">A</th>
          <th style="background-color: #eeeeee; text-align: center;">B</th>
          <th style="background-color: #eeeeee; text-align: center;">C</th>
        </tr>
      </thead> 


 
    </table>
  </div>
</div>

</div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
