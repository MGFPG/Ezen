<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">

   <title>MENU</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

  <style>
    .bd-navbar {
      position: sticky;
      top: 0;
      z-index: 1071;
      min-height: 4rem;
      box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
    }
    .bd-sidebar {
      position: sticky;
      top: 4rem;
      z-index: 1000;
      height: calc(100vh - 4rem);
      background: #eee;
      border-right: 1px solid rgba(0,0,0,.1);
      overflow-y: auto;
      min-width: 160px;
      max-width: 220px;
    }
    .bd-sidebar .nav {
      display: block;
    }
    .bd-sidebar .nav>li>a {
      display: block;
      padding: .25rem 1.5rem;
      font-size: 90%;
    }
    </style>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    
    <header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active"><a class="nav-link" href="#">홈</a></li>
          <li class="nav-item"><a class="nav-link" href="#">메뉴</a></li>
          <li class="nav-item"><a class="nav-link" href="#">환경설정</a></li>
        </ul>
      </div>
    </header>
  
    <div class="container-fluid">
      <div class="row flex-nowrap">
        <div class="col-3 bd-sidebar">
          <ul class="nav">
            <li><a>Side 1</a></li>
            <li><a>Side 2</a></li>
            <li><a>Side 3</a></li>
            <li><a>Side 4</a></li>
            <li><a>Side 5</a></li>
            <li><a>Side 6</a></li>
            <li><a>Side 7</a></li>
            <li><a>Side 8</a></li>
          </ul>
          <br>
        </div>
        <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
          <h1>Main 1</h1>
          <h1>Main 2</h1>
          <h1>Main 3</h1>
          <h1>Main 4</h1>
          <h1>Main 5</h1>
          <h1>Main 6</h1>
          <h1>Main 7</h1>
          <h1>Main 8</h1>
        </main>
      </div>
    </div>

</body>
</html>