<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath();
   String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
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
		
		
		
	</head>
	<body class="login">
		<!-- BEGIN LOGO -->
		<div class="logo">
		<%-- <img src="<%= basePath%>/static/media/image/logo-big.png" alt="" /> --%> 
		</div>
		<!-- END LOGO -->
		
		<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<form action="userLogin" method="post" onsubmit="return loginValidation();">
				<h3 class="form-title">登录账户</h3>
				
				<div class="alert alert-error hide">
					<button class="close" data-dismiss="alert"></button>
					<span>Enter any username and password.</span>
				</div>
				
				<div class="control-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
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
							<input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="u_psd" id="u_psd" onblur="checkps()"/>
						</div>
					</div>
					
					<div>
						<label id="prompt_ps" style="font-size:9px;display:none;"></label>
					</div>
				</div>
	
				<div class="form-actions">
					<button type="submit" class="btn green pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
					</button>            
				</div>
	
				<div class="forget-password">
					<p>忘记密码 ？</p>
					<p>
						不要担心，点击 <a href="javascript:;" class="" id="forget-password">这里</a>
						重置密码.
					</p>
				</div>
	
				<div class="create-account">
					<p>
						还没有账户？&nbsp; 
						<a href="register" id="register-btn" class="">注册账户</a>
					</p>
				</div>
			</form>
			<!-- END LOGIN FORM -->        
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
		<script src="<%= basePath%>/static/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
		<script src="<%= basePath%>/static/media/js/bootstrap.min.js" type="text/javascript"></script>
		
		<!-- END CORE PLUGINS -->
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script src="<%= basePath%>/static/media/js/jquery.validate.min.js" type="text/javascript"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<script src="<%= basePath%>/static/media/js/app.js" type="text/javascript"></script>
		<script src="<%= basePath%>/static/media/js/login.js" type="text/javascript"></script>      
		<script src="<%= basePath%>/static/media/js/validation.js" type="text/javascript"></script>
		<!-- END JAVASCRIPTS -->
		<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
	</body>
</html>