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
<link href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/RHstaticresource/css/retina.css" rel="stylesheet" />
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
<link rel="shortcut icon" href="img/hicon.svg" />
<!-- end: Favicon and Touch Icons -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container-fluid-full">
		<div class="row-fluid">
	<%@ include file="menu.jsp" %>	
				<div id="content" class="span10">		
			<div class="row-fluid">
			<div class="box box-success"><!--span-->
					<div class="box-header">
						<h2><i class="icon-list"></i>檢舉內容</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
						</div>
					</div>			
					<div class="box-content">
					<div class="tooltip-demo well">				
						  <h3>檢舉人帳號:</h3>
						  <p>${olist[4] }</p>
						  <h3>類型:</h3>
						  <p>${olist[7] }</p>
						  <h3>時間:</h3>
						  <p>${olist[6] }</p>
						  <h3>原由:</h3>
						  <p>${olist[5] }</p>    
						  </div>       
					</div>
				</div><!--/span-->
				
					<div class="box"><!--span-->
					<div class="box-header">
						<h2><i class="icon-font"></i><span class="break"></span>檢舉文章</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						  <div class="row-fluid">            
							  <div class="well">
							  <div class="page-header">
								<h3>文章ID:</h3>
								<p>${olist[0] }</p>
								<h3>標題:</h3>
								<p>${olist[1] }</p>
								<h3>分類:</h3>
								<p>${olist[3] }</p>
								</div>
								<h3>內文:</h3>
								<p>${olist[2] }</p>
							  </div>
							 
						  </div><!--/row -->                           						 
					  </div>
				</div><!--/span-->
			</div>		

			<!-- 											通過審核 -->
											<button type="button" class="btn btn-large btn-round  btn-success"
												data-toggle="modal" data-target="#checkpass">
												<i class=" icon-ok"></i>
											</button> <!-- 動態視窗 -->
											<div class="modal fade" id="checkpass"
												tabindex="-1" role="dialog"
												aria-labelledby="hello" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h5 class="modal-title" id="hello">是否要通過審核?</h5>
														</div>
														<div class="modal-footer">
															<a href="<spring:url value='/backstage/pass/${olist[8] }' />"
																class="btn btn-primary">確認</a>
															<button type="button" class="btn" data-dismiss="modal">取消</button>
														</div>
													</div>
												</div>
											</div> <!-- /動態視窗 -->
											
<!-- 											下架文章 -->
											<button type="button" class="btn btn-large btn-danger"
												data-toggle="modal" data-target="#checkfail">
												<i class=" icon-remove"></i>
											</button> <!-- 動態視窗 -->
											<div class="modal fade" id="checkfail"
												tabindex="-1" role="dialog"
												aria-labelledby="hi" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h5 class="modal-title" id="hi">是否要下架商品?</h5>
														</div>
														<div class="modal-footer">
															<a href="<spring:url value='/backstage/fail/${olist[8] }' />"
																class="btn btn-primary">確認</a>
															<button type="button" class="btn" data-dismiss="modal">取消</button>
														</div>
													</div>
												</div>
											</div> <!-- /動態視窗 -->
										<a class="btn btn-large btn-primary" href="<spring:url value='/backstage/writingsReview' />">返回</a>	
																							
			</div>
</div>
</div>
	<!-- start: JavaScript-->
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