<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/houselist.css'  type="text/css" />
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>

<form method ="get">
<div class="searchDiv">
	<input class="searchText" type = "text" placeholder="請輸入關鍵字(社區、街道等)"/>
	<button class="searchBut"><img src='${pageContext.request.contextPath}/images/search.PNG'	/></button>

</div>
</form>

	<hr>
<c:forEach var="houselist" items="${Houselists}">
<a href="<spring:url value='queryByType?type=${houselist}'/>">${houselist}</a>

</c:forEach>


<hr>
<!-- 	<div> -->
<!-- 		<p> -->
<!-- 			<button class="btn btn-primary" type="button" data-toggle="collapse" -->
<!-- 				data-target="#city" aria-expanded="false" aria-controls="city">縣市查詢</button> -->
<!-- 			<button class="btn btn-primary" type="button" data-toggle="collapse" -->
<!-- 				data-target="#boroughs" aria-expanded="false" -->
<!-- 				aria-controls="boroughs">行政區查詢</button> -->

<!-- 		</p> -->
<!-- 		<div class="collapse" id="city"> -->
<!-- 			<div class="card card-body">抓縣市資料</div> -->
<!-- 		</div> -->
<!-- 		<div class="collapse" id="boroughs"> -->
<!-- 			<div class="card card-body">抓行政區資料</div> -->
<!-- 		</div> -->

<!-- 	</div> -->

	<hr>

	<c:forEach var='objectlist' items="${Objectlists}">
		<div id="sitebody">
			<div id="sidebar_left">
				<img id="img" src="<c:url value='/getPicture/${objectlist[0]}' />" />
			</div>
			<div id="sidebar_right">
				<span class="font-25R">&nbsp;${objectlist[9]}&nbsp;元&nbsp;/&nbsp;月</span>
			</div>
			<div id="content">
				<span class="font-22B">${objectlist[1]}</span><br> <span
					class="font-16B">${objectlist[2]}&nbsp;&nbsp;|&nbsp;&nbsp;${objectlist[3]}坪&nbsp;&nbsp;|&nbsp;&nbsp;樓層:${objectlist[4]}/${objectlist[5]}</span><br>
				<span class="font-16B">${objectlist[6]}&nbsp;-&nbsp;${objectlist[7]}</span> <br>
				<span class="font-16B">屋主&nbsp;${objectlist[8]}&nbsp;&nbsp;/&nbsp;&nbsp;${objectlist[10]}</span>
			</div>

		</div>

	</c:forEach>

	<hr>

	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>