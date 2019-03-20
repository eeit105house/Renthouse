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
	<c:forEach var='objectlist' varStatus="check" items="${Objectlists}">
		<c:if test="${check.count<6}">
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
				<span class="font-16B">${objectlist[6]}&nbsp;-&nbsp;${objectlist[7]}</span>
				<br> <span class="font-16B">屋主&nbsp;${objectlist[8]}&nbsp;&nbsp;/&nbsp;&nbsp;${objectlist[10]}</span>
			</div>

		</div>
</c:if>
	</c:forEach>
<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <c:forEach var ="i" begin="1" step = "1" end="${biggestPage}">
	    <li class="page-item"><span class="page-link" id = "${i}"> ${i}</span></li>
	    </c:forEach>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	<hr>
<script>
$("div span.page-link").click(function(){
	var page= $(this).attr("id");
	$(".start").empty();
	if(page == 1){
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".start").html(data);
			}
		});
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start_page",
			type:"Get",
			data:{"page":page},
			success:function(data){
				$(".start").html(data);
			}
		});
	}			
	
});
</script>
</body>
</html>