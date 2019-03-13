<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- start: Meta -->
<meta charset="utf-8" />
<title>商品審核</title>
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
<link href="RHstaticresource/css/bootstrap.min.css" rel="stylesheet" />
<link href="RHstaticresource/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="RHstaticresource/css/style.min.css" rel="stylesheet" />
<link href="RHstaticresource/css/style-responsive.min.css" rel="stylesheet" />
<link href="RHstaticresource/css/retina.css" rel="stylesheet" />
<!-- end: CSS -->
<!-- start: Favicon and Touch Icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="RHstaticresource/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="RHstaticresource/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="RHstaticresource/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="RHstaticresource/ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="img/hicon.svg" />
<!-- end: Favicon and Touch Icons -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<%@ include file="header.jsp" %>
		<div class="container-fluid-full">
		<div class="row-fluid">
	<%@ include file="menu.jsp" %>	
	<!-- start: Content -->
			<div id="content" class="span10">
<div class="box span12">
					<div class="box-header" data-original-title="">
						<h2><i class="icon-user"></i><span class="break"></span>待審中</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>帳號</th>
								  <th>地址</th>
								  <th>地區</th>
								  <th>狀態</th>
								  <th>操作</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <c:forEach var="house" items="${hlist }">
							<tr>
								<td>${house[0] }</td>
								<td class="center">${house[1] }</td>
								<td class="center">${house[2] }</td>
								<td class="center">
									<span class="label label-success">${house[3] }</span>
								</td>
								<td class="center">
									<a class="btn btn-info" href="#"> <i
											class=" icon-eye-open"></i>
									</a> <a class="btn btn-success" onclick="update()" href="update/${house[4] }"> <i
											class="icon-ok"></i>
									</a> <a class="btn btn-danger" onclick="deletehouse()" href="delete/${house[4] }"> <i
											class=" icon-remove"></i>
									</a></td>
							</c:forEach>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->			
			</div>
<!-- 			end: Content -->
				
			</div><!--/fluid-row-->

<%@ include file="footer.jsp" %>
	<!-- start: JavaScript-->
		<script src="RHstaticresource/js/jquery-1.10.2.min.js"></script>
	<script src="RHstaticresource/js/jquery-migrate-1.2.1.min.js"></script>	
		<script src="RHstaticresource/js/jquery-ui-1.10.3.custom.min.js"></script>	
		<script src="RHstaticresource/js/jquery.ui.touch-punch.js"></script>	
		<script src="RHstaticresource/js/modernizr.js"></script>	
		<script src="RHstaticresource/js/bootstrap.min.js"></script>	
		<script src="RHstaticresource/js/jquery.cookie.js"></script>	
		<script src='RHstaticresource/js/fullcalendar.min.js'></script>	
		<script src='RHstaticresource/js/jquery.dataTables.min.js'></script>
		<script src="RHstaticresource/js/excanvas.js"></script>
	<script src="RHstaticresource/js/jquery.flot.js"></script>
	<script src="RHstaticresource/js/jquery.flot.pie.js"></script>
	<script src="RHstaticresource/js/jquery.flot.stack.js"></script>
	<script src="RHstaticresource/js/jquery.flot.resize.min.js"></script>
	<script src="RHstaticresource/js/jquery.flot.time.js"></script>
		
		<script src="RHstaticresource/js/jquery.chosen.min.js"></script>	
		<script src="RHstaticresource/js/jquery.uniform.min.js"></script>		
		<script src="RHstaticresource/js/jquery.cleditor.min.js"></script>	
		<script src="RHstaticresource/js/jquery.noty.js"></script>	
		<script src="RHstaticresource/js/jquery.elfinder.min.js"></script>	
		<script src="RHstaticresource/js/jquery.raty.min.js"></script>	
		<script src="RHstaticresource/js/jquery.iphone.toggle.js"></script>	
		<script src="RHstaticresource/js/jquery.uploadify-3.1.min.js"></script>	
		<script src="RHstaticresource/js/jquery.gritter.min.js"></script>	
		<script src="RHstaticresource/js/jquery.imagesloaded.js"></script>	
		<script src="RHstaticresource/js/jquery.masonry.min.js"></script>	
		<script src="RHstaticresource/js/jquery.knob.modified.js"></script>	
		<script src="RHstaticresource/js/jquery.sparkline.min.js"></script>	
		<script src="RHstaticresource/js/counter.min.js"></script>	
		<script src="RHstaticresource/js/raphael.2.1.0.min.js"></script>
	<script src="RHstaticresource/js/justgage.1.0.1.min.js"></script>	
		<script src="RHstaticresource/js/jquery.autosize.min.js"></script>	
		<script src="RHstaticresource/js/retina.js"></script>
		<script src="RHstaticresource/js/jquery.placeholder.min.js"></script>
		<script src="RHstaticresource/js/wizard.min.js"></script>
		<script src="RHstaticresource/js/core.min.js"></script>	
		<script src="RHstaticresource/js/charts.min.js"></script>	
		<script src="RHstaticresource/js/custom.min.js"></script>
	<!-- end: JavaScript-->
	<script type="text/javascript">
	function update(){
		alert("商品已上架");
	};
	function deletehouse(){
		alert("審核未通過，商品下架");
	};
	</script>
</body>
</html>