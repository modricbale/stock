<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>Sign Up</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport" />
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- BEGIN GLOBAL MANDATORY STYLES -->
		<link href="<%= basePath%>/static/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/style-metro.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
		<link href="<%= basePath%>/static/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
		<link href="<%= basePath%>/static/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
		<!-- END GLOBAL MANDATORY STYLES -->
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link href="<%= basePath%>/static/media/css/login.css" rel="stylesheet" type="text/css"/>
		<!-- END PAGE LEVEL STYLES -->
		<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />
		
		<script type="text/javascript">
			function validation(){
				if(checkName() && checkps() && checkcps() && checkEmail()){
					return true;
				}else{
					return false;
				}
			}
			
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
			    	$.ajax({
	    				type : 'post',
	    				url : 'getNameValidation?u_name='+name,
	    				success : function (msg){
	    					if(msg == 'failure'){//用户不存在
	    						$("#prompt_name").css("display","inline");
	    						$("#prompt_name").html("");
	    						flagName = 1;
	    					}else{
	    						$("#prompt_name").html("用户名已存在！请重输");
	    						$("#prompt_name").css("display","inline");
	    						$("#prompt_name").css("color","red");
	    					}
	    				}
	    			});
			    	if(flagName == 1){
	    				return true;
	    			}
	    			return false;
			    } 
			}
			
			function checkps(){
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
			
			function checkcps(){
			    var ps=$("#u_psd").val();
			    var cps=$("#u_repsd").val();
			    
			    if(cps == ""){
			    	$("#prompt_cps").html("请重复密码");
			    }else if(ps != cps){
			    	$("#prompt_cps").html("密码不一致");
	      		}else{
	      			$("#prompt_cps").html("");
	      			return true;
	      		}
			    $("#prompt_cps").css("display","inline");
      			$("#prompt_cps").css("color","red");
      			return false;
			}

			var flag = 0;
			function checkEmail(){
	   			var email=$("#u_email").val();
	    		var regEmail = /^\w+@\w+\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
				if(!regEmail.test(email)){//邮箱格式的验证
	    			$("#prompt_mail").html("邮箱格式不正确");
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
	    						flag = 1;
	    					}else{
	    						$("#prompt_mail").css("display","inline");
	    						$("#prompt_mail").html("邮箱已存在！请重输");
	    						$("#prompt_mail").css("color","red");
	    						
	    					}
	    				}
	    			}); 
	    			if(flag == 1){
	    				return true;
	    			}
	    			return false;
	    		}
	  		}
		</script>
		
	</head>
	<body class="login">
		<!-- BEGIN LOGO -->
		<div class="logo">
		<%-- <img src="<%= basePath%>/static/media/image/logo-big.png" alt="" />  --%>
		</div>
		<!-- END LOGO -->
		
		<div class="content">
			<!-- BEGIN REGISTRATION FORM -->
			<form action="userRegister" method="post" onsubmit="return validation();">
				<h3 class="">注册账户</h3>
				<p>请填写注册信息:</p>
				<div class="control-group">
					<label class="control-label visible-ie8 visible-ie9">用户名</label>
					<div class="controls">
						<div class="input-icon left">
							<i class="icon-user"></i>
							<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="u_name" id="u_name" onblur="checkName()"/>
						</div>
					</div>
					<div>
						<label id="prompt_name" style="font-size:9px;display:none;"></label>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label visible-ie8 visible-ie9">密码</label>
					<div class="controls">
						<div class="input-icon left">
							<i class="icon-lock"></i>
							<input class="m-wrap placeholder-no-fix" type="password" id="u_psd" placeholder="密码" name="u_psd" onblur="checkps()"/>
						</div>
					</div>
					<div>
						<label id="prompt_ps" style="font-size:9px;display:none;"></label>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label visible-ie8 visible-ie9">确认密码</label>
					<div class="controls">
						<div class="input-icon left">
							<i class="icon-ok"></i>
							<input class="m-wrap placeholder-no-fix" type="password" id="u_repsd" placeholder="确认密码" name="u_repsd" onblur="checkcps()"/>
						</div>
					</div>
					<div style="display:inline;">
						<label id="prompt_cps" style="font-size:9px;display:none;"></label>
					</div>
				</div>
				
				<div class="control-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">邮箱</label>
					<div class="controls">
						<div class="input-icon left">
							<i class="icon-envelope"></i>
							<input class="m-wrap placeholder-no-fix" type="text" placeholder="邮箱" name="u_email" id="u_email" onblur="checkEmail()"/>
						</div>
					</div>
					<div style="display:inline;">
						<label id="prompt_mail" style="display:none;font-size:9px;"></label>
					</div>
				</div>
				
				<!-- <div class="control-group">
					<div class="controls">
						<label class="checkbox">
						<input type="checkbox" name="tnc"/> 我同意 <a href="#">服务条件</a> 和 <a href="#">隐私权政策</a>
						</label>  
						<div id="register_tnc_error"></div>
					</div>
				</div> -->
	
				<div class="form-actions">
					<button id="register-back-btn" type="button" class="btn" onclick="javascript:history.go(-1);">
					<i class="m-icon-swapleft"></i>  返回
					</button>
					<input type="submit" id="register-submit-btn" class="btn green pull-right" value="注册"/>
					<i class="m-icon-swapright m-icon-white"></i>            
				</div>
			</form>
			<!-- END REGISTRATION FORM -->
		</div>
			<!-- BEGIN COPYRIGHT -->

	<div class="copyright">
		2016 &copy; Stock MIS by Finance Group.
	</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<script src="<%= basePath%>/static/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="<%= basePath%>/static/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="<%= basePath%>/static/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
	<script src="<%= basePath%>/static/media/js/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="<%= basePath%>/static/media/js/excanvas.min.js"></script>
	<script src="<%= basePath%>/static/media/js/respond.min.js"></script>  
	<![endif]-->   
	<script src="<%= basePath%>/static/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="<%= basePath%>/static/media/js/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="<%= basePath%>/static/media/js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="<%= basePath%>/static/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="<%= basePath%>/static/media/js/jquery.validate.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="<%= basePath%>/static/media/js/app.js" type="text/javascript"></script>
	<script src="<%= basePath%>/static/media/js/login.js" type="text/javascript"></script>      
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
		/* jQuery(document).ready(function() {     
		  App.init();
		  Login.init(); 
		});  */
	</script>
	<!-- END JAVASCRIPTS -->
<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
	</body>
</html>