<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License
-->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>${furnitureBean.title}</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet"
		type="text/css" />
	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>

	<!-- 幻燈片 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
		$(document).ready(function () {
			$('.slider').bxSlider();
		});
	</script>
</head>

<body>
	<div id="header">

	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
		</ul>
	</div>
	<!-- end #menu -->
	<div id="content">
		<div id="posts">
			<div class="post">
				<h1 class="title">${furnitureBean.title}</h1>
				<div class="story">
					<ul class="slider">
							<li><img src="<c:url value='fuPic/${furnitureBean.id}'/>" /></li>
					</ul>
				</div>
			</div>
			<div class="post">
				<h1 class="title">家具簡介</h1>
				<div class="story">
					<p><strong>類型：</strong>${furnitureBean.type}</p>
					<p><strong>地址：</strong>${furnitureBean.addr}</p>
					<p><strong>取貨方式：</strong>${furnitureBean.delvery}</p>

					<blockquote>
						<p>${furnitureInfo}</p>
					</blockquote>

				</div>
			</div>
		</div>
		<!-- end #posts -->
		<div id="links">
			<ul>
				<li>
					<ul>
						<li>
							<h1>價格： ${furnitureBean.price}元 </h1>
						</li>

					</ul>


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
	<div id="footer">
		<!-- <p id="legal">Copyright &copy; Logistix. Designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>
		</p> -->
	</div>
	<!-- end #footer -->
</body>

</html>