<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<!-- Google登入 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="825814170132-9r69bbro6bbtg1ahvhsp5jeu07f52sd0.apps.googleusercontent.com">
<script src="//apis.google.com/js/platform.js" async defer></script>

</head>
<body>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">登入</h5>
        <div class="row" style="width: 240px; margin-left: 60px;">
              <div class="btn btn-primary col-md-5" id="housemaster">房東帳號</div>
          	  <div class="btn btn-primary col-md-5" id="housecustomer"style="margin-left: 10px;">房客帳號</div>
 				</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
<!--       登入 -->
      <div class="modal-body">
<div class="container">
    <div class="row">
      <div class="mx-auto" style="width: 500px;">
        <div class="card card-signin my-6">
          <div class="card-body">
            <h5 class="card-title text-center">登入</h5>
            <form class="form-signin" action="<spring:url value='/loginMember'/>" method="POST">
              <div class="form-label-group">
                <input  type="text" name="inputAccount" id="inputAccount" class="form-control" placeholder="輸入帳號" required="required"/>
                <label for="inputAccount"><i class="fa fa-user"></i>　帳號</label>
              </div>
              <div class="form-label-group">
                <input  type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="輸入密碼" required="required"/>
                <label for="inputPassword"><i class="fa fa-lock"></i>　密碼</label>
              </div>
              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1" />
                <label class="custom-control-label" for="customCheck1">記住我的密碼</label>
                <span class="text-center badge badge-danger" id="error_js"></span>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="Login_check">登入</button>
              <hr class="my-4">
              </form>
<!--               <button class="btn btn-lg btn-google btn-block text-uppercase" id="googlesign" onclick="GoogleSignIn();"><i class='fab fa-google mr-2'></i>Sign in with Google</button> -->
<!--               <button type="submit" class="btn btn-lg btn-facebook btn-block text-uppercase"><i class="fab fa-facebook-f mr-2"></i>Sign in with Facebook</button> -->

          		<div class="g-signin2" data-onsuccess="GoogleSignIn" data-theme="dark" onclick="googlesigntest();" id="googlesigntest"></div>

          		<hr/>
<!--           		<button class="btn btn-lg btn-google btn-block text-uppercase g-signin2"><i class='fab fa-google mr-2' data-onsuccess="GoogleSignIn"></i>Sign in with Google</button> -->
<!--           		<input type="text" id="hiddengoogle" name="hiddengoogle"/> -->


    <script>
    $(document).ready(function(){
    	$("#housemaster").click(function(){
    		$("#inputAccount").val("RENTMASTER22");
    		$("#inputPassword").val("password1234");
    		});
    	$("#housecustomer").click(function(){
        	$("#inputAccount").val("CUSTOMER66");
        	$("#inputPassword").val("password1234");
        	});
    	$("#forgetpwd").click(function(){
    		$("#forgetpwdacc").val("CUSTOMER66");
    		$("#forgetpwdemail").val("iiieeit10598@gmail.com");
    	});
    });
	 var profile,id_token;
		var countt=0;
		
    function GoogleSignIn(googleUser) {
    	console.log("重整=="+countt);
    	// 客戶端如果有需要的話可以通過profile來獲取使用者資訊
           profile = googleUser.getBasicProfile();
          // 傳回後臺驗證，並獲取userid
           id_token = googleUser.getAuthResponse().id_token;
          console.log("ID Token: " + id_token);
          if(countt==1){
        	  $("#googlesigntest").click();
   
          };
        };
        function googlesigntest (){
//             alert("ab")

        	countt = countt+1;
        	var xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://eeit105house.southeastasia.cloudapp.azure.com:8080/RentHouse/googleVerify');
//             xhr.open('POST', 'http://localhost:8080/RentHouse/googleVerify');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
              console.log('Signed in as: ' + xhr.responseText);
            };
//             alert("aa")
            xhr.send('idtokenstr=' + id_token);
            if(countt==2){
            	$("#reflash").click();
            }
        };
    </script>
<a href="#" id="reflash" style="position: absolute; top: -9999px;left: -9999px;"onclick="javascript:window.location.reload()">重新整理</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
 </body> 
 </html> 