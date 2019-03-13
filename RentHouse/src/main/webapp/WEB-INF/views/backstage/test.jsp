<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test 上架</title>
<style type="text/css">
table,tr,td{
border: 1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>
<h1>測試所有上架商品</h1>
<div>
<c:forEach var='product' items="${products }">
<table>
<tr>
<td>${product.addr }</td>
<td>${product.status }</td>
</tr>
</table>
</c:forEach>
</div>
</body>
</html>