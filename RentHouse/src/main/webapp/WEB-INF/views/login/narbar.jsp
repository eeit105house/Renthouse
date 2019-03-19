<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap -->
<link href="login/css/bootstrap.css" rel="stylesheet">
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> 
<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- 日期用 -->
<script src="login/js/date.js"></script>
<!-- 登入彈跳視窗 -->
  <script src="login/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
    <div>
      <a class="navbar-brand"  href="${pageContext.request.contextPath}"><img style="height: 70px" alt="租你幸福" src="login/img/logo.png"></a>
      </div>
      <div>
      <a class="btn btn-primary" href="#">想要租屋</a>
      <a class="btn btn-primary" href="insertPicPage">想要照片</a>
      </div>
      <div>
      <a class="btn btn-primary"  data-toggle="modal" data-target="#exampleModalCenter" id="signIn" href="#">登入</a>
 
      <a class="btn btn-primary" onclick="GoogleSignOut();" id="signOut" href="signOut" >登出</a>

      <a class="btn btn-primary" id="Registered" data-toggle="modal" data-target="#registered" href="#">註冊</a>
      
    </div>
    </div>
    
    
    <a id="hello" name="hello" href="member/${user.name}">
    <img style="width: 50px; height: 50px" src="<c:url value='showMemberPic'/>" title="${user.name}"/>
    ${user.name}</a>
    </nav>
    <!--   登入 -->
<%@include file="Login_plustar.jsp" %>
 <!-- 註冊 --> 
<%@include file="Registered_plustar.jsp" %>



<script type="text/javascript">
$(document).ready(function(){
	if("${user.id}"==null || "${user.id}"==""){
		$("#hello").hide();
		$("#signIn").show();
		$("#signOut").hide();
		$("#Registered").show();
	}else{
		$("#hello").show();
		$("#signIn").hide();
		$("#signOut").show();
		$("#Registered").hide();
	}
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


</body>
</html>