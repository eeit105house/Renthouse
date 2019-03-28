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
<div style="text-align:left;border-top:3px solid #FF4500; "><span class="font-22B">共找到</span><span class="font-25R">${number}</span><span class="font-22B">間房屋</span></div>
	<c:forEach var='newList' varStatus="check" items="${NewList}">
		<div class="sitebody" id="${newList[13]}" onclick='window.open("${pageContext.request.contextPath}/houseView/${newList[13]}")'
	style="line-height: 40px;border-bottom: 0.5px solid #9d9d9d;width: 900px;font-size: 13px;">
			<div class="sidebar_left"  style="width: 250px;height: 170px;text-align: left;line-height: 20px;float: left;">
				<img id="img" src="<c:url value='/getPicture/${newList[0]}' />" />
			</div>
			<div id="sidebar_right" style="width: 170px;height: 170px;text-align: right;line-height: 150px;float: right;">
				<span class="font-25R">&nbsp;${newList[9]}&nbsp;元&nbsp;/&nbsp;月</span>
			</div>
			<div id="content" style="margin-left: 60px;margin-right: 60px;height: 170px;text-align: left;line-height: 40px;">
				<span class="font-22B">${newList[1]}</span><br> <span
					class="font-16B">${newList[2]}&nbsp;&nbsp;|&nbsp;&nbsp;${newList[3]}坪&nbsp;&nbsp;|&nbsp;&nbsp;樓層:${newList[4]}/${newList[5]}</span><br>
				<span class="font-16B">${newList[6]}&nbsp;-&nbsp;${newList[7]}</span>
				<br> <span class="font-16B">屋主&nbsp;${newList[8]}&nbsp;&nbsp;/&nbsp;&nbsp;${newList[10]}</span>
			</div>

		</div>
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
	<script>
	$("div.sitebody").mouseenter(function() {
		$(this).css("background-color","#DCDCDC")
	});
	$("div.sitebody").mouseleave(function() {
		$(this).css("background-color","#F8F8FF")
	});
$("div span.page-link").click(function(){
	var page= $(this).attr("id");
	$(".start").empty();
	if(page == 1){
		if(sessionStorage.getItem("clearList") != null){
			var Searchcriteria= sessionStorage.getItem("clearList");
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{"Searchcriteria":Searchcriteria},
				type:"Get",
				cache:"false",
				success:function(data){
						$(".start").html(data);
				}
			});
		}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".start").html(data);
			}
		});
		}
	}else{
		if(sessionStorage.getItem("clearList") != null){
			var Searchcriteria= sessionStorage.getItem("clearList");
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria_page",
				type:"Get",
				data:{"page":page,"Searchcriteria":Searchcriteria},
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
	}
});
</script>

</body>
</html>