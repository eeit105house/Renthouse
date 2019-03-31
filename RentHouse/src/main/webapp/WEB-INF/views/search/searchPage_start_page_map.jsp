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
	<c:forEach var='newList' varStatus="check" items="${NewList}">
				<div class="sitebody" id="${newList[13]}" onclick='window.open("${pageContext.request.contextPath}/houseView/${newList[13]}")'
			style="line-height:10px;border-bottom: 0.5px solid #9d9d9d;border-top: 0.5px solid #9d9d9d;width: 100%">
			<div class="sidebar_left" style="width: 120px;height: 80px;text-align: left;line-height: 20px;float: left;">
				<img id="img" src="<c:url value='/getPicture/${newList[0]}' />" />
			</div>
			<div id="sidebar_right" style="width: 120px;height: 80px;text-align: right;line-height: 150px;float: right;">
				<span class="font-25R">&nbsp;${newList[9]}&nbsp;元&nbsp;/&nbsp;月</span>
			</div>
			<div id="content" style="width:auto;margin-left:10px;margin-top:10px;height: 80px;text-align: left;line-height: 20px;">
				<span class="font-22B">${newList[1]}</span><br> <span
					class="font-16B">${newList[2]}&nbsp;&nbsp;|&nbsp;&nbsp;${newList[3]}坪&nbsp;&nbsp;|&nbsp;&nbsp;樓層:${newList[4]}/${newList[5]}</span><br>
				<span class="font-16B">${newList[6]}&nbsp;-&nbsp;${newList[7]}</span>
			</div>

		</div>	
	</c:forEach>
	<hr>
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

	<script>
	$("div.sitebody").mouseenter(function() {
		$(this).css("background-color","#F0FFF0")
	});
	$("div.sitebody").mouseleave(function() {
		$(this).css("background-color","#ffebd7")
	});
$("div span.page-link").click(function(){
	var page= $(this).attr("id");
	$(".start").empty();
	if(page == 1){
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start_map",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".start").html(data);
			}
		});
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start_page_map",
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