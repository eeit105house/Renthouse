<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<style>
  .type{
      float: left;
     word-break: break-all;
  }
  .date{
      float:right;
      color:#AAAAAA;
  }
  .tit{
    background-color: ivory;
    padding-left: 20px;
    padding-right: 20px;
  }
  hr{
    clear: both;
  }
  .mcontent{
    margin-left: 40px;
  }
  .tcontent{
    margin-left: 30px;
    
  }
  .media{
    background-color: aliceblue;
    padding: 20px;
  }
   img{
    width: 150px;
    margin:0px;
  }
  </style>
</head>
<body style="background-color: #ffebd7;">
<div style="height: 75px;">
<%@include file="narbar.jsp"%>
</div>
<h1 class="container">親愛的 ${user.name} 您好</h1>
<div class="d-flex container" id="wrapper">
 <!-- Sidebar -->
    <%@include file="membermenu.jsp"%>
    <!-- /#sidebar-wrapper -->
<!--       <label for="title" class="col-sm-2 col-form-label">會員提問</label> -->
<!-- <hr> -->
<div class="container">
 <div class="tit">   
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: ivory">
          <li class=""><a href="<spring:url value='/membercontrol/memberservice/serviceform'/>">客服中心</a><span class="">&gt;</span></li>
          <li class="active" aria-current="page">回覆詳情</li><!--本業所在標籤-->
        </ol>
      </nav>   
        <div>
          <h5 class="type">主題:</h5><span class="tcontent">${mailDetail.type }</span>
          <span class="date">${mailDetail.datetime }</span><br/><br/>
          <h5 class="type">我的問題:</h5><span class="tcontent">${mailDetail.title }</span>
          <span class="date">來自:${mailDetail.memberBean.id }</span><br/>
        </div>
  <hr>
  <span>內容:</span><p class="mcontent">${strmap.content }</p>
</div>
<div class="media">
    <img src="${pageContext.request.contextPath}/login/img/service.png" class="mr-3" alt="大頭貼">
    <div class="media-body">
      <h5 class="mt-0">親愛的${user.name}您好~</h5>
      <p style=" word-break: break-all;">${strmap.reply }</p>  
  </div>
  </div>
  </div>
  </div>
  
  <script type="text/javascript">
</script>
</body>
</html>