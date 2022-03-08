<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="function.jsp" %>

<!--참조사이트 http://www.gemmy.org/main -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>manager main</title>



  <!--head 안에 header파일 추가 -->
  <jsp:include page="header.jsp"></jsp:include>
  <!-- 페이지 자동으로 새로 고침 -->
  <META HTTP-EQUIV="refresh" CONTENT="15">
</head>

<body>

<br>
<!--제목-->
<h2><b>[등록 회원 수정]</b></h2>
<input type="button" value="새로고침" width="40" onClick="window.location.reload()"> 

    <table >   
 

      <%
      String num = request.getParameter("num"); //ID값 가져옴
      // 현재 페이지를 받아옴 
        int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
        int onePageCnt=10; // 한페이지에 출력할 행의 갯수

        String tempStart = request.getParameter("page");

        if(tempStart != null){ // 처음에는 실행되지 않는다.
            startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
          }
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
        String sql = "select * FROM USER WHERE NUM="+num;



   
        out.println(sql);
        pstmt=conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
      %> 

 
      <%
       //위에 만들어진 form에 값 받아와서(rs.getString) 넣기

      if(rs.next()){
      //신규 회원이 추가되는 동안 rs.next로 [등록 회원 관리] 페이지에서 계속 받기
      //getString하고, getInt로 받는 차이? -> 결과는 동일함

    //  int num = rs.getInt("num");


    String grade = rs.getString("grade");
    String picture = rs.getString("picture");

      %> 
<table border=1><tr>
        <td><%=rs.getInt("num")%> </td>
        <td></td>
        <td><%=rs.getString("dept")%></td>
        <td><%=rs.getString("warehouse")%></td>
        <td><%=grade%></td>
        <td><%=rs.getString("regdate")%></td>
        </tr></table>

         <h1> [회원 등록 페이지] </h1>
         <!--
         <form method="get"  action="register_action.jsp">
         -->
         
            <form method="post" action="./member_register_picture.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
         
         
         <br><br>
         
         *이메일 :
             <input type='email' size='50' name=email maxlength='100'  class='form-control' required="required" placeholder='<%=rs.getString("email")%>' value=<%=rs.getString("email")%> >
             <p class='help-block'></p>
         
         <br>
         
          *아이디 : 
             <input type='text' size='50' name=id maxlength='100' width : 50px class='form-control' required="required" placeholder="영문, 숫자, 특수문자 무관" value=qwert>
             <p class='help-block'></p>
         
          <br>
         
          *비밀번호 : 
             <input type='password' size='50' name=pw maxlength='50'  class='form-control' required="required" placeholder="비밀번호" value=1111>
             <input type='password' size='50' name=pw maxlength='50'  class='form-control' required="required" placeholder="비밀번호 확인" value=1111>
             <p class='help-block'></p>
         
          *이름 : 
             <input type='text' size='50' name=name maxlength='50'  class='form-control' required="required"
             value=정치즈>
             <p class='help-block' ></p>
         
          *출생일 : 
             <input type='date' size='50' name=birth maxlength='50'  class='form-control' >
             <p class='help-block' value=960815></p>
         
          <br>
         
          *전화 :
             <input type='text' size='50' name=phone maxlength='100'  class='form-control' required="required" placeholder='<%=rs.getString("phone")%>' value=<%=rs.getString("phone")%>>
             <p class='help-block'></p>
             
             <br>
         
          *프로필 사진 등록 :

          <img src='./img/<%=picture%>' width=100 height="100">
          <input type="file" name="uploadFile" accept="image/jpeg,image/png">
             <p class='help-block'></p>
             
             <br>
         
          *스마트폰키(regld) :
             <input type='text' size='50' name=key maxlength='100'  class='form-control'  
             placeholder='스마트폰 키(regld)'>
              <p class='help-block'></p>
         
          <br>
         
          *등급선택<%=grade%>
<input type="radio" id="manager" name="grade" value="manager"  <% if( grade.equals("manager")) { out.print("checked"); } %> >관리자

             <input type="radio" id="teacher" name="grade" value="teacher" <% if( grade.equals("teacher")) { out.print("checked"); } %> >전문강사
             <input type="radio" id="consultant" name="grade" value="consultant">전문컨설턴트
             <input type="radio" id="preminum" name="grade" value="preminum">고급
             <input type="radio" id="normal" name="grade" value="normal"  >일반
             <p class='help-block'></p>
         
         <br>
         
         *부서 : 
             <input type="radio" id="sailing" name="dept" value="영업부" required="required">영업부
             <input type="radio" id="stock" name="dept" value="자재부">자재부
             <input type="radio" id="making" name="dept" value="생산부">생산부
             
         <!--
         <select id='selectbox'>
             <option value="sailing" required="required">영업부</option>
             <option value="stock">자재부</option>
             <option value="making">생산부</option>
             </select>
             <p class='help-block'></p>
         -->
         
         <br>
         
         *관리창고 : 
             <input type="radio" id="A1" name="warehouse" value="A1" required="required">A1
             <input type="radio" id="B1" name="warehouse" value="B1">B1
             <input type="radio" id="C1" name="warehouse" value="C1">C1
             <input type="radio" id="임시" name="warehouse" value="임시">임시
         
         <!--<select id='selectbox'>
            <option value="A1" required="required">A1</option>
            <option value="B1">B1</option>
            <option value="C1">C1</option>
            <option value="임시">임시</option>
         </select>
         <p class='help-block'></p> -->
         
         
         <br>
         
         *주소 : 
            <input type='text' size='50' name=key maxlength='100'  class='form-control' placeholder="서울시 마포구 상암동">  
            
            
             <p class='help-block'></p>
             
         
         <br>
         
         <p>*특이사항</p>
         <textarea rows="5" cols="100"></textarea>
         
         
         <br><br>
         
         <input type="submit" value="회원가입" 
            onClick="alert_back.jsp"> 
         
         
         <input type="reset" value="내용 초기화">
         
         
         
         </form>
         
      
      <% } %>
 
    </table>


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
  <form>
  <input type="button" value="페이지 새로 고침" 
  onClick="window.location.reload()"></form>
  
  history.go() 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="history.go(0)"></form>
  window.location.href=window.location.href 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="window.location.href=window.location.href"></form>
  
  * 페이지가 자동으로 새로 고침되도록 하려면 
  다음과 같은 meta 태그를 head 태그 사이에 추가하면 됨
  <META HTTP-EQUIV="refresh" CONTENT="15">

  -->




  <!--회원 삭제 / 조회 함수-->
  <script >
    
    //삭제 하기전에 한번 더 확인할 수 있도록 comfirm 함수 사용
    function member_delete() {
      if (confirm("회원 정보를 모두 삭제하시겠습니까?")) {
          //history.go(-1); 이전 페이지로 다시 돌아가는 함수
          document.location.href="./delete_action.jsp";
        } else {
          location.href = document.referrer;
          //취소할 경우 원래 페이지로 돌아가기
      }
    }

    //전체 공백 -> 모든 자료조회 , 시작일>종료일이면 조회불가 함수
    function findcheck(){
      var f = document.find;
      var d = f.dstart.value;

      if(f.dstart.value > f.dend.value){  
        alert("시작일은 종료일보다 클 수 없습니다.");
        return false;
          
      }else{
        return;
    } 
  }
  </script>



  <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>

  </body>
  </html>
