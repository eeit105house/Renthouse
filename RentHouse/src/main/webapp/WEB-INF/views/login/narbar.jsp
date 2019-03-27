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
<!-- 登入彈跳視窗 -->
<script src="${pageContext.request.contextPath}/login/js/bootstrap.bundle.min.js"></script>
<!-- 彈跳錯誤視窗 與地址有衝突-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/site.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/site.js"></script>
<!--地址用 擺後面-->
<script src="${pageContext.request.contextPath}/login/js/Address.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.js"></script>
<!-- 註冊登入 -->
<script src="${pageContext.request.contextPath}/login/js/Registered_check.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/login/js/Login_check.js" type="text/javascript"></script>
<style>

 		.alarm {
                position: relative;
                 width: 60px; 
                height: 60px;
                margin: 0px;
            }
            .alarm img {
                width: 50px;
                height: 50px;
            }
 		.divright {
                position: absolute;
                color: white;
                font-size: 17px;
                background-color: red;
                width: 23px;
                height: 23px;
                line-height:23px;
                left: 80%;
                top: -8px;
                text-align: center;
                -webkit-border-radius: 24px;
                border-radius: 24px;
            }
</style>


<script type="text/javascript">
$(document).ready(function(){
	$(".lightbox").lightbox();
	if("${user.id}"==""){
		$("#hello").hide();
		$("#signIn").show();
		$("#signOut").hide();
		$("#Registered").show();
		$("#Forgetindex").show();
	}else{
		$("#hello").show();
		$("#signIn").hide();
		$("#signOut").show();
		$("#Registered").hide();
		$("#Forgetindex").hide();
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
	if("${activeOk.active}"!=""){
		$("#errormsg").text("${activeOk.active}");
		$('.lightbox').click();};
	if("${create.reactive}"!=""){
		$("#errormsg").text("${create.reactive}");
		$('.lightbox').click();};
});

$("#signOut").click(
//參考：https://developers.google.com/identity/sign-in/web/disconnect
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  });
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
      <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/newHouse/house'/>">我要出租</a></li>
      <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/membercontrol/${user.id}'/>">會員中心</a></li>
      <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/ForumView'/>">討論區</a></li>
      </ul>
      </div>
      <div>
      <a class="btn btn-primary"  data-toggle="modal" data-target="#exampleModalCenter" id="signIn" href="#">登入</a>
 
      <a class="btn btn-primary" onclick="signOut();" id="signOut" href="<c:url value='/signOut'/>" >登出</a>

      <a class="btn btn-primary" id="Registered" data-toggle="modal" data-target="#registered" href="#">註冊</a>
     
      <a class="btn btn-primary" id="Forgetindex" data-toggle="modal" data-target="#Forgetindex_windows" href="#">忘記密碼</a>
      
    </div>
    </div>

   
   
    <div class="alarm">
    <a id="hello" name="hello" href="<c:url value='/membercontrol/${user.id}'/>">
    <img class="rounded-circle" src="<c:url value='/showMemberPic'/>" title="${user.name}"/>
    <c:if test="${allmsg.size()!=0 }">
    <span class="divright">${allmsg.size() }</span>
    </c:if>
    </a>
	</div>
	<a href="<c:url value='/membercontrol/${user.id}'/>">${user.name}</a>
	
    </nav>

<c:if test="${user==null}">
<!-- 日期用 -->
<script src="${pageContext.request.contextPath}/login/js/date.js"></script>
<!--   登入 -->
<%@include file="Login_plustar.jsp" %>
 <!-- 註冊 --> 
<%@include file="Registered_plustar.jsp" %> 
<!-- 忘記密碼 --> 
<%@include file="Forget_plustar.jsp" %>
</c:if>

<a href="#hidden_content" class="lightbox" ></a>

<div id="hidden_content" style="display: none ;">
	<div class="inline_content"style="width: 400px; height: 200px;">
		<h2 id="errormsg" style="text-align: center; padding-top: 20%;"></h2>
	</div>
</div>
</body>
</html>