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

<title>Insert title here</title>
</head>
<body>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
  
    <div class="carousel-item active" data-interval="2000">
     <c:forEach var="list" items="${Newlist0}">
    	<div class="perDivIncarousel" id="${list[13]}" onclick='window.open("${pageContext.request.contextPath}/houseView/${list[13]}")'>
    	<img class = "perImgIncarousel" src="<c:url value='/getPicture/${list[0]}' />">
    	<div><span>${list[1]}</span></div>
		<div>
		<span class = "perSpanIncarousel" >${list[6]}</span>
		<span class = "perSpanIncarousel" >${list[2]}</span>
		<span class = "perSpanIncarousel" >${list[3]}坪</span>
		</div>  
    	<div>&nbsp;${list[9]}&nbsp;元&nbsp;/&nbsp;月</div>   
    	</div>
    </c:forEach>   
    </div>
<%-- <c:forEach var='i' begin='1' end="${carPage-1}"> --%>
    <div class="carousel-item" data-interval="2000">
	<c:forEach var ="list" items="${Newlist1}">
  <div class="perDivIncarousel" id="${list[13]}" onclick='location.href="${pageContext.request.contextPath}/houseView/${list[13]}"'>
    	<img class = "perImgIncarousel" src="<c:url value='/getPicture/${list[0]}' />">
    	<div><span>${list[1]}</span></div>
		<div>
		<span class = "perSpanIncarousel" >${list[6]}</span>
		<span class = "perSpanIncarousel" >${list[2]}</span>
		<span class = "perSpanIncarousel" >${list[3]}坪</span>
		</div>  
    	<div>&nbsp;${list[9]}&nbsp;元&nbsp;/&nbsp;月</div>   
    	</div>
    </c:forEach> 
    </div>
<%--     </c:forEach> --%>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</body>
</html>