<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>


	

	<script src="${pageContext.request.contextPath}/HouseResorce/Formstone-master/js/site.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/Formstone-master/css/site.css" media="all" />
<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
	<!-- KICKSTART -->
	<!-- house模板CSS	 -->
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet"
		type="text/css" />
	<meta charset="UTF-8">
	<title>您的家具</title>
	<link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>

	<script>
// 		$(document).ready(function () {
// 			$("#cc").click(function(){
// 				$.lightbox("close")
// 			});

// 		});
		Formstone.Ready(function(){
			  $("#DontPost").lightbox({
			  });
		});
	</script>
</head>

<body style="background-color: #ffebd7;">
    <div style="height: 75px;">
        <%@include file="../login/narbar.jsp"%>
    </div>
    <div>
        <h1 class="container">親愛的 ${user.name} 您好</h1>
        <div class="d-flex container" id="wrapper">
            <!-- Sidebar -->
            <%@include file="../login/membermenu.jsp"%>

            <!-- <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading list-group-item bg-warning">會員中心</div>
                <div class="list-group list-group-flush">
                    <a href="<c:url value='/membercontrol/${user.id}'/>"
                        class="list-group-item list-group-item-action bg-light">&gt;&gt;會員資料修改</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
                </div>
            </div> -->
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    </div>
                </nav>
                <!-- 		內容 -->
                <div class="container-fluid" style="width: 800px;">
                    <h1 class="mt-4"></h1>
                    <table>
					<thead>
						<tr>
							<th>
								<h2>您的家具一覽</h2>
							</th>
							<th>
								
							</th>
						</tr>
						<tr>
							<th>標題</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='furniture' items='${furnitureList}'>
							<tr>
								<td>${furniture.title}</td>
								<td>${furniture.status}</td>
								<td><a class="button orange"
										href='<c:url value="/furnitureView/${furniture.id}" />'>檢視</a></td>
								<td><a class="button orange"
										href='<c:url value="/membercontrol/furnitureRefact/${furniture.id}" />'>修改詳細</a></td>
								<td>
									<c:if test="${furniture.status == '上架' || furniture.status == '審核'}">
										<!-- <input type="button" id="Down" class="button red" value="主動下架">
										<input type="hidden" id="DontPost"
											value='<c:url value="/houseDontPost/${house.id}" />'> -->
										<a id="DontPost" class="button red" href="#hidden_content">主動下架</a>
										<div id="hidden_content" style="display: none;">
											<div class="inline_content" style="width: 350px; height: 200px;">
												<h4>請確認是否確定下架?</h4>
												<a class="button red" href='<c:url value="/furnitureDontPost/${furniture.id}" />'>是的，我要下架</a>
												<a class=" button green" id="cc" onclick="$.lightbox('close');">不是，繼續刊登</a>
											</div>
										</div>
									</c:if>
									<c:if test="${furniture.status == '下架'}">
										<a id="RePost" class="button green"
											href='<c:url value="/furnitureRePost/${furniture.id}" />'>重新上架</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td><a class="button orange" href='<c:url value="/newFurniture" />'>點我新增</a></td>
						</tr>
					</tbody>
				</table>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
    </div>
    		<input type="hidden" id="herenow" value="fuSelect">
    
</body>

</html>