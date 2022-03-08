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
  <meta http-equiv="X-UA Compatible" control="IE=edge,chrome=1" />
  <script src="js/bootstrap.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javaScript" >
    window.resizeTo(600,800); 
     function reload(){  
      $("component").load(window.location.href + "#component");
}

  </script>

</head>

<body>
  <%
  Statement statement = null;
     
  Class.forName("com.mysql.jdbc.Driver");
  
  String driver = "com.mysql.jdbc.Driver";
  
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
  
  statement=conn.createStatement();
  
  
  String sql="select * from component ";
  
  String c = request.getParameter("c_id");
  
  try{
    if(c !=null){ 
      sql = "select * from component where c_id = '" +  c + "'";
    }else{
  
    }
  
   } finally{
  
  pstmt=conn.prepareStatement(sql);
  
  rs = pstmt.executeQuery();


%>

<div style="position: relative; left: 50px; float: right;  margin-right:100px ">
  <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
  
  <form method="post" action="./product_add_process.jsp" id="add_form" name ="add_form" enctype="multipart/form-data" onsubmit="return check();" >
    <header id="content-header">
      <h3>공정추가</h3>
    </header>
      <table > 
      <div> <label for="p_name" >생산 제품 :</label>
       <input type="text" name="p_id" id="p_id" readonly>
       <input type="text" name="p_name" id="p_name" readonly>
       <input type="button" value="선택" id="openProduct"><br>
       (BOX당 <input type="text" name="amount" id="amount" readonly style="font-weight:bold">EA)
      </div>
      
      <div> 
      <label for="fairplan" >공정 계획 </label><br>
      계획명 : <input type="text" name="PPname" id="PPname" readonly>
      <input type="button" value="불러오기" id="openPlan"> 
      <br>
      기간: <input type="text" name="startdate" id="startdate" readonly> ~
      <input type="text" name="enddate" id="enddate" readonly><br>
    </div>

    <div>
      <label for="w_count" >목표 생산량 :</label>
      <!--셀렉트박스 가능..?-->
        <input type="text" name="f_count" id="f_count" placeholder="수량 입력" maxlength='6' onkeyup="printbox();" >
        (EA)<br>

        <label for="e_count" >예측 생산량 :</label>
        <input type="text" name="f_box" id="f_box" placeholder="자동 계산" readonly style="font-style :red" >(BOX)<br>
      </div>

      <div> 
        <label for="machine" >가동 설비</label>
       <input type="text" name="machine" id="machine" readonly>
        <input type="button" value="선택" id="openMac"> 
</div>
<div>
<label for="cname" style="tab-size: 10;">원료명 </label> &emsp;&emsp;&emsp;&emsp;
<label for="ccount" style="tab-size:10;" >현재고</label>&emsp;&emsp;&emsp;&emsp;
<label for="camount" style="tab-size: 10;">등록수량</label> 
 
  <tr>
<%
    while(rs.next()){
    
    String c_name = rs.getString("c_name");
    String count = rs.getString("c_count");
     %>
 
  <td><input type="text" name="name" id="name" value="<%=c_name%>" readonly> 
 <input type="text" name="count" id="count" value="<%=count%>" readonly>
 <input type="text" name="amount" id="amount"></td>  
</tr> 
    <% }  %>

  </div> <%
    pstmt.close();
          conn.close();
          
  
  }
  
  %>
    
  </table>
      <input type="submit" value="등록">
      <input type="reset" value="초기화">    
      <div class="clearfix"></div>

      <div class="content-footer">
    
              <p>등록시 예약처리됩니다.</p>
    
      </div>
  </form>
</div>

</body>
</html>