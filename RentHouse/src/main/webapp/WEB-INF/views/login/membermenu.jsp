<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>導覽</title>
</head>
<body >            
     <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading list-group-item bg-warning">會員中心</div>
      <div class="list-group list-group-flush">
        <a href="<c:url value='/membercontrol/${user.id}'/>" class="list-group-item list-group-item-action bg-light">&gt;&gt;會員資料修改</a>
        <a href="<spring:url value='/membercontrol/memberservice/${user.id}' />" class="list-group-item list-group-item-action bg-light">客服中心</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div>
</body>
</html>