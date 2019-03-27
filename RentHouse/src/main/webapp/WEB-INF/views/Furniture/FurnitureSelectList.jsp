<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>家具一覽</title>
    <!-- jquery -->
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
	<!-- KICKSTART -->
    <style type="text/css">
    </style>
    
</head>

<body style="background-color: #ffebd7;">
    <div style="height: 75px;">
        <%@include file="../login/narbar.jsp"%>
    </div>
    <div>
<%--         <h1 class="container">親愛的 ${user.name} 您好</h1> --%>
        <div class="d-flex container" id="wrapper">
            <!-- Sidebar -->
<!--             <div class="bg-light border-right" id="sidebar-wrapper"> -->
<!--                 <div class="sidebar-heading list-group-item bg-warning">會員中心</div> -->
<!--                 <div class="list-group list-group-flush"> -->
<%--                     <a href="<c:url value='/membercontrol/${user.id}'/>" --%>
<!--                         class="list-group-item list-group-item-action bg-light">&gt;&gt;會員資料修改</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Events</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Status</a> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

<!--                 <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom"> -->
<!--                     <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--                     </div> -->
<!--                 </nav> -->
                <!-- 		內容 -->
                <div class="container-fluid" style="width: 800px;">
                    <h1 class="mt-4"></h1>
                    <div>
                      <form method="post" action="${pageContext.request.contextPath}/furnitureViewByType">
	                    	<c:forEach var="type" items="${typeList}">
	                    		<input class="a" type="checkbox" name="typesN" id="${type}" value="${type}" onclick="getCBValue('types')" display="none">
	                    		<label for="${type}">${type}</label>
	                    	</c:forEach>
	                    	<input type="hidden" name="types" id="types">
	                    	
	                    	<input type="submit" class="button " value="查詢">
	                    </form> 
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>標題</th>
                                <th>種類</th>
                                <th>價格</th>
                                <th>照片</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${furnitureList != null}">
                        	<c:forEach var="furniture" items="${furnitureList}">
                       		 	<tr>
                        			<td><a href='<c:url value="/furnitureView/${furniture.id}"/>'>${furniture.title}</a></td>
                        			<td>${furniture.type}</td>
                        			<td>${furniture.price}元</td>
                        			<td><img alt="X" src='<c:url value="/furnitureView/fuPic/${furniture.id}"/>' height="100px"></td>
                        		</tr>
                        	</c:forEach>
                        	</c:if>
                        	<c:if test="${furnitureMap != null}">
	                        	<c:forEach var="type" items="${typeList}">
<%-- 	                        	<tr><td>${furnitureMap[type]}</td></tr> --%>
	                       		 	<c:forEach var="furniture" items="${furnitureMap[type]}">
			           		      		 	<tr>
			                        			<td><a href='<c:url value="/furnitureView/${furniture.id}"/>'>${furniture.title}</a></td>
			                        			<td>${furniture.type}</td>
			                        			<td>${furniture.price}元</td>
			                        			<td><img alt="X" src='<c:url value="/furnitureView/fuPic/${furniture.id}"/>' height="100px"></td>
			                        		</tr>
	                       		 	</c:forEach>
	                        	</c:forEach>
                        	</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
    </div>
        	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
	<!-- KICKSTART -->
<script>
	
	function getCBValue(cbName) {
		// alert(cbName);
		// var array_value = $('input:checkbox:checked[name="applianceN"]').map(function() { return $(this).val(); }).get();
		var array_value = $('input:checkbox:checked[name="' + cbName + 'N"]').map(function () { return $(this).val(); }).get();
		var one_value = "";
		// alert(array_value.length);
		for (var i = 0; i < array_value.length; i++) {
			// alert(one_value+";"+i);
			if (i == 0)
				one_value = one_value + array_value[i];
			else
				one_value = one_value + ';' + array_value[i];
			// alert(array_value[i]);
		}
		// $('input[name="appliance"]').val(one_value);
		$('[name="' + cbName + '"]').val(one_value);
		// alert(Appliance);
		
// 		$.ajax({
// 			url:"${pageContext.request.contextPath}/furnitureViewByType",
// 			data:{type:$("#typeSelect").val()},
// 			type:"Post",
// 			cache:false,
// 			success:function(data){$(document).html(data)}
// 		});
	}
</script>
</body>

</html>