<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個人</title>
<style type="text/css">
</style>
</head>
<body style="background-color: #ffebd7;">
<div style="height: 75px;">
<%@include file="narbar.jsp"%>
</div>
<div>
<h1 class="container">親愛的 ${user.name} 您好</h1>
<div class="d-flex container" id="wrapper">
    <!-- Sidebar -->
    <%@include file="membermenu.jsp"%>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
      </nav>
<!-- 		內容 -->
      <div class="container-fluid" style="width: 800px;">
        <h1 class="mt-4">會員資料修改</h1>
     <form:form class="form-signin " action="updataMember" method="post" modelAttribute="member" commandName="member" enctype="multipart/form-data">
<!--圖片 -->
		<div style="float: right; width: 400px;">
			<div class="text-center" style="height: 100px ;">
				<img id="showImg2" src="<c:url value='/showMemberPic'/>" alt="" style="height: 100px ;width: 100px"/>
			</div>
			<div class="text-center">
			<label class="btn btn-info" style="width: 150px; height: 50px;">更換頭像
			<input  type="file" name="memberimg" id="pic2" style=" opacity:0; "/></label>
			</div>
			</div>
<!--帳號 -->
<div style="float: left; width: 300px;">
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i id="Acc_i2" class="fa fa-user"></i> </span>
		 </div>
        <label>${user.id}</label>
    </div>
<!--密碼 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i id="Pwd_i2" class="fa fa-lock"></i> </span></div>
        <form:input path="pwd" name="Pwd" id="Pwd2" class="form-control" required="required" placeholder="密碼*混合英數 8-12字" type="password"/>
    </div> 
<!--重複密碼 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-key" id="rePwd_i2"></i></span>
		</div>
        <input name="rePwd" id="rePwd2" class="form-control" required="required" placeholder="重複確定密碼" type="password">
    </div> 
<!--會員姓名   --> 
        <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-grin-alt" id="inputname_i2"></i></span>
		</div>
        <form:input path="name" name="inputname" id="inputname2" class="form-control" required="required" placeholder="您的大名/Name" type="text"/>
    </div>      
    <!--電話 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fa fa-phone" id="phone_i2"></i> </span>
		</div>
    	<form:input path="phone" name="phone" id="phone2" class="form-control" required="required" placeholder="市話/手機" type="text"/>
    </div>           
    <div class="form-group">
    <input type="submit"  class="btn btn-primary btn-block" id="create2" value="確定修改資料"/>
    <input type="submit"  class="btn btn-primary btn-block" id="notyet2" disabled="disabled" value="欲修改資料不正確"/>
    </div>   
    </div> 
<%--     <form:input type="hidden" id="active" name="active" path='active' value="未開通" />   --%>
<%--     <form:input type="hidden" id="score" name="score" path='score' />   --%>
<%--     <form:input type="hidden" id="report" name="report" path='report' />   --%>
            </form:form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  </div>
</body>
</html>