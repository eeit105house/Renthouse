$(document).ready(function() {
	$(function(){
	    $("#commentForm").validate();
	});
	$('#Acc').on('keydown keyup keypress change focus blur',function(){
		var re = /^[a-zA-Z][a-zA-Z]{7,10}[0-9]{7,10}$/;
		var Acc_check = $(this).val();
			if($(this).val() != ""){
			  if(re.test(Acc_check)){
				  $("#Acc_i").css({"color": "green"});
			  }else{
				  $("#Acc_i").css({"color": "red"});
			  }
			}else{
				$("#Acc_i").css({"color": "red"});
		  }
		});
	$('#Pwd').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#Pwd_i").css({"color": "red"});
		  }else{
		    $("#Pwd_i").css({"color": "green"});
		  }
		});
	$('#rePwd').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#rePwd_i").css({"color": "red"});
		  }else{
		    $("#rePwd_i").css({"color": "green"});
		  }
		});
	$('#inputname').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#inputname_i").css({"color": "red"});
		  }else{
		    $("#inputname_i").css({"color": "green"});
		  }
		});
	$('#phone').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#phone_i").css({"color": "red"});
		  }else{
		    $("#phone_i").css({"color": "green"});
		  }
		});
	$('#identity').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#identity_i").css({"color": "red"});
		  }else{
		    $("#identity_i").css({"color": "green"});
		  }
		});
	$('#email').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == ""){
		    $("#email_i").css({"color": "red"});
		  }else{
		    $("#email_i").css({"color": "green"});
		  }
		});
	$('#gender').on('keydown keyup keypress change focus blur',function(){
		  if($(this).val() == "errorchoise"){
		    $("#gender_i").css({"color": "red"});
		  }else{
		    $("#gender_i").css({"color": "green"});
		  }
		});
});

