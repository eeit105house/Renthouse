<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- start: Meta -->
<meta charset="utf-8" />
<title>跳轉頁面</title>
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
<link href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/retina.css" rel="stylesheet" />
<!-- end: CSS -->

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

<!-- start: Favicon and Touch Icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/RHstaticresource/ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/RHstaticresource/ico/favicon.png" />
<!-- end: Favicon and Touch Icons -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	<div class="container">
		<div class="row-fluid">
				<div class="row-fluid">            				
				<div class="well" style="text-align:center">
		<h1 class="text"></h1>								 
				</div>
			  </div>
		  </div><!--/row --> 
		</div><!--/fluid-row-->
	<!-- start: JavaScript-->
	<script type="text/javascript">
	$(document).ready(function() {
		$(".text").html("更新資料成功，系統將於10秒後返回登入畫面，如果不跳轉，請<a href='<spring:url value='/backlogin/login'/>'>點選這裡</a>將直接進行跳轉")
		setTimeout(function() {					
			window.location.replace("<spring:url value='/backlogin/login'/>")},10000);
		});
	</script>
	
	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-migrate-1.2.1.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery-ui-1.10.3.custom.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.ui.touch-punch.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/modernizr.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/bootstrap.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.cookie.js"></script>	
		<script src='${pageContext.request.contextPath}/RHstaticresource/js/fullcalendar.min.js'></script>	
		<script src='${pageContext.request.contextPath}/RHstaticresource/js/jquery.dataTables.min.js'></script>
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/excanvas.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.resize.min.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.flot.time.js"></script>
		
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.chosen.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.uniform.min.js"></script>		
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.cleditor.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.noty.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.elfinder.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.raty.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.iphone.toggle.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.uploadify-3.1.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.gritter.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.imagesloaded.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.masonry.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.knob.modified.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.sparkline.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/counter.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/raphael.2.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/RHstaticresource/js/justgage.1.0.1.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.autosize.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/retina.js"></script>
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/jquery.placeholder.min.js"></script>
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/wizard.min.js"></script>
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/core.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/charts.min.js"></script>	
		<script src="${pageContext.request.contextPath}/RHstaticresource/js/custom.min.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>