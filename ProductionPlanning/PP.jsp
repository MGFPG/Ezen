<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="PP_javaScript.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<jsp:include page="/WEB-INF/common_head.jsp"/>
</head>
<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

	<!--제목-->
	<a class="text" style="color:rgb(0, 0, 0); font-size: 30px; text-decoration-line: none;"><b>공정관리</b></a>
		<ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'>공정관리</li></ol>
	
	
	<!--목록-->			
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center border 1px solid #dddddd">

						
<%

request.setCharacterEncoding("utf-8"); 

		// 현재 페이지를 받아옴 
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=5; // 한페이지에 출력할 행의 갯수

	String tempStart = request.getParameter("page");

	if(tempStart != null){ // 처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}


Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String select = "select PPid,PPname,PPetc,startdate, enddate from ProductionPlanning";

String sql= "select count(*) as counter from ProductionPlanning";

pstmt = conn.prepareStatement(sql);

ResultSet trs = pstmt.executeQuery();

trs.next();

int count = trs.getInt("counter"); // 전체행 갯수

//out.print(count);

trs.close();


		count = (int)Math.ceil((double)count/(double)onePageCnt);
		// 페이지 수 저장

		//out.print("x"+count);


//sql= select + " ORDER  by regdate desc LIMIT 0 OFFSET 5";
 sql= select + " ORDER  by regdate desc LIMIT " + onePageCnt + " OFFSET " + startPage;
 
 //out.println(sql);

 pstmt=conn.prepareStatement(sql);

 rs = pstmt.executeQuery();



%> 
					<thead>
						<tr>
							<th class='success text-center' style='width:100px;'>일련번호</th>
							<th class='success text-center' style='width:100px;'>공정계획번호</th>
							<th class='success text-center' style='width:100px;'>공정계획이름</th>
							<th class='success text-center' style='width:100px;'>상세정보</th>
							<th class='success text-center' style='width:140px;'>공정시작일</th>
							<th class='success text-center' style='width:140px;'>공정종료일</th>
					  </tr>
					</thead>

<%

int serial=1;
while(rs.next()){

String PPid = rs.getString("PPid");
  %> 
  <thead>
    
	<td class='success text-center'><%=serial++%></td>
    <td class='success text-center'><%=rs.getString("PPid")%></td>
	<td class='success text-center' onclick="PP_update('<%=PPid%>')"><%=rs.getString("PPname")%></a>
		<a onclick="location.href='PP_delete.jsp?PPid=<%=PPid%>'"><img src="delete.gif"></a></div>
	</td>
	<td class='success text-center'><%=rs.getString("PPetc")%></td>
	<td class='success text-center'><%=rs.getString("startdate")%></td>
	<td class='success text-center'><%=rs.getString("enddate")%></td>
    
 </thead>

<%} %>


			</table>	

				<!--페이징-->
				<div class="container">
					<% for(int i=1; i<=count; i++){ %>
						<a href="PP.jsp?page=<%=i %>">[<%=i%>]
						</a>
					<% }; %>
			  </div>

			<!--버튼-->
			<div class="row">
				<div class="col-lg-12 text-right">
					<button type="button" class="btn btn-default" onclick="location.href='PP.jsp'">목록</button>
					<button type="button" class="btn btn-primary" onclick="addproduct();">신규등록</button>
				</div>
			</div>
		</div>
	</div>

	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>