<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>
  <script type="text/javascript">
      

	// 체크된 항목을 담기 위한 배열 선언
	$(document).ready(function() {
    	// 체크 박스 클릭 시 전체선택
		$("#addall").click(function() {
			if($("#addall").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
			
		});

		$("input[name=chk]").change(function() {
			// 체크박스 갯수와  체크된 체크박스 갯수 비교 후 불일치시 헤더 체크박스 해제 
			if($(this).length != $("input[name=chk]:checked").length) $("#addall").prop("checked", false); 
			
		});

		$("#btn_showChkList").click(function() {
			if($("input[name=chk]:checked").length == 0) {
				$("#txt_getChkList").val("");
				alert("체크된 항목이 없습니다.");
				return;

			}else{


    self.close();

        }
      })
    });




</script>

<%

Statement statement = null;
      
Class.forName("com.mysql.jdbc.Driver");

String driver = "com.mysql.jdbc.Driver";

conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

statement=conn.createStatement();

String sql="select * from component";

pstmt=conn.prepareStatement(sql);

rs = pstmt.executeQuery();

%>
</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
 
      <h2>원료 선택 </h2>         
        <table id="ComList" style="border: 1px solid black;">
          <thead>
            <tr>
              <th><input type="checkbox" id ="addall" name="addall"></th>
              <th>원료 번호</th>  
            <th>원료명</th> 
            <th>정보</th>  
            </tr>  
            </thead>

          <%
          while(rs.next()){

          String c_id = rs.getString("c_id");
          String c_name = rs.getString("c_name");
          String c_count = rs.getString("c_count");

          %> 
          <tbody>
          <tr> 
            <td><input type="checkbox" id ="chk" name ="chk"></td>
            <td><input type="text" id="c_id"name="c_id" value="<%=c_id%>" readonly></td>
            <td> <input type="text" id="c_name"name="c_name" value="<%=c_name%>" readonly></td>
            <td><div style="font-size: 20px; color:rgb(107, 107, 190); display:inline; cursor: pointer;" data-bs-toggle="tooltip" title="정보 수정하기">
              <i class="fas fa-info-circle"></i></div></td>
          </tr>
          <%} %>
        </tbody>
      
      </table>
      <br>
        <input type="button" id="btn_showChkList" name="btn_showChkList" value="체크리스트 확인" />
     
        

  </div>
</body>
</html>