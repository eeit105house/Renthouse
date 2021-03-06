<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- jquery -->
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/login/css/bootstrap.css" rel="stylesheet">
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> 
<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- 日期用 -->
<script src="${pageContext.request.contextPath}/login/js/date.js"></script>
<!-- 登入彈跳視窗 -->
<script src="${pageContext.request.contextPath}/login/js/bootstrap.bundle.min.js"></script>
<!-- 彈跳錯誤視窗 與地址有衝突-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/site.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/site.js"></script>
<!--地址用 擺後面-->
<script src="${pageContext.request.contextPath}/login/js/Address.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".lightbox").lightbox();
	if("${user.id}"==""){
		$("#hello").hide();
		$("#signIn").show();
		$("#signOut").hide();
		$("#Registered").show();
	}else{
		$("#hello").show();
		$("#signIn").hide();
		$("#signOut").show();
		$("#Registered").hide();
	};
	if("${errorMsg.errorAccPwd}"!=""){
		$("#errormsg").text("${errorMsg.errorAccPwd}");
		$('.lightbox').click();};
	if("${errorMsg.personIdUsed}"!=""){
		$("#errormsg").text("${errorMsg.personIdUsed}");
	$('.lightbox').click();};
	if("${errorMsg.mailUsed}"!=""){
		$("#errormsg").text("${errorMsg.mailUsed}");
	$('.lightbox').click();	};
	if("${errorMsg.idUsed}"!=""){
		$("#errormsg").text("${errorMsg.idUsed}");
	$('.lightbox').click();};
	if("${create.createOk}"!=""){
		$("#errormsg").text("${create.createOk}");
		$('.lightbox').click();};
	if("${create.signin}"!=""){
		$("#errormsg").text("${create.signin}");
		$('.lightbox').click();};
});
//參考：https://developers.google.com/identity/sign-in/web/disconnect
function GoogleSignOut() {
var auth12 = gapi.auth2.getAuthInstance();
auth12.disconnect().then(function () {
console.log('User disconnect.'); 
	});
	session.invalidate();
}
</script>
<title>導覽</title>
</head>
<body >            
<nav class="navbar navbar-light bg-light navbar-expand-lg static-top navbar-fixed-top" style="border-bottom:1px solid black; ">
    <div class="container" style="margin: 0;padding: 0;">
      <a class="navbar-brand"  href="${pageContext.request.contextPath}"><img style="height: 60px" alt="租你幸福" src="<c:url value='/login/img/logo.png'/>"></a>
      <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
       <li class="nav-item"><a class="btn btn-nav-primary" href="search/searchPage_sessionStorage">想要租屋</a></li>
      <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/insertPicPage'/>">測試用</a></li>
      <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/membercontrol/${user.id}'/>">會員中心</a></li>
      </ul>
      </div>
      <div>
      <a class="btn btn-primary"  data-toggle="modal" data-target="#exampleModalCenter" id="signIn" href="#">登入</a>
 
      <a class="btn btn-primary" onclick="GoogleSignOut();" id="signOut" href="<c:url value='/signOut'/>" >登出</a>

      <a class="btn btn-primary" id="Registered" data-toggle="modal" data-target="#registered" href="#">註冊</a>
      
    </div>
    </div>
    
    <div style="padding-left: 20px;">
    <a id="hello" name="hello" href="<c:url value='/membercontrol/${user.id}'/>" style="font-family: 標楷體; font-size: 25px; color: silver;float: right;">
    <img style="width: 50px; height: 50px" src="<c:url value='/showMemberPic'/>" title="${user.name}"/>
    ${user.name}</a>
	</div>
    </nav>
<!--   登入 -->
<%-- <%@include file="Login_plustar.jsp" %> --%>
<!--  <!-- 註冊 -->  -->
<%-- <%@include file="Registered_plustar.jsp" %> --%>

<a href="#hidden_content" class="lightbox" ></a>

<div id="hidden_content" style="display: none ;">
	<div class="inline_content"style="width: 400px; height: 200px;">
		<h2 id="errormsg" style="text-align: center; padding-top: 20%;"></h2>
	</div>
</div>
</body>
</html>