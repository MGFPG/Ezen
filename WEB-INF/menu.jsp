<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 

  <div class="container"> </div>

  <!--사이드바 메뉴 -->
  <div class="offcanvas offcanvas-start" id="demo">
    <div class="offcanvas-header">
      <h4 class="offcanvas-title">관리 메뉴(임시)</h4>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>




    <div class="accordion accordion-flush" id="accordionFlushExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
            자재 관리
          </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
          <ul class="list-group">
            <li class="list-group-item"><a href="../component/component.jsp">원료관리</a></li>
            <li class="list-group-item"><a href="../product/product.jsp">제품관리</a></li>
            <li class="list-group-item"><a href="../store/store.jsp">창고관리</a></li>
            <li class="list-group-item"><a href="../machine/machine.jsp">설비관리</a></li>
            <li class="list-group-item"><a href="../ProductionPlanning/PP.jsp">생산계획관리</a></li>
            <li class="list-group-item"><a href="../fair/fair.jsp">공정관리</a></li>
          </ul>
        </div>
      </div>




    <div class="accordion-item">
      <h2 class="accordion-header" id="flush-headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
          에러 관리
                </button>
      </h2>
      <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
        <li class="list-group-item"><a href="../error/error_line.jsp">에러 리스트</a></li>
        <li class="list-group-item"><a href="../error/error_graph.jsp">에러 현황(그래프)</a></li>
        <li class="list-group-item"><a href="../error/report.jsp">에러 보고서</a></li>

      </div>
    </div>











  
    <div class="accordion-item">
      <h2 class="accordion-header" id="flush-headingFive">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
          항목별 리스트/그래프
        </button>
      </h2>
      <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
        <li class="list-group-item"><a href="#">제품별(최석환) </a></li>
        <li class="list-group-item"><a href="#">공정별(정은혜)</a></li>
        <li class="list-group-item"><a href="#">에러별(방진영)</a></li>
        <li class="list-group-item"><a href="#">날짜별(임예림)</a></li>
      </div>
      </div>
    </div>


    <button type="button" data-bs-dismiss="offcanvas">닫기</button>
  </div>
  </div>

<!--상단바 메뉴 -->
  <nav class="navbar navbar-expand-sm bg-dark">
    <div class="container-fluid">
      
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/Ezen1Team/index.jsp" style="color:whitesmoke " ><b>관리시스템</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#demo" style="color:gold"  href="#">메뉴</a>

        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Ezen1Team/index.jsp" style="color:gold" >홈으로</a>

        </li>
      </ul>

    </div>
  </nav>