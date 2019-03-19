<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title></title>
</head>

<body>
	<table>
		<thead>
			<tr>
				<th>上架中房屋一覽</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var='house' items='${houseList}'>
				<tr>
					<td>${house.detailBean.title}</td>
					<td><a href='<c:url value="/houseView/${house.detailBean.id}" />'>檢視</a></td>
					<td><a href='<c:url value="/houseRefactDet/${house.detailBean.id}" />'>修改詳細</a></td>
					<td><a href='<c:url value="/houseRefactPic/${house.detailBean.id}" />'>修改圖片</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>