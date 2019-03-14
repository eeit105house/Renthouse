<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="login/Registered_check.js" type="text/javascript"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="registered" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">註冊</h5>
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
            <h5 class="card-title text-center">加入新會員</h5>
            <form class="form-signin " id="commentForm" action="" method="post">
              <!-- 	帳號 -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i id="Acc_i" class="fa fa-user"></i> </span>
		 </div>
        <input name="Acc" id="Acc" class="form-control required" required="required" placeholder="帳號" type="text">
    </div>
<!--     密碼 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i id="Pwd_i" class="fa fa-lock"></i> </span>
		</div>
        <input name="Pwd" id="Pwd" class="form-control required" placeholder="密碼" type="password">
    </div> 
<!--     重複密碼 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-key" id="rePwd_i"></i></span>
		</div>
        <input name="rePwd" id="rePwd" class="form-control required"   placeholder="重複確定密碼" type="password">
    </div> 
<!--     會員姓名   -->
        <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-grin-alt" id="inputname_i"></i></span>
		</div>
        <input name="inputname" id="inputname" class="form-control required" placeholder="大名" type="text">
    </div>
<!--     信箱 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fa fa-envelope" id="email_i"></i> </span>
		 </div>
        <input name="email" id="email" class="form-control required" placeholder="信箱" type="email">
    </div> 
<!--     電話 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fa fa-phone" id="phone_i"></i> </span>
		</div>
    	<input name="phone" id="phone" class="form-control required" placeholder="市話/手機" type="text">
    </div> 
<!--     身分證字號 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="far fa-id-card" id="identity_i"></i></span>
		</div>
    	<input name="identity" id="identity" class="form-control required" placeholder="身分證字號/國際護照" type="text">
    </div>      
<!--     生日 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
		</div>
<!--     	<input name="" id="" class="form-control" placeholder="出生年月日" type="text"  > -->
<!--     	<select class="custom-select" id="idSelectYear" style="max-width: 120px;"> -->
<!-- 		</select> -->
		 <select class="custom-select" name="birth_Year" id="birth_Year"></select><span style="font-family: 標楷體;">年</span>
         <select class="custom-select" name="birth_Month" id="birth_Month"></select><span style="font-family: 標楷體;">月</span>
         <select class="custom-select" name="birth_Date" id="birth_Date"></select><span style="font-family: 標楷體;">日</span>
    </div>    
<!--     性別 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
    	<span class="input-group-text"><i class="fas fa-venus-mars" id="gender_i"></i></span>
    	</div>
    	<select name="gender" id="gender" class="custom-select required" style="max-width: 120px;">
    		<option value="errorchoise" selected>請選擇</option>
		    <option value="male">男</option>
		    <option value="female">女</option>
		</select>
    	
    </div>             
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block" id="create" > 建立新會員  </button>
        <button type="submit" class="btn btn-primary btn-block" id="notyet" disabled="disabled" > 尚有資料未填寫  </button>
    </div> <!-- form-group// -->     

            </form>
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