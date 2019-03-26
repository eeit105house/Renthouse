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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script async defer src="https://apis.google.com/js/api.js" onload="this.onload=function(){};HandleGoogleApiLibrary()"
        onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>
<script type="text/javascript">
//google signin
//進入 https://console.developers.google.com/，找「憑證」頁籤(記得先選對專案)，即可找到用戶端ID
	let Google_appId = "825814170132-9r69bbro6bbtg1ahvhsp5jeu07f52sd0.apps.googleusercontent.com";
//參考文章：http://usefulangle.com/post/55/google-login-javascript-api
// Called when Google Javascript API Javascript is loaded
    function HandleGoogleApiLibrary() {
        // Load "client" & "auth2" libraries
        gapi.load('client:auth2', {
            callback: function () {
                // Initialize client & auth libraries
                gapi.client.init({
                    clientId: Google_appId,
                    scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me'
                }).then(
                    function (success) {
                        // Google Libraries are initialized successfully
                        // You can now make API calls 
                        console.log("Google Libraries are initialized successfully");
                    },
                    function (error) {
                        // Error occurred
                        console.log(error);// to find the reason 
                    }
                );
            },
            onerror: function () {
                // Failed to load libraries
                console.log("Failed to load libraries");
            }
        });
    }
		function GoogleSignIn() {
		// API call for Google login  
        gapi.auth2.getAuthInstance().signIn().then(
            function (success) {
                // Login API call is successful 
                console.log(success);
                let Google_ID = success["El"];  
            },
            function (error) {
                // Error occurred
                // console.log(error) to find the reason
                console.log(error);
            }
        );
	}
 </script> 

</head>
<body>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">登入</h5>
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
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit" onclick="GoogleSignIn();"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
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