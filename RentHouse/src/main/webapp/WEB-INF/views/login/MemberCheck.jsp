<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個人</title>
<style type="text/css">
</style>
</head>
<body style="background-color: #ffebd7;">
<div style="height: 75px;">
<%@include file="narbar.jsp"%>
</div>
<div>
<h1 class="container">親愛的 ${user.name} 您好</h1>
<div class="d-flex container" id="wrapper">
    <!-- Sidebar -->
    <%@include file="membermenu.jsp"%>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
      </nav>
<!-- 		內容 -->
      <div class="container-fluid" style="width: 800px;">
        <h1 class="mt-4">我的預約資訊(房客版)</h1>
        <table width="300" border="1">
　			<tr>
　				<td>預約編號</td>
				<td>房屋編號</td>
 				<td>預約時間</td>
 				<td>預約狀態</td>
 				<td>出席狀態</td>
　			</tr>
		<tbody>
			<c:forEach var="res" items="${reservations }">
			<tr>
				<td>${res.id }</td>
				<td>${res.houseBean.id }</td>
				<td>${res.datetime }</td>
				<td>${res.confirm }</td>
				<td>${res.status }</td>
				<td><a href="<spring:url value='/MemberCheckReservation/${memberId }' />"></a>							
			</c:forEach>
</tbody>
</table>
     
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  </div>
  <script type="text/javascript">
  $(document).ready(function(){
	 if("${user.active}"=="已驗證"){
		 $("#acti").hide();
	 }else{
		 $("#acti").show();
	 };
  });
  </script>
  <input type="hidden" id="herenow" value="reservationMemberCheck"/> 
</body>
</html>