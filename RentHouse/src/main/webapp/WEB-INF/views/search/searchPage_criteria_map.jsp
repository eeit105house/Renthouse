<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->

<title>租你幸福~*</title>
</head>
<body>
	<c:forEach var='objectlist' items="${Objectlists}">
		<div id="sitebody">
			<div id="sidebar_left">
				<img id="img" src="<c:url value='/getPicture/${objectlist[0]}' />" />
			</div>
			<div id="sidebar_right">
				<span class="font-25R">&nbsp;${objectlist[9]}&nbsp;元&nbsp;/&nbsp;月</span>
			</div>
			<div id="content" style="width:auto">
				<span class="font-22B">${objectlist[1]}</span><br> <span
					class="font-16B">${objectlist[2]}&nbsp;&nbsp;|&nbsp;&nbsp;${objectlist[3]}坪&nbsp;&nbsp;|&nbsp;&nbsp;樓層:${objectlist[4]}/${objectlist[5]}</span><br>
				<span class="font-16B">${objectlist[6]}&nbsp;-&nbsp;${objectlist[7]}</span>
				<br> <span class="font-16B">屋主&nbsp;${objectlist[8]}&nbsp;&nbsp;/&nbsp;&nbsp;${objectlist[10]}</span>
			</div>

		</div>

	</c:forEach>

	<hr>
</body>
</html>