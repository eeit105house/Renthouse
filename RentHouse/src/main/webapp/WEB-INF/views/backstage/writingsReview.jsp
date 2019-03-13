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
<link rel="shortcut icon" href="RHstaticresource/ico/favicon.png" />
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
						<h2><i class="icon-user"></i><span class="break"></span>Members</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="icon-wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>Username</th>
								  <th>Date registered</th>
								  <th>Role</th>
								  <th>Status</th>
								  <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
							<tr>
								<td>Anton Phunihel</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>  
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Alphonse Ivo</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>  
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Thancmar Theophanes</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>  
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
								
							</tr>
							<tr>
								<td>Walerian Khwaja</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Clemens Janko</td>
								<td class="center">2012/02/01</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Chidubem Gottlob</td>
								<td class="center">2012/02/01</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Hristofor Sergio</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Tadhg Griogair</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Pollux Beaumont</td>
								<td class="center">2012/01/21</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Adam Alister</td>
								<td class="center">2012/01/21</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Carlito Roffe</td>
								<td class="center">2012/08/23</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Sana Amrin</td>
								<td class="center">2012/08/23</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Adinah Ralph</td>
								<td class="center">2012/06/01</td>
								<td class="center">Admin</td>
								<td class="center">
									<span class="label">Inactive</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Dederick Mihail</td>
								<td class="center">2012/06/01</td>
								<td class="center">Admin</td>
								<td class="center">
									<span class="label">Inactive</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
									</a>
								</td>
							</tr>
							<tr>
								<td>Hipólito András</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Fricis Arieh</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Scottie Maximilian</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Bao Gaspar</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Tullio Luka</td>
								<td class="center">2012/02/01</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Felice Arseniy</td>
								<td class="center">2012/02/01</td>
								<td class="center">Admin</td>
								<td class="center">
									<span class="label">Inactive</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Finlay Alf</td>
								<td class="center">2012/02/01</td>
								<td class="center">Admin</td>
								<td class="center">
									<span class="label">Inactive</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Theophilus Nala</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Sullivan Robert</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Kristóf Filiberto</td>
								<td class="center">2012/01/21</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Kuzma Edvard</td>
								<td class="center">2012/01/21</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Bünyamin Kasper</td>
								<td class="center">2012/08/23</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Crofton Arran</td>
								<td class="center">2012/08/23</td>
								<td class="center">Staff</td>
								<td class="center">
									<span class="label label-important">Banned</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Bernhard Shelah</td>
								<td class="center">2012/06/01</td>
								<td class="center">Admin</td>
								<td class="center">
									<span class="label">Inactive</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Grahame Miodrag</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Innokentiy Celio</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 
										
									</a>
								</td>
							</tr>
							<tr>
								<td>Kostandin Warinhari</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 

									</a>
								</td>
							</tr>
							<tr>
								<td>Ajith Hristijan</td>
								<td class="center">2012/03/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-warning">Pending</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in "></i>                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit "></i>                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash "></i> 										
									</a>
								</td>
							</tr>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->			
			</div><!--/row-->			
			</div>
<!-- 			end: Content -->
				
			</div><!--/fluid-row-->
			</div><!--/.fluid-container-->

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
	
</body>
</html>