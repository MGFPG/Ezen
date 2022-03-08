
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="dbCon.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
   <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  </head>

  <body>



<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i> 
  <div class="w3-center">
  <%
  String user_name = "";

  Object lobj_getdata = session.getAttribute("u_name");
  user_name = (String)lobj_getdata;

  if(user_name == null) //로그인 안했을 경우 노출 상단 화면(로그인 버튼보임)
  {
  %>
  <h1 class="w3-xxxlarge w3-animate-bottom">Ezen 1 Team 입니다.</h1>
    <div class="w3-padding-32">
      <button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey" onclick="document.getElementById('login').style.display='block'" style="font-weight:900;">Login</button>
    </div>


<!--login-->
<div id="login" class="w3-modal">
  <div class="w3-modal-content w3-card-4 w3-animate-top">
    <header class="w3-container w3-theme-l1"> 
      <span onclick="document.getElementById('login').style.display='none'" class="w3-button w3-display-topright"><a href="index.jsp">×</a></span>
      <h3>로그인</h3>
    </header>
    <div class="w3-padding">
      <form action="login_action.jsp" name ="login" method="post">
  <table>
      <tr>
        <td>아이디</td> 
        <td><input type="text" name="id" maxlength="20" value=admin></td>
      </tr>
      <tr>
        <td>비밀번호</td> 
        <td><input type="password" name="pw"  maxlength="20" value=1111></td>
      </tr>
    </table>
  <br>
<input type="submit" value="로그인"> <input type="button" value="cancel" onclick="location.href='index.jsp'">
  </form>
    </div>
  </div>
</div>




<% } 




    else { //로그인 했을 경우 노출 상단 화면(로그아웃 버튼 보임)
          
      //if(user_name.equals("")==false) 
      
          { %>
       
            <form action="logout.jsp" name ="logout" method="post">

            <h4><%=user_name%>님 환영합니다.</h4>
            <h1 class="w3-xxxlarge w3-animate-bottom">Ezen 1 Team 입니다.</h1>
            <div class="w3-padding-32">
            <button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey" onclick="document.getElementById('logout').style.display='block'" style="font-weight:900;">Logout</button>
            </div>

          </header>
            
          
          </form>


          <div class="w3-row-padding w3-center w3-margin-top">
            <div class="w3-third">
            <div class="w3-card w3-container" style="min-height:460px">
               
              <br><h3>자재관리</h3><br>
              <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
                <ui>
                    <li><a href="./component/component.jsp">부품 관리</a></li>
                    <li><a href="./product/product.jsp">제품 관리</a></li>
                    <li><a href="./store/store.jsp">창고 관리</a></li>
                    <li><a href="./machine/machine.jsp">설비 관리</a></li>
                    <li><a href="./ProductionPlanning/PP.jsp">공정 관리</a></li>
                    <li><a href="./fair/fair.jsp">생산계획 관리</a></li>
                </ui>
                </div>
                </div>
      
              
      
      
      
           
                <div class="w3-third">
                  <div class="w3-card w3-container" style="min-height:460px">
                  <br><h3>에러 현황/관리</h3><br>
                  <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
                      <ui>                      
                          <li><a href="./error/error_line.jsp">리스트</a></li>
                          <li><a href="./error/error_graph.jsp">그래프</a></li>
                          <li><a href="./error/report.jsp">보고서</a></li>
                      </ui>
                      </div>
                      </div>


                      <div class="w3-third">
                        <div class="w3-card w3-container" style="min-height:460px">
                           
                          <br><h3>항목별 리스트/그래프(임시)</h3>  목욜 오전까지 <br>
                        
                          <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
                            <ui>
                                <li><a href="./machine/error.jsp">제품별(최석환)</a></li>
                                <li><a href="./error/f_list.jsp">공정별(정은혜)</a></li>
                                <!--임시용--><li><a href="./bang1/error_line.jsp">에러별(방진영)</a></li>
                                <li><a href="./lim1/error_line.jsp">날짜별(임예림)</a></li>
                              
                            </ui>
                            </div>
                            </div>
                  






                  
       
          <%
          }
    }
%>


</div>
</header>





        <%
        if(user_name == null)
        {
%>
    <div class="w3-row-padding w3-center w3-margin-top">
      <div class="w3-third">
      <div class="w3-card w3-container" style="min-height:460px">
        
        <br><h3>자재관리</h3><br>
        <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
          <ui>
              <li>부품 관리</a></li>
              <li>제품 관리</a></li>
              <li>창고 관리</a></li>
              <li>설비 관리</a></li>
              <li>생산계획 관리</a></li>
          </ui>
          </div>
          </div>



        <div class="w3-third">
          <div class="w3-card w3-container" style="min-height:460px">
          <br><h3>불량관리</h3><br>
          <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
              <ui>                
                  <li>리스트</a></li>
                  <li>그래프</a></li>               
                  <li>보고서</a></li>
              </ui>
              </div>
              </div>







              <div class="w3-third">
                <div class="w3-card w3-container" style="min-height:460px">
                   
                  <br><h3>항목별 리스트/그래프(임시)</h3>  목욜 오전까지 <br>
                
                  <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
                    <ui>
                        <li>제품별(최석환)</li>
                        <li>공정별(정은혜)</li>
                        <li>에러별(방진영)</li>
                        <li>날짜별(임예림)</li>
                      
                    </ui>
                    </div>
                    </div>
          





            </div>
    

          </div>


   
  <%

        }
       
        %>
    




    </body>


    </html>