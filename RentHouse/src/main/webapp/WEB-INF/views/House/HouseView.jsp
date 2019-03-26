<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License
-->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>${detailBean.title}</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet"
		type="text/css" />
	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">		

	<!-- 幻燈片 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
	<script>
		$(document).ready(function () {
			$('.slider').bxSlider();
		});
	</script>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
<body style="background-color: #ffebd7;">
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>
	<div>
<%-- 		        <h1 class="container">親愛的 ${user.name} 您好</h1> --%>
		        <div class="d-flex container" id="wrapper">
		<!--             Sidebar -->
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
				<div id="content">
					<div id="posts">
						<div class="post">
							<h1 class="title">${detailBean.title}</h1>
							<div class="story">
								<ul class="slider">
									<c:forEach var='picId' items='${picIds}'>
										<li><img src="<c:url value='hPic/${picId}'/>" /></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="post">
							<h1 class="title">房屋簡介</h1>
							<div class="story">
								<p><strong>地址：</strong>${houseBean.city}${houseBean.boroughs}${houseBean.addr}</p>
								<p><strong>坪數：</strong>${houseBean.sqft}坪</p>
								<p><strong>建築型態：</strong>${houseBean.build}</p>
								<p><strong>住房類型：</strong>${houseBean.type}</p>
								<p><strong>所在樓層：</strong>${houseBean.floor}樓
									<strong>頂樓樓層：</strong>${houseBean.topFloor}樓</p>
								<p><strong>格局：</strong>${houseBean.layout}</p>

								<blockquote>
									<p>${houseInfo}</p>
								</blockquote>
								<h2>詳細資訊</h2>
								<p><strong>管理費：</strong>${detailBean.hoaFee}元</p>
								<p><strong>押金：</strong>${detailBean.deposit}元</p>

								<table class="striped">
									<thead>
										<tr>
											<th>提供設備：</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<c:forEach var='appliance' items='${applianceList}'>
												<td>${appliance}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
								<table class="striped">
									<thead>
										<tr>
											<th>提供家具：</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<c:forEach var='furniture' items='${furnitureList}'>
												<td>${furniture}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>

								<table class="striped">
									<thead>
										<tr>
											<th>生活機能：</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<c:forEach var='leListOne' items='${leList}'>
												<td>${leListOne}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
								<table class="striped">
									<thead>
										<tr>
											<th>身分限制：</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<c:forEach var='indetity' items='${indetityList}'>
												<td>${indetity}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
								<!-- 				<ul> -->
								<!-- 						<li>List item number one</li> -->
								<!-- 				</ul> -->
								<!-- 				<p>An ordered list example:</p> -->
								<!-- 				<ol> -->
								<!-- 					<li>List item number one</li> -->
								<!-- 					<li>List item number two</li> -->
								<!-- 					<li>List item number three</li> -->
								<!-- 				</ol> -->
							</div>
						</div>
					</div>
					<!-- end #posts -->
					<div id="links">
						<ul>
							<li>
								<ul>
									<li>
										<h1>租金： ${detailBean.price}元 /月</h1>
									</li>

									<h2>租金包含：</h2>
									<p>${includeList}</p>
									<c:if test="${user!=null}">
											<button class="open-button" onclick="openForm()">點我預約</button>
												    <div class="form-popup" id="myForm">
														  <form:form method='POST'  class='form-container'>
																<div>
																	<label for="time">預約時間</label>
																	<div>
																		<input id="time" name="time" type="datetime-local"/>
																	</div>
																</div>
<%-- 																<form:input path="status" id="status" type="hidden" value="未看"/> --%>
<%-- 																<form:input path="confirm" id="confirm" type="hidden" value="待確認"/>	 --%>
<%-- 																<form:input path="readStatus" id="readStatus" type="hidden" value="未讀"/>		 --%>
																<button type="submit" class="btn">reservation</button>
														    	<button type="button" class="btn cancel" onclick="closeForm()">close</button>
															</form:form>
														</div>
									</c:if>
									<%-- 						<c:forEach var='include' items='${includeList}'> --%>
									<%-- 								<td>${include}</td> --%>
									<%-- 						</c:forEach> --%>

								</ul>

								<table>
									<tr>
										<td>
											<h2>屋主： ${fakeName}</h2>
										</td>
									</tr>
									<tr>
										<td>
											<h2>電話： ${memberBean.phone}</h2>
										</td>
									</tr>
									<tr>
										<td>
											<h2>可遷入日： ${movingInStr}</h2>
										</td>
									</tr>
									<tr>
										<td>
											<h2>最短租期： ${detailBean.shortest}</h2>
										</td>
									</tr>
								</table>
								<!-- 				<ul> -->
								<!-- 					<li><a href="#">February 2007</a> <i>(22)</i></li> -->
								<!-- 					<li><a href="#">January 2007</a> <i>(31)</i></li> -->
								<!-- 					<li><a href="#">December 2006</a> <i>(31)</i></li> -->
								<!-- 					<li><a href="#">November 2006</a> <i>(30)</i></li> -->
								<!-- 					<li><a href="#">October 2006</a> <i>(31)</i></li> -->
								<!-- 				</ul> -->
							</li>
							<!-- <li>
					<h2>Lorem Ipsum Dolor</h2>
					<ul>
						<li><a href="#">Donec Dictum Metus</a></li>
						<li><a href="#">Etiam Rhoncus Volutpat</a></li>
						<li><a href="#">Integer Gravida Nibh</a></li>
						<li><a href="#">Maecenas Luctus Lectus</a></li>
						<li><a href="#">Mauris Vulputate Dolor Nibh</a></li>
						<li><a href="#">Nulla Luctus Eleifend</a></li>
						<li><a href="#">Posuere Augue Sit Nisl</a></li>
					</ul>
				</li> -->
						</ul>
					</div>
					<!-- end #links -->
					<div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
				<!-- 	<div id="footer"> -->
				<!-- 		<!-- <p id="legal">Copyright &copy; Logistix. Designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
				<!-- 		</p> -->
				<!-- 	</div> -->
				<!-- end #footer -->
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	    </div>
	    
	    

	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	
<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>
</body>

<!-- <body> -->
<!-- 	<div id="header"> -->

<!-- 	</div> -->
<!-- end #header -->
<!-- 	<div id="menu"> -->
<!-- 		<ul> -->
<!-- 			<li class="first"><a href="#" accesskey="1" title="">About Us</a></li> -->
<!-- 			<li><a href="#" accesskey="2" title="">Our Services</a></li> -->
<!-- 			<li><a href="#" accesskey="3" title="">Our Products</a></li> -->
<!-- 			<li><a href="#" accesskey="4" title="">Customer Support</a></li> -->
<!-- 			<li><a href="#" accesskey="5" title="">Contact Us</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- end #menu -->

<!-- </body> -->

</html>