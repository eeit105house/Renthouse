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
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="<spring:url value='/membercontrol/memberservice/${user.id }'/>">我要發問</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="<spring:url value='/membercontrol/cservicereport'/>">客服回覆</a>
  </li>
</ul>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">標題</th>
      <th scope="col">分類</th>
      <th scope="col">日期</th>
       <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="mail" items="${allmail }">
    <tr>
      <td>${mail.title }</td>
      <td>${mail.type }</td>
      <td>${mail.datetime }</td>
      <td>${mail.status }</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
  </div>
  </div>
    <input type="hidden" id="herenow" value="customer"/> 
</body>
</html>