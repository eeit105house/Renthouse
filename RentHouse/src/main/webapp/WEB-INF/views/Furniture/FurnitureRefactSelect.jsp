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

<body>

	<div id="header">
	</div>
	<!-- end #header -->
	<div id="menu">

	</div>
	<!-- end #menu -->
	<div id="content">
		<div>
			<div class="post">
				<table>
					<thead>
						<tr>
							<th>
								<h2>您的家具一覽</h2>
							</th>
						</tr>
						<tr>
							<th>標題</th>
							<th>狀態</th>
							<th></th>
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
										href='<c:url value="/furnitureRefact/${furniture.id}" />'>修改詳細</a></td>
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
					</tbody>
				</table>
			</div>
		</div>
		<!-- end #posts -->
		<div id="links">
		</div>
		<!-- end #links -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end #content -->
	<div id="footer">
		<!-- <p id="legal">Copyright &copy; Logistix. Designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>
				</p> -->
	</div>
	<!-- end #footer -->
</body>

</html>