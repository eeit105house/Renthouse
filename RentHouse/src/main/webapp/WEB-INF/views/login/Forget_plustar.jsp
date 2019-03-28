<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="Forgetindex_windows" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">忘記密碼</h5>
        <div class="row" style="width: 240px; margin-left: 60px;">
        
          	  <div class="btn btn-primary col-md-5" id="forgetpwd"style="margin-left: 10px;">一鍵帶入</div>
 				
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
            <h5 class="card-title text-center">找回密碼</h5>
            <form class="form-signin" action="<spring:url value='/forgetpwd'/>" method="POST">
              <div class="form-label-group">
                <input  type="text" name="forgetpwdacc" id="forgetpwdacc" class="form-control" placeholder="輸入帳號" required="required"/>
                <label for="forgetpwdacc"><i class="fa fa-user"></i>　帳號</label>
              </div>
              <div class="form-label-group">
                <input  type="email" name="forgetpwdemail" id="forgetpwdemail" class="form-control" placeholder="輸入信箱" required="required"/>
                <label for="forgetpwdemail"><i class="fa fa-envelope"></i>　信箱</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="forget">找回密碼</button>
              <hr class="my-4">
              </form>
<!--               <button class="btn btn-lg btn-google btn-block text-uppercase" id="googlesign" onclick="GoogleSignIn();"><i class='fab fa-google mr-2'></i>Sign in with Google</button> -->
<!--               <button type="submit" class="btn btn-lg btn-facebook btn-block text-uppercase"><i class="fab fa-facebook-f mr-2"></i>Sign in with Facebook</button> -->

          		
          		<hr/>
<!--           		<button class="btn btn-lg btn-google btn-block text-uppercase g-signin2"><i class='fab fa-google mr-2' data-onsuccess="GoogleSignIn"></i>Sign in with Google</button> -->
<!--           		<input type="text" id="hiddengoogle" name="hiddengoogle"/> -->


   
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