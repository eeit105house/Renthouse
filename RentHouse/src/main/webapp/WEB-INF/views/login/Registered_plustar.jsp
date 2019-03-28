<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>  
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registered</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="registered" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">註冊</h5>
        <div class="btn btn-primary " id="onepass" style="margin-left: 20px;">一鍵帶入</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
<!--註冊 -->
<!-- form:form表單未用GET方法傳一member物件而報錯 -->
      <div class="modal-body">
<div class="container">
    <div class="row">
      <div class="mx-auto" style="width: 500px;">
        <div class="card card-signin my-6">
          <div class="card-body">
            <h5 class="card-title text-center">加入新會員</h5>
            <form:form class="form-signin " id="commentForm" action="insertMemberOk" method="post" modelAttribute="member" commandName="member" enctype="multipart/form-data">
<!--圖片 -->
			<div class="text-center" style="height: 100px ;">
				<img id="showImg" src="<c:url value='/login/img/PresetMember.png'/>" alt="" style="height: 100px ;width: 100px"/>
			</div>
			<div class="text-center">
			<label class="btn btn-info" style="width: 150px; height: 50px;">更換頭像
			<input  type="file" name="memberimg" id="pic" style=" opacity:0; "/></label>
			</div>
<!--帳號 -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i id="Acc_i" class="fa fa-user"></i> </span>
		 </div>
        <form:input path="id" name="Acc" id="Acc" class="form-control" required="required" placeholder="帳號 *第一個字大寫英文 混合英數 8-12字" type="text"/>
    </div>
<!--密碼 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i id="Pwd_i" class="fa fa-lock"></i> </span></div>
        <form:input path="pwd" name="Pwd" id="Pwd" class="form-control" required="required" placeholder="密碼*混合英數 8-12字" type="password"/>
    </div> 
<!--重複密碼 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-key" id="rePwd_i"></i></span>
		</div>
        <input name="rePwd" id="rePwd" class="form-control" required="required" placeholder="重複確定密碼" type="password">
    </div> 
<!--會員姓名   --> 
        <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-grin-alt" id="inputname_i"></i></span>
		</div>
        <form:input path="name" name="inputname" id="inputname" class="form-control" required="required" placeholder="您的大名/Name" type="text"/>
    </div>
<!--信箱 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fa fa-envelope" id="email_i"></i> </span>
		 </div>
        <form:input path="email" name="email" id="email" class="form-control" required="required" placeholder="Email信箱" type="email"/>
    </div> 
<!--電話 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fa fa-phone" id="phone_i"></i> </span>
		</div>
    	<form:input path="phone" name="phone" id="phone" class="form-control" required="required" placeholder="市話/手機" type="text"/>
    </div> 
<!--身分證字號 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="far fa-id-card" id="identity_i"></i></span>
		</div>
    	<form:input path="personID" name="identity" id="identity" class="form-control" required="required" placeholder="身分證字號/居留證" type="text"/>
    </div>      
<!--生日 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
		</div>
		 <select class="custom-select" name="birth_Year" id="birth_Year"></select><span style="font-family: 標楷體;">年</span>
         <select class="custom-select" name="birth_Month" id="birth_Month"></select><span style="font-family: 標楷體;">月</span>
         <select class="custom-select" name="birth_Date" id="birth_Date"></select><span style="font-family: 標楷體;">日</span>
         <form:input path="birthday" name="birthday" id="birthday" type="hidden" />
    </div>    
<!--性別 --> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
    	<span class="input-group-text"><i class="fas fa-venus-mars" id="gender_i"></i></span>
    	</div>
    	<select name="gender" id="gender" class="custom-select required" style="max-width: 120px;">
    		<option value="errorchoise" selected>請選擇</option>
		    <option value="male">男</option>
		    <option value="female">女</option>
		</select>
    	<form:input type="hidden" id="sex" name="sex" path='sex'/>
    </div>             
    <div class="form-group">
    <input type="submit"  class="btn btn-primary btn-block" id="create" value="建立新會員"/>
    <input type="submit"  class="btn btn-primary btn-block" id="notyet" disabled="disabled" value="尚有資料未填寫"/>
    </div>    
    <form:input type="hidden" id="active" name="active" path='active' value="未驗證" />  
<%--     <form:input type="hidden" id="score" name="score" path='score' />   --%>
<%--     <form:input type="hidden" id="report" name="report" path='report' />   --%>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
$("#onepass").click(function(){
	$("#Acc").val("customer123");
	$("#Pwd").val("password1234");
	$("#rePwd").val("password1234");
	$("#inputname").val("張學友");
	$("#email").val("iiieeit10598@gmail.com");
	$("#phone").val("0958957957");
	$("#identity").val("A125865252");
	$("#birth_Year").val("1998");
	$("#birth_Month").val("5");
	$("#birth_Date").val("20");
	$("#gender").val("male");
	$("#create").show();
	$("#notyet").hide();
	});</script>
</body>
</html>