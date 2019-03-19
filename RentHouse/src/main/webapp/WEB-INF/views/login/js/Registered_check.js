$(document).ready(function() {
	$("#create").hide();
	$("#notyet").show();
	var acc_ok,pwd_ok,repwd_ok,name_ok,email_ok,phone_ok,id_ok,gender_ok = false;
	$('#Acc').on('keydown keyup keypress change focus blur',function(){
		var re = /^([A-Z]+)(?=.*[a-zA-Z])(?=.*[0-9]).{7,16}$/;
		var check = $(this).val();
			if(re.test(check)){
				$("#Acc_i").css({"color": "green"});
				acc_ok = true;
			}else{
				$("#Acc_i").css({"color": "red"});
				acc_ok = false;
		  }
		});
	$('#Pwd').on('keydown keyup keypress change focus blur',function(){
		var re = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
		var check = $(this).val();
		var repwd = $("#rePwd").val();
		  if(re.test(check)){
		    $("#Pwd_i").css({"color": "green"});
			  pwd_ok = true;
			if(check!=repwd){
				 $("#rePwd_i").css({"color": "red"});
				 repwd_ok = false;
			}
		  }else{
		    $("#Pwd_i").css({"color": "red"});
			  pwd_ok = false;
		  }
		});
	$('#rePwd').on('keydown keyup keypress change focus blur',function(){
		var re = $("#Pwd").val();
		var check = $(this).val();
		  if(re==check){
		    $("#rePwd_i").css({"color": "green"});
			  repwd_ok = true;
		  }else{
		    $("#rePwd_i").css({"color": "red"});
			  repwd_ok = false;
		  }
		});
	$('#inputname').on('keydown keyup keypress change focus blur',function(){
		var re_zh = /^[\u4e00-\u9fa5]{2,}$/;
		var re_en = /^[a-zA-Z]{3,}$/;
		var check = $(this).val();
		  if(re_zh.test(check)){
		    $("#inputname_i").css({"color": "green"});
			  name_ok = true;
		  }else if(re_en.test(check)){
			$("#inputname_i").css({"color": "green"});
			  name_ok = true;
		  }else{
			$("#inputname_i").css({"color": "red"});
			  name_ok = false;
			  }
		});
		$('#email').on('keydown keyup keypress change focus blur',function(){
		var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		var check = $(this).val();
		  if(re.test(check)){
		    $("#email_i").css({"color": "green"});
			  email_ok = true;
		  }else{
		    $("#email_i").css({"color": "red"});
			  email_ok = false;
		  }
		});
	$('#phone').on('keydown keyup keypress change focus blur',function(){
		var re = /^([0]+)([1-9]+)([0-9]{8,})$/
		var check = $(this).val();
		  if(re.test(check)){
		    $("#phone_i").css({"color": "green"});
			  phone_ok = true;
		  }else{
		    $("#phone_i").css({"color": "red"});
			  phone_ok = false;
		  }
		});
	$('#identity').on('keydown keyup keypress change focus blur',function(){
		var re_tw = /^[A-Za-z][1-2]\d{8}$/;
		var re_Re = /^[A-Za-z][c|C|d|D]\d{8}$/
		var check = $(this).val();
		  if(re_tw.test(check)){
		    $("#identity_i").css({"color": "green"});
			  id_ok = true;
		  }else if(re_Re.test(check)){
		    $("#identity_i").css({"color": "green"});
			  id_ok = true;
		  }else{
			$("#identity_i").css({"color": "red"});
			  id_ok = false;
		  }
		});
	$('#gender').on('keydown keyup keypress change focus blur',function(){
		
		  if($(this).val() != "errorchoise"){
		    $("#gender_i").css({"color": "green"});
			  gender_ok = true;
		  }else{
		    $("#gender_i").css({"color": "red"});
			  gender_ok = false;
		  }
		});
	$('.form-control').on('keydown keyup keypress change focus blur',function(){
		if(true==acc_ok && true==pwd_ok && true==repwd_ok &&
		   true==name_ok && true==email_ok && true==phone_ok && 
		   true==id_ok && true==gender_ok){
			$("#create").show();
			$("#notyet").hide();
		}else{
			$("#create").hide();
			$("#notyet").show();
		}
		});
	$('.custom-select').on('keydown keyup keypress change focus blur',function(){
		if(true==gender_ok){
			$("#create").show();
			$("#notyet").hide();
		}else{
			$("#create").hide();
			$("#notyet").show();
		}
		});
	$('.custom-select').on('keydown keyup keypress change focus blur',function(){
		
		var Year = $("#birth_Year").val();
		var Month = $("#birth_Month").val();
		var Date = $("#birth_Date").val();
		$("#birthday").val(Year+"-"+Month+"-"+Date);
		
		var gender = $("#gender").val();
		$("#sex").val(gender);
		});
	//初值
		$("#birthday").val("1990-1-1");

});
//^\w+：@ 之前必須以一個以上的文字&數字開頭，例如 abc
//((-\w+)：@ 之前可以出現 1 個以上的文字、數字或「-」的組合，例如 -abc-
//(\.\w+))：@ 之前可以出現 1 個以上的文字、數字或「.」的組合，例如 .abc.
//((-\w+)|(\.\w+))*：以上兩個規則以 or 的關係出現，並且出現 0 次以上 (所以不能 –. 同時出現)
//@：中間一定要出現一個 @
//[A-Za-z0-9]+：@ 之後出現 1 個以上的大小寫英文及數字的組合
//(\.|-)：@ 之後只能出現「.」或是「-」，但這兩個字元不能連續時出現
//((\.|-)[A-Za-z0-9]+)*：@ 之後出現 0 個以上的「.」或是「-」配上大小寫英文及數字的組合
//\.[A-Za-z]+$/：@ 之後出現 1 個以上的「.」配上大小寫英文及數字的組合，//結尾需為大小寫英文)
