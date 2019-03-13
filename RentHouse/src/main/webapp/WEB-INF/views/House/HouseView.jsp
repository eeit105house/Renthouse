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
<title>${detailBean.title}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
</head>
<body>
<div id="header">
	<h1>Logistix</h1>
	<h2>By TEMPLATED</h2>
</div>
<!-- end #header -->
<div id="menu">
	<ul>
		<li class="first"><a href="#" accesskey="1" title="">About Us</a></li>
		<li><a href="#" accesskey="2" title="">Our Services</a></li>
		<li><a href="#" accesskey="3" title="">Our Products</a></li>
		<li><a href="#" accesskey="4" title="">Customer Support</a></li>
		<li><a href="#" accesskey="5" title="">Contact Us</a></li>
	</ul>
</div>
<!-- end #menu -->
<div id="content">
	<div id="posts">
		<div class="post">
			<h2 class="title">${detailBean.title}</h2>
			<div class="story">
			 放圖片
			</div>
		</div>
		<div class="post">
			<h2 class="title">房屋簡介</h2>
			<div class="story">
				<p><strong>地址：</strong>${houseBean.city}${houseBean.boroughs}${houseBean.addr}</p>
				<blockquote>
					<p>${detailBean.info}</p>
				</blockquote>
				<h2>詳細資訊</h2>
				<p><strong>管理費：</strong>${detailBean.hoaFee}</p>
				<p><strong>押金：</strong>${detailBean.deposit}</p>
				
				<table class="striped">
					<thead>
						<tr>
							<th>提供設備：</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<c:forEach var='appliance' items='${applianceList}' >
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
							<c:forEach var='furniture' items='${furnitureList}' >
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
							<c:forEach var='leListOne' items='${leList}' >
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
							<c:forEach var='indetity' items='${indetityList}' >
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
				<h3>租金： ${detailBean.price} 元 / 月</h3>
				<table class="striped">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>租金包含：</td>
							<c:forEach var='include' items='${includeList}' >
								<td>${include}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<h3>屋主： ${fakeName}</h3>				
				<h3>電話： ${memberBean.phone}</h3>	
				<h3>可遷入日： ${movingInStr}</h3>	
				<h3>最短租期： ${detailBean.shortest}</h3>				
<!-- 				<ul> -->
<!-- 					<li><a href="#">February 2007</a> <i>(22)</i></li> -->
<!-- 					<li><a href="#">January 2007</a> <i>(31)</i></li> -->
<!-- 					<li><a href="#">December 2006</a> <i>(31)</i></li> -->
<!-- 					<li><a href="#">November 2006</a> <i>(30)</i></li> -->
<!-- 					<li><a href="#">October 2006</a> <i>(31)</i></li> -->
<!-- 				</ul> -->
			</li>
			<li>
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
			</li>
		</ul>
	</div>
	<!-- end #links -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end #content -->
<div id="footer">
	<p id="legal">Copyright &copy; Logistix. Designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a></p>
</div>
<!-- end #footer -->
</body>
</html>
