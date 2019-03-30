<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>租你幸福~*</title>
</head>
<body>
<table width="300" border="1">
　<tr>
　	<td>房屋編號</td>
 	<td>預約時間</td>
 	<td>預約人</td>
 	<td>預約狀態</td>
 	<td>審核</td>
　</tr>
<tbody>
<c:forEach var="res" items="${reservations }">
	<c:forEach var="house" items="${res.value }">
<tr>
	<td>${house.id }</td>
	<td>${house.datetime }</td>
	<td >${house.memberBean.id }</td>
	<td>${house.confirm }</td>
	<td><a href="<spring:url value='/ReservationCheck/${memberId }' />"></a>
	<button ><a href='/ReservationCheck/update/${house.id }/${memberId }' />確認</a></button>
	</c:forEach>
	</c:forEach>
</tbody>
</table>
</body>
</html>