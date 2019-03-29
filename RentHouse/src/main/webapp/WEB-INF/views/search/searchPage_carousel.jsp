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
<div id="carouselExampleControls" class="carousel slide" style="padding-left: 60px;" data-ride="carousel">
  <div class="carousel-inner">
  <div>
    <div class="carousel-item active" data-interval="1000" >
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
<!--     第二頁輪播 -->
<c:if test="${carPage >= 2 }">
    <div class="carousel-item" data-interval="1000">
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
   </c:if>
 <!--     第三頁輪播 -->
 <c:if test="${carPage >= 3 }">
    <div class="carousel-item" data-interval="1000">
	<c:forEach var ="list" items="${Newlist2}">
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
</c:if>    
   <!--     第四頁輪播 -->
    <c:if test="${carPage >= 4 }">
    <div class="carousel-item" data-interval="1000">
	<c:forEach var ="list" items="${Newlist3}">
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
    </c:if>    
    </div>

  </div>
  <a class="carousel-control-prev" style="float: left; width: 70px;" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" style="background-color:black;" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button"  style="float: right; width: 70px;" data-slide="next">
    <span class="carousel-control-next-icon"  style="background-color:black;" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  </div>
  
 <script>
 $("div.perDivIncarousel").mouseenter(function() {
		$(this).css("background-color","#DCDCDC")
	});
	$("div.perDivIncarousel").mouseleave(function() {
		$(this).css("background-color","#ffebd7")
	});
 </script>


</body>
</html>