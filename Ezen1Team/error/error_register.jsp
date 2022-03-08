<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
</head>
<body>

 


<form method="post" action="error_register_action.jsp">
<div class="container mt-3">
  <br>
  <h2>[Error Register Table]</h2>
  <br>
     
  <table class="table table-bordered">
    <thead>

      <tr>
        <td class="label"><label for="p_name">제품명</label>
        <td> <input type="text" name="p_name" size="15" placeholder="직접입력" value="임시 제품">
        
      
        
        </tr>
    
      <tr>
        <td class="label"><label for="f_name">생산이름(공정명)</label>
        <td class="content">
            <select size="1" name="f_name">
              <option value ="충전">충전</option>
              <option value ="배합">배합</option>
              <option value ="프리징">프리징</option>
              <option value ="포장">포장</option>
            </select>       
          </tr>


          <tr>
            <td class="label"><label for="m_code">설비코드</label>
            <td class="content">
                <select size="1" name="m_code">
                  <option value ="M1">M1</option>
                  <option value ="M2">M2</option>
                  <option value ="M3">M3</option>
                  <option value ="M4">M4</option>
                  </select>
                </tr>

      

          
      <tr>
        <td  class="label"><label for="e_type">에러 타입</label>
          <td class="content">
          
              <script language="javascript">
          
                function error_ty(ety) {
                 
                    var type = ety.selecttype.selectedIndex;
                 
                    switch( type ){
                       case 0:
                       ety.type.value = '입력하세요.';
                         break;
                       case 1:
                       ety.type.value = '수평불량';
                         break;
                       case 2:
                       ety.type.value = '프레스이상';
                         break;
                       case 3:
                       ety.type.value = '투입불량';
                         break;
                       case 4:
                       ety.type.value = '포장불량';
                         break;
                    }
                    
                    return true;
                }
           
                </script>
      
                
        
                <form name = "form" >
                <table >
                    <tr>
                
                    <td widht="400">
                    <select name="selecttype" onchange="error_ty(this.form)" >
                    <option selected value=0>-직접입력-
                    <option value=수평불량>수평불량
                    <option value=프레스이상>프레스이상
                    <option value=투입불량>투입불량
                    <option value=포장불량>포장불량
                    </select>
                
                    <input name="type" type="text" size="12" ></td>
                 
                </table>
                </tr>
                </form>
        




                <tr>
                  <td  class="label"><label for="e_code">에러 코드</label>
                    <td class="content">
                    
                        <script language="javascript">
                    
                          function error_c(ec) {
                           
                              var code = ec.selectcode.selectedIndex;
                           
                              switch( code ){
                                 case 0:
                                 ec.code.value = '입력하세요.';
                                   break;
                                 case 1:
                                 ec.code.value = 'E400';
                                   break;
                                 case 2:
                                 ec.code.value = 'E401';
                                   break;
                                 case 3:
                                 ec.code.value = 'E402';
                                   break;
                                 case 4:
                                 ec.code.value = 'E403';
                                   break;
                              }
                              
                              return true;
                          }
                          
                          </script>
                       
                      
                          <form name = "form" >
                          <table >
                              <tr>
                          
                              <td widht="400">
                              <select name="selectcode" onchange="error_c(this.form)" >
                              <option selected value=0>-직접입력-
                              <option value=E400>E400
                              <option value=E401>E401
                              <option value=E402>E402
                              <option value=E403>E403
                              </select>
                          
                              <input name="code" type="text" size="12" ></td>
                           
                          </table>
                          </tr>
                          </form>
                      



           
            <tr>
              <td class="label" colspan="2" align="center" > <발생 시간대>    
           


                
            <tr>
              <td class="label"><label for="year"> year </label>
                <td class="content">
                <select size="1" name="year">
                  <option value ="2017">2017년</option>
                  <option value ="2018">2018년</option>
                  <option value ="2019">2019년</option>
                  <option value ="2020">2020년</option>
                  <option value ="2021">2021년</option>
                  <option value ="2022">2022년</option>
                  <option value ="2023">2023년</option>
                  
                </select>    
              </tr>



            <tr>
              <td class="label"><label for="month"> month </label>
                <td class="content">
                <select size="1" name="month">
                  <option value ="01" >1월</option>
                  <option value ="02" >2월</option>
                  <option value ="03" >3월</option>
                  <option value ="04" >4월</option>
                  <option value ="05" >5월</option>
                  <option value ="06" >6월</option>
                  <option value ="07" >7월</option>
                  <option value ="08" >8월</option>
                  <option value ="09" >9월</option>
                  <option value ="10" >10월</option>
                  <option value ="11" >11월</option>
                  <option value ="12" >12월</option>

                </select>       
              </tr>




                <tr>
                  <td class="label"><label for="day">day</label>
                    <td class="content">
                    <input type="text" name="day" size="6" placeholder="날짜 입력" >
                  </tr>



              <tr>
                <td class="label"><label for="hour">hour</label>
                <td class="content">
                <input type="radio"  name="hour" value="주간" required checked >주간
                <input type="radio"  name="hour" value="야간"  >야간
                <input type="radio"  name="hour" value="새벽" >새벽

              </tr>


              <tr> 
                <td class="label" colspan="2">
              
                  <input type="submit" value="등록하기" >
                  <input type="reset" value="초기화" >
                </tr>
        </form>
    </tbody>
  </table>
</div>