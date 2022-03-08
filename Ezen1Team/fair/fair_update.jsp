<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="product_javaScript.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>부품 정보</title>
  <link rel="stylesheet" href="CSS/base.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  
  <script type="text/javascript" lang="ko">
    //자재 수정 폼에서 저장하지 않고 닫을 시
    function nosave(){
      if (confirm("수정내용이 저장되지 않습니다. 계속할까요?")) {
        location.href = close();
        } else {
      }
    }

     //폼 공백 체크 + 재고 숫자입력 검사 함수 
     function save(){
      var c = confirm("수정하시겠습니까?");
      var f = document.upd; 
      var n = parseFloat(document.getElementById('productcount').value);
     
      //nowByte의 값을 받아와서 검사함
      var c1 = $('#nowByte').text();
      var c2 = parseInt(c1); 

      if (c == true){   
        if (f.productname.value == "") {
        alert("부품명 입력 필수");
        f.productname.focus();
        return false;
      
      }if (f.productcount.value == "") {
        alert("수량 입력 필수");
        f.productcount.focus();
        return false;
      
      }if (isNaN(n)) {
        window.alert("재고량은 숫자만 입력해주세요.");
        f.productcount.focus();
        return false;
      
      }if (c2>45) {
        window.alert("설명은 최대 45Byte까지만 입력가능합니다!");
        return false;
      }else{
      }
     }else{
          f.productcount.focus();
          return false;
        }  
     } 

    var openWin;

    //textarea 바이트 수 체크하는 함수
    function fn_checkByte(obj){
      const maxByte = 45; //최대 45바이트
      const text_val = obj.value; //입력한 문자
      const text_len = text_val.length; //문자수
      let totalByte=0;

      for(let i=0; i<text_len; i++){
      const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
          // 영문,숫자: 1 한글 : 2
        if(uni_char.length>4){
            totalByte += 2;
        }else{
            totalByte += 1;
        }
      }
      if(totalByte>maxByte){
        alert('최대 45Byte까지만 입력가능합니다.(한: 2Byte, 영/숫: 1Byte');
        document.getElementById("nowByte").innerText = totalByte;
        document.getElementById("nowByte").style.color = "red";
      }else{
        document.getElementById("nowByte").innerText = totalByte;
        document.getElementById("nowByte").style.color = "green";
      }
    }
</script>
  

  <!--이미지 노출 사이즈 제한-->
  <style>
    .picture {
    max-width: 250px;
    max-height: 250px;
  }
  </style>

</head>

<body>
  <div style ="text-align:center;">
    <h3><b>부품 수정하기</b></h3>
  
  <%
  String productid = request.getParameter("productid");

  String driver = "com.mysql.jdbc.Driver";

  try {
    Class.forName(driver);
  }catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement statement = null;
  ResultSet resultSet = null;

  try{
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
    statement=conn.createStatement();


    String sql="select * from product where productid = '" + productid + "'";
    resultSet = statement.executeQuery(sql);
  %>

  <table>
  <%
  while(resultSet.next()){
  
  //bom_update_process에서 쓸 값을 받아서 넘김 (이미지 if구문) >>form action주소 참고
  String i = resultSet.getString("productimg");
 
  %>
  
  <div >
    <!--onsubmit>>submit전에 save()로 체크 + enctype로 image값 넘김-->
    <form method="post" action="product_update_process.jsp?image=<%=i%>" name ="upd" enctype="multipart/form-data"  onsubmit="return save();">
      <table>
        <label for="productid" style="color:#ff0000; font-weight:bold;">부품코드(변경불가)</label>
          <input type="text" size = 8px style="text-align:center; color:#ff0000; font-weight:bold;" id="productid" name="productid" readonly value="<%=resultSet.getString("productid") %>" >
           
        <br><br>
        <label for="productname" ><b>부품명 : </b></label>
          <input type="text" id="productname" name="productname" value="<%=resultSet.getString("productname") %>" >
      <br><br>

      <label for="etc" ><b>설명 </b></label><br>
      <textarea rows="5" class="form-control" id="etc" name="etc"  onkeyup="fn_checkByte(this)"><%=resultSet.getString("etc") %></textarea >
  <!--글자수 실시간 체크-->
  <sup>(<span name="nowByte" id="nowByte">0</span>/45bytes)</sup>
           
      <br><br>     
        <label for="productcount" ></label><b>수량 : </b></label>
          <input type="text" name="productcount" size = 12px; maxlength='6' id="productcount" value="<%=resultSet.getString("productcount") %>" ><br>
          최대 999,999개까지 등록가능
      <br><br>
       
      <!--담당부서 수정하기 + 수정창 띄우기-->
      추후 추가예정~~~
      <br>
      <label for="dept" ></label><b>담당부서 : </b></label>
      <input type="text" name="dept" size = 12px; id="dept" value="" >
      <input type="button" value="수정" onclick="openChild()"><br>
      <br><br>

      <!--DB에 등록된 이미지 이름 + 경로 합쳐서 이미지 불러오기-->
        <b>파일 변경 : </b><input type="file" name="uploadFile" accept="image/jpeg,image/png" > <br><br>
          <img class="picture" 
          src="/Ezen1Team/product/product_img/<%=resultSet.getString("productimg")%>"
          alt="등록된 이미지 없음"><br>
     
        <label for="productimg"><b>이미지 파일명: </label>
          <%=resultSet.getString("productimg")%></b> <br><br>

      <!--최초 등록시간 불러오기-->
        <label for="date" style="color:#ff0000;" >최근 수정일자 </label>
          <input type='text' id=date name='date' style="color:#ff0000;" readonly value="<%=resultSet.getString("regdate")%>">
      <br><br>
    </table>  
      <input type="submit" value="수정완료">
      <input type="button" value="창닫기" onclick="nosave();">
  </form>
</div>

  <%
  }conn.close();
    } catch (Exception e) {
      e.printStackTrace();
      out.print("망함");
    }
  %>
</body>
</html>