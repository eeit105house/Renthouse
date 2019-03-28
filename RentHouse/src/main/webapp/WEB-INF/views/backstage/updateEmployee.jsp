<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<!-- start: Meta -->
<meta charset="utf-8" />
<title>員工資料更新</title>
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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/RHstaticresource/ico/housse.jpg" />
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
 				<div class="row-fluid">
				<div class="box span12">
					<div class="box-header">
						<h2><i class="icon-edit"></i>編輯員工資料</h2>
						<div class="box-icon">
							<a href="#" class="btn-close"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form:form class="form-horizontal" enctype="multipart/form-data" modelAttribute="upemployee" onsubmit="return checkform()">
						  <fieldset>
<!-- 						  <div class="control-group"> -->
<!-- 								<label class="control-label" for="disabledInput">員工帳號:</label> -->
<!-- 								<div class="controls"> -->
<!-- 								  <input class="form-control" id="disabledInput" type="text" placeholder="這裡放員工ID" disabled="true" /> -->
<!-- 								</div> -->
<!-- 							  </div> -->
							  <div class="control-group">
								     		<label class="control-label">員工帳號:</label>
											<div class="controls">
												<span class="input-xlarge uneditable-input">${employee.id }</span>
												<form:hidden path="id" value="${employee.id }"/>
											</div>
										</div>
							<div class="control-group">
							  <label class="control-label" for="typeahead">姓名: </label>
							  <div class="controls">
								<form:input path="name" type="text" class="span6 typeahead" id="typeahead" value="${employee.name }" required="true"/>								
							  </div>
							</div>
<!-- 							密碼未驗證 -->
							<div class="control-group">
							  <label class="control-label" for="pwd">密碼: </label>
							  <div class="controls">
								<form:input path="pwd" type="password"  class="span6 typeahead" id="pwd" value="${param.pwd}" required="true"/>								
							  	<p class="help-block text-danger" id="checkpwdup" ></p>
							  </div>  
							</div><div class="control-group">
							  <label class="control-label" for="pwdcheck">密碼確認: </label>
							  <div class="controls">
								<input type="password" name="pwdck" class="span6 typeahead" id="pwdcheck" value="${param.pwdck}" required="true"/>								
							  	<p class="help-block text-warning" id="checkpwdspan"></p>
							  </div>  
							</div>
							<div class="control-group">
							  <label class="control-label" for="fileInput">更改大頭貼:</label>
							  <div class="controls">
								<input class="input-file uniform_on" id="fileInput" type="file" accept="image/jpeg" name="eimg" />
							   	<p class="help-block text-danger">${error.fileerror }</p>							 
							  </div>
							</div>          
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">送出</button>
							  <button type="reset" class="btn">取消</button>
							</div>
						  </fieldset>
						</form:form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->
			</div>
<!-- 			end: Content -->			
			</div><!--/fluid-row-->
			<%@ include file="footer.jsp" %>
			</div><!--/.fluid-container-->

<script type="text/javascript">
function checkform(){
	$("#checkpwdup").html("");
	$("#checkpwdspan").html("");	
	var patrn = /^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z0-9]{6,16}$/;
	if(!patrn.test($("#pwd").val())){
		$("#checkpwdup").html("須中英混和6-16位數");
		return false;
	}
	else if($("#pwd").val()!=$("#pwdcheck").val()){
		$("#checkpwdspan").html("密碼需相同");	
		return false;
	}
	
}
</script>

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