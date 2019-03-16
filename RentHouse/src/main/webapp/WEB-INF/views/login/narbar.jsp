<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap -->
<link href="login/css/bootstrap.css" rel="stylesheet">
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> 

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- 日期用 -->
<script src="login/js/date.js"></script>
<!-- 登入彈跳視窗 -->
  <script src="login/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
<!--     href #1 留著給主頁 -->
      <a class="navbar-brand" href="#1"><img style="height: 70px" alt="租你幸福" src="login/img/logo.png"></a>
<%--       <a class="btn btn-primary" href="${pageContext.request.contextPath}/search/searchPage_sessionStorage">想要租屋</a> --%>
       <a class="btn btn-primary" href="${pageContext.request.contextPath}/search/searchByMap">想要租屋</a>
      <a class="btn btn-primary"  data-toggle="modal" data-target="#exampleModalCenter" href="#">登入</a>
      <a class="btn btn-primary"  data-toggle="modal" data-target="#registered" href="#">註冊</a>
    </div>
    </nav>
</body>
</html>