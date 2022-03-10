<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My HomePage</title>
<link rel="icon" type="image/x-icon" href="img/favicon.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link href="css/styles.css" rel="stylesheet" />
<script href="script/script.js"></script>
</head>
<body>

<header class="masthead d-flex align-items-center">
            <div class="container px-4 px-lg-5 text-center">
                <h1 class="mb-1">Hello My WebSite</h1><br>
                <a class="btn btn-primary btn-xl" href="#BookMark">다음 페이지</a>
	    <a class="btn btn-primary btn-xl" href="login.jsp">로그인</a>
	    <a class="btn btn-primary btn-xl" href="JoinForm.jsp">회원가입</a>
            </div>
        </header>

 <section class="callout">
            <div class="container px-4 px-lg-5 text-center">
                <h2 class="mx-auto mb-5">
                    Welcome to
                    <em>your</em>
                    next Profile!
                </h2>
                <a class="btn btn-primary btn-xl" href="profile/profile.html">Profile을 눌러주세요!</a>
            </div>
        </section>

 <section class="content-section" id="BookMark">
            <div class="container px-4 px-lg-5">
	<div class="text-center">
                    <h1>북마크</h1>
                </div>
                <div class="row gx-0">
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="https://www.melon.com/">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h1">Melon</div>
                                    <p class="mb-0">일상 속에서 빠질 수 없는 음악</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio-1.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="https://www.google.com">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h1">Google</div>
                                    <p class="mb-0">Search the world's information</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio-2.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="https://page.kakao.com/main">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h1">Kakaopage</div>
                                    <p class="mb-0">세상 모든 이야기를 담다</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio-3.jpg" alt="..." />
                        </a>
                    </div>
	
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="https://www.youtube.com/">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h1">Youtude</div>
                                    <p class="mb-0">Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio-4.jpg" alt="..." />
                        </a>
                    </div>
                </div>
            </div>
        </section>


  
<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

<script src="js/script.js"></script>
</body>
</html>
