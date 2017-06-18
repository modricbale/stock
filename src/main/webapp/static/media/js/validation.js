var flagName = 0;
function checkName(){
	var name=$("#u_name").val();
	var regName=/^[a-zA-Z]\w{3,15}$/;
	if(name == ""){
		$("#prompt_name").html("用户名不能为空！");
		$("#prompt_name").css("display","inline");
		$("#prompt_name").css("color","red"); 
		return false;
	}else if(!regName.test(name)){
		$("#prompt_name").html("以英文字母开头,英文字母和数字组成,4-16位");
		$("#prompt_name").css("display","inline");
		$("#prompt_name").css("color","red"); 
		return false;
	}else{
		$("#prompt_name").html("");
		return true;
	}
}
			
function checkps(){
	var ps=$("#u_psd").val();
	var regps = /^[a-zA-Z0-9]{4,12}$/;
				 
	if(ps == ""){
		$("#prompt_ps").html("请输入密码");
	}else if(!regps.test(ps)){
		$("#prompt_ps").html("密码为4-12位的数字和字母");
	}else{
		$("#prompt_ps").html("");
		return true;
	}
	$("#prompt_ps").css("display","inline");
    $("#prompt_ps").css("color","red");
    return false;
}

//登录
function checkNamePs(){
	var name=$("#u_name").val();
	var result = false;
	$.ajax({
		//将async设置为false,才能使得return 返回true,false有效
		async : false,
    	type : 'post',
    	url : 'getNameValidation?u_name='+name,
    	success : function (msg){
    		if(msg == 'success'){//用户名存在
    			$("#prompt_ps").html("");
    			result = true;
    		}else{
    			$("#prompt_ps").css("display","inline");
    			$("#prompt_ps").css("color","red");
    			$("#prompt_ps").html("用户名或密码错误！");
    			result = false;
    		}
    	}
    });
	
	return result;
}

var emailflag = 0;
function checkEditEmail(){
	var email = $("#u_email").val();
	var regEmail = /^\w+@\w+\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
	
	if(!regEmail.test(email)){//邮箱格式的验证
		$("#prompt_mail").html("邮箱格式不正确！");
		$("#prompt_mail").css("display","inline");
		$("#prompt_mail").css("color","red");
		return false;
	}else{//邮箱是否存在的验证
		$.ajax({
			type : 'post',
			url : 'getEmailValidation?u_email='+email,
			success : function (msg){
				if(msg == 'success'){//不存在
					$("#prompt_mail").css("display","inline");
					$("#prompt_mail").html("");
					emailflag = 1;
				}else if($("#u_email").val() == $("#u_emailtwo").val()){
					$("#prompt_mail").css("display","inline");
					$("#prompt_mail").html("");
					emailflag = 1;
				}else{
					$("#prompt_mail").css("display","inline");
					$("#prompt_mail").html("邮箱已存在！重输");
					$("#prompt_mail").css("color","red");
				}
			}
		});
		if(emailflag == 1){
			return true;
		}
		return false;
	}
}

function checkEditPs(){
	var ps=$("#u_psd").val();
	var regps = /^[a-zA-Z0-9]{4,12}$/;
	 
	if(ps == ""){
    	$("#prompt_ps").html("请输入密码");
    }
	else if(!regps.test(ps)){
		$("#prompt_ps").html("密码为4-12位的数字和字母");
		
	}else{
		$("#prompt_ps").html("");
		return true;
	}
	$("#prompt_ps").css("display","inline");
	$("#prompt_ps").css("color","red");
	return false;
}

function checkPhone(){
	var phone = $("#u_phone").val();
    var regPhone = /^1\d{10}$/;
    
    if(!regPhone.test(phone)){
    	$("#prompt_phone").html("手机号码为11位全数字！");
	   	$("#prompt_phone").css("display","inline");
	    $("#prompt_phone").css("color","red");
	    return false;
    }else{
    	$("#prompt_phone").html("");
    	return true;
    }
}

function loginValidation(){

	return checkName() && checkps() && checkNamePs() && checkNamePwd();
}

//评论时登录
function loginValidation_comment(){
	var u_name = $("#u_name").val();
	var u_pwd = $("#u_psd").val();
//	alert(u_name+":"+u_pwd);
	var result = false;
	$.ajax({
		async : false,
		type : 'post',
		url : 'checkUsernamePwd/?u_name='+u_name+"&u_psd="+u_pwd,
		success : function(msg){
			if(msg == 'success'){
				result = true;
				/*$("#myModal").css("display","none");
				$(".modal-backdrop.fade.in").css("opacity","0");*/
				window.location.reload();
			}else{
				$("#prompt_ps").css("display","inline");
				$("#prompt_ps").css("color","red");
				$("#prompt_ps").html("用户名或密码错误！");
				result = false;				
			}
		}
	});
	
	return result;
}

function checkNamePwd(){
	var u_name = $("#u_name").val();
	var u_pwd = $("#u_psd").val();
//	alert(u_name+":"+u_pwd);
	var result = false;
	$.ajax({
		async : false,
		type : 'post',
		url : 'checkUsernamePwd/?u_name='+u_name+"&u_psd="+u_pwd,
		success : function(msg){
			if(msg == 'success'){
				result = true;
			}else{
				$("#prompt_ps").css("display","inline");
				$("#prompt_ps").css("color","red");
				$("#prompt_ps").html("用户名或密码错误！");
				result = false;				
			}
		}
	});
	
	return result;
}

function editValidation(){
	if(checkEditEmail() && checkPhone()){
		return true;
	}else if(!checkPhone()){
		return false;
	}else{
		return false;
	}
}