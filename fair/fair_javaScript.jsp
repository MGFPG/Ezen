  <!--공급가와 세금여부를 입력받으면 판매가를 계산하는 함수 현재 미사용-->
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
		window.open("./fair_add.jsp", "재고관리 추가", "width=500, height=800, top=150, left=200")
    }

  //수정 폼 실행함수
  function product_update(productid){
    window.open("./product_update.jsp?productid="+productid, "재고관리 수정", "width=500, height=800, top=150, left=200")
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

  //box수 계산 함수 >> 사용중
  function printbox()  {
    const a = document.getElementById('amount').value; 
    amount = Number(a);
    const c = document.getElementById('f_count').value;
    count = Number(c);
    box = count / amount;
  
    document.getElementById('f_box').value  = box;
    }

function printtaxn()  {
var notax = document.getElementById('sprice').value; 
document.getElementById('rprice').value  = notax;
}



  //입고 추가 폼 실행함수
  function addin(){
	window.open("./inandout_add.jsp", "입고 등록", "width=500, height=800, top=150, left=200")
  }

  //부서 선택창 띄우기 현재 미사용
  function openChild()
    { 
        window.name = "부서 선택창";
        openWin = window.open("bom_add(dept).jsp",
                "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
    }


    window.onload = function(){
      //제품 선택창
      document.getElementById("openProduct").onclick = function(){
        window.open("fair_add_1.jsp","","width=600px,height=400px,top=200px;");
        }
      //계획 선택창
      document.getElementById("openPlan").onclick = function(){
      window.open("fair_add_2.jsp","","width=800px,height=400px,top=200px;");
      }

      //설비 선택창
      document.getElementById("openMac").onclick = function(){
      window.open("fair_add_4.jsp","","width=800px,height=350px,top=200px;");
      }

      };

  function addcompo()
    { if(count !== null){
      
    }
        window.name = "부서 선택창";
        openWin = window.open("bom_add(dept).jsp",
                "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
    }


   </script>