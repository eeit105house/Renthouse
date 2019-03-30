<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>租你幸福 - 會員中心</title>
<link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>

<style type="text/css">
	table{
		
		border-Width:7px 2px;
		border-style:solid;
		border-corol:#99ccff;
		text-align:center;
	}
	td{
		border:1px dotted #696969;
		
	}
	th{
		border-Width:7px 5px;
		
	}

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
        <h1 class="mt-4">預約資訊審核(房東)</h1>
        <table width="800" border="1">
　			<tr>
　				<th>預約編號</th>
				<th>房屋編號</th>
 				<th>預約時間</th>
 				<th>預約人</th>
 				<th>預約狀態</th>
 				<th>審核</th>
 				<th>出席</th>
　			</tr>
		<tbody>
			<c:forEach var="res" items="${reservations }">
			<c:forEach var="house" items="${res.value }">
			<tr>
				<td>${house.id }</td>
				<td>${house.houseBean.id }</td>
				<td>${house.datetime }</td>
				<td >${house.memberBean.id }</td>
				<td>${house.confirm }</td>
				<td>
				
				<form:form method='POST' >
					<input  id="houseid" name="houseid" type="hidden" value="${house.id }"/>
					<input  id="memberId" name="memberId" type="hidden" value="${memberId }"/>	
					<button type="submit" >預約確認</button>
				</form:form>
				</td>
				<td>
				<button><a href="<spring:url value='/MemberCheckUpDate/lookedHouse/${house.id }/${memberId }' />">出席確認</a></button>
				</td>
			</tr>
			</c:forEach>
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
  <input type="hidden" id="herenow" value="reservationCheck"/> 
</body>
</html>