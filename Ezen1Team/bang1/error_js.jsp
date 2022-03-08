<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  <!--공급가와 세금여부를 입력받으면 판매가를 계산하는 함수-->
  <script type="text/javascript" lang="ko">
  
    function printtaxy()  {
  
       const sprice = document.getElementById('sprice').value;
       nprice = Number(sprice);
       var rates = document.getElementById('tax').value;
  
       if(rates == "O"){
         tax = 0.1;
       }else{
         tax = 0;
       }
       
       var rprice = nprice + (nprice * tax);
       document.getElementById('rprice').value  = rprice;
      }
  
      function printtaxn()  {
       var notax = document.getElementById('sprice').value; 
       document.getElementById('rprice').value  = notax;
      }
  
     
  
    //추가 폼 실행함수
    function addproduct(){
      window.open("./component_add.jsp", "재고관리 추가", "width=500, height=800, top=150, left=200")
      }
  
    //수정 폼 실행함수
    function component_update(compoid){
      window.open("./component_update.jsp?compoid="+compoid, "재고관리 수정", "width=500, height=800, top=150, left=200")
    }
  
    //조회 날짜 - 종료일(dend)를 항상 오늘로 설정하는 함수
    window.onload = function() {
      today = new Date();
  
      console.log("today.toISOString() >>>" + today.toISOString());
      today = today.toISOString().slice(0, 10);
      
      console.log("today >>>> " + today);
      tod = document.getElementById("dend");
      tod.value = today;
    }
  
    //글자수 counting 함수
    function counter(){
      document.getElementById("counting").innerHTML = document.getElementById("txt").value.length;
    }
  
  
  
  
    //입고 추가 폼 실행함수
    function addin(){
    window.open("./inandout_add.jsp", "입고 등록", "width=500, height=800, top=150, left=200")
    }
  
    //부서 선택창 띄우기
    function openChild()
      { 
          window.name = "부서 선택창";
          openWin = window.open("bom_add(dept).jsp",
                  "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
      }
      // 부서
      function setParentText(a){
      opener.document.getElementById("dept").value = a;
      window.close();
      }




      //<리스트 삭제, 수정 등록 함수>


      //에러 리스트 삭제 확인하는 함수
      //자바스크립트에서 확인하는 방법
      // alert(e_id);
      //var url = "error_delete_action.jsp?e_id="+e_id;
      //alert(url);

      function error_delete(e_id){ //함수 안에 변수가 있어야함
        if (confirm("해당 리스트를 정말로 삭제하시겠습니까?")) {
          document.location.href="error_delete_action.jsp?e_id="+e_id; //페이지를 넘기는 방법
        } else {
          // 취소(아니오) 버튼 클릭 시 팝업창 닫기
        }
        
        }
        

      //에러정보 수정 실행함수
      function error_update(){ //아이디로 정보 불러와서 수정 페이지 만들기
        window.open("./error_update.jsp", "에러정보 수정창", "width=600, height=500, top=150, left=200")
      }


      //에러 리스트 추가하는 함수
      function add_error(){ 
          window.open("./error_register.jsp", "에러등록창", "width=600, height=800, top=150, left=200" )
          } 

      
      //제품 찾는 페이지로 이동하기
      function find_product(){
        window.open("../product.jsp", "등록 제품 찾기", "width=600, height=800, top=150, left=200" )
      }




