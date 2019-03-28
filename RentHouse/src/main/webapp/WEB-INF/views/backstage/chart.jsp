<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<!-- start: Meta -->
<meta charset="utf-8" />
<title>統計圖表</title>
<meta name="description"
	content="SimpliQ - Flat & Responsive Bootstrap Admin Template." />
<meta name="author" content="Łukasz Holeczek" />
<meta name="keyword"
	content="SimpliQ, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina" />
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link
	href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/RHstaticresource/css/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/RHstaticresource/css/style-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/RHstaticresource/css/retina.css"
	rel="stylesheet" />
<!-- end: CSS -->
<!-- start: Favicon and Touch Icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/RHstaticresource/ico/housse.jpg" />
<!-- end: Favicon and Touch Icons -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container-fluid-full">
		<div class="row-fluid">
			<%@ include file="menu.jsp"%>
			<!-- start: Content -->
			<div id="content" class="span10">
		<!-- 			========================以下是今年的成交資訊=========================== -->
					<div class="row-fluid">		
				<div class="span3 smallstat box mobileHalf" ontablet="span6" ondesktop="span3">
					<div class="boxchart-overlay red">
						<div class="boxchart">1,2,6,4,0,8,2,4,5,3,1,7,5</div>
					</div>	
					<span class="title">總成交量</span>
					<span class="value">${map.amount }  件</span>
				</div>									
				<div class="span3 smallstat mobileHalf box" ontablet="span6" ondesktop="span3">
					<i class="icon-money yellow"></i>
					<span class="title">總成交金額</span>
					<span class="value">$${map.item }</span>
				</div>
			
			</div>
					<div class="row-fluid">
					<h1>${map.year }年每月成交比例</h1>
					<div class="main-chart">
						<div class="bar">
							<div class="title">JAN</div>
							<div class="value">${month2018.get(1)[0]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">FEB</div>
							<div class="value">${month2018.get(1)[1]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">MAR</div>
							<div class="value">${month2018.get(1)[2]}%</div>
						</div>

						<div class="bar">
							<div class="title">APR</div>
							<div class="value">${month2018.get(1)[3]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">MAY</div>
							<div class="value">${month2018.get(1)[4]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">JUN</div>
							<div class="value">${month2018.get(1)[5]}%</div>
						</div>

						<div class="bar">
							<div class="title">JUL</div>
							<div class="value">${month2018.get(1)[6]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">AUG</div>
							<div class="value">${month2018.get(1)[7]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">SEP</div>
							<div class="value">${month2018.get(1)[8]}%</div>
						</div>

						<div class="bar">
							<div class="title">OCT</div>
							<div class="value">${month2018.get(1)[9]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">NOV</div>
							<div class="value">${month2018.get(1)[10]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">DEC</div>
							<div class="value">${month2018.get(1)[11]}%</div>
						</div>
					</div>
				</div>
<!-- 				================以下是去年的成交資訊==================== -->
			<div class="row-fluid">		
				<div class="span3 smallstat box mobileHalf" ontablet="span6" ondesktop="span3">
					<div class="boxchart-overlay red">
						<div class="boxchart">1,2,6,4,0,8,2,4,5,3,1,7,5</div>
					</div>	
					<span class="title">總成交量</span>
					<span class="value">${map.amountlast }  件</span>
				</div>									
				<div class="span3 smallstat mobileHalf box" ontablet="span6" ondesktop="span3">
					<i class="icon-money yellow"></i>
					<span class="title">總成交金額</span>
					<span class="value">$${map.itemlast }</span>
				</div>
			
			</div>
				<div class="row-fluid">
					<h1>${map.lastyear }年每月成交比例</h1>
					<div class="main-chart">

						<div class="bar">
							<div class="title">JAN</div>
							<div class="value">${month2018.get(0)[0]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">FEB</div>
							<div class="value">${month2018.get(0)[1]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">MAR</div>
							<div class="value">${month2018.get(0)[2]}%</div>
						</div>

						<div class="bar">
							<div class="title">APR</div>
							<div class="value">${month2018.get(0)[3]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">MAY</div>
							<div class="value">${month2018.get(0)[4]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">JUN</div>
							<div class="value">${month2018.get(0)[5]}%</div>
						</div>

						<div class="bar">
							<div class="title">JUL</div>
							<div class="value">${month2018.get(0)[6]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">AUG</div>
							<div class="value">${month2018.get(0)[7]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">SEP</div>
							<div class="value">${month2018.get(0)[8]}%</div>
						</div>

						<div class="bar">
							<div class="title">OCT</div>
							<div class="value">${month2018.get(0)[9]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">NOV</div>
							<div class="value">${month2018.get(0)[10]}%</div>
						</div>

						<div class="bar simple">
							<div class="title">DEC</div>
							<div class="value">${month2018.get(0)[11]}%</div>
						</div>
						</div>
					</div>
			</div>
			<!-- 			end: Content -->

		</div>
		<!--/fluid-row-->
		<%@ include file="footer.jsp"%>
	</div>
	<!--/.fluid-container-->


	<!-- start: JavaScript-->
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.ui.touch-punch.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/modernizr.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.cookie.js"></script>
	<script
		src='${pageContext.request.contextPath}/RHstaticresource/js/fullcalendar.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/RHstaticresource/js/jquery.dataTables.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/excanvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.time.js"></script>

	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.chosen.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.uniform.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.cleditor.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.noty.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.elfinder.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.raty.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.iphone.toggle.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.uploadify-3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.gritter.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.imagesloaded.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.masonry.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.knob.modified.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/counter.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/raphael.2.1.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/justgage.1.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.autosize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/retina.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.placeholder.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/wizard.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/core.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/charts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/RHstaticresource/js/custom.min.js"></script>
	<!-- end: JavaScript-->

</body>
</html>