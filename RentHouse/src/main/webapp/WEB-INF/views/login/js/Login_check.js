$(document).ready(function() {
	var count =0;
	var login_Ok=false;
	$("#Login_check").click(function() {
		var Account = $("#inputAccount").val();
		var Password = $("#inputPassword").val();
		if(Account==""||Password==""){
			count++;
			$("#error_js").text("帳號或密碼錯誤，最多輸入五次請注意，以輸入"+count+"次");
		}else{
			login_Ok=true;
			count = 0;
		}
		if(count>4){
			$("#Login_check").prop("disabled",true);
		}
	});
	$("#housemaster").click(function(){
		$("#inputAccount").val("RENTMASTER22");
		$("#inputPassword").val("password1234");
		});
	$("#housecustomer").click(function(){
    	$("#inputAccount").val("CUSTOMER123");
    	$("#inputPassword").val("password1234");
    	});
	$("#forgetpwd").click(function(){
		$("#forgetpwdacc").val("CUSTOMER123");
		$("#forgetpwdemail").val("password1234");
	});
});