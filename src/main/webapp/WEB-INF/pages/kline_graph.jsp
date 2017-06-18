<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

<meta charset="utf-8" />

<title>Metronic | Extra - Search Results</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="<%=basePath%>/static/media/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="<%=basePath%>/static/media/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>/static/media/css/font-awesome.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>/static/media/css/style-metro.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>/static/media/css/style.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath%>/static/media/css/style-responsive.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>/static/media/css/default.css"
	rel="stylesheet" type="text/css" id="style_color" />

<link href="<%=basePath%>/static/media/css/uniform.default.css"
	rel="stylesheet" type="text/css" />

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/media/css/datepicker.css" />

<link href="<%=basePath%>/static/media/css/jquery.fancybox.css"
	rel="stylesheet" />

<link href="<%=basePath%>/static/media/css/search.css" rel="stylesheet"
	type="text/css" />

<!-- END PAGE LEVEL STYLES -->

<link rel="shortcut icon"
	href="<%=basePath%>/static/media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->


				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="<%=basePath%>/static/media/image/menu-toggler.png" alt="" />

				</a>

				<!-- END RESPONSIVE MENU TOGGLER -->

				<!-- BEGIN TOP NAVIGATION MENU -->

				<ul class="nav pull-right">


					<!-- BEGIN USER LOGIN DROPDOWN -->

					<li class="dropdown user"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">
						 <img alt=""
							src="<%=basePath%>/static/media/image/avatar1_small.jpg" /> 
							<c:if test="${user.u_id!=null }">

						<span class="username">${user.u_name }</span>
						
						</c:if>
						
						<c:if test="${user.u_id==null }">

						<span data-toggle="modal" data-target="#myModal">登录</span>
						
						</c:if>
							 <i class="icon-angle-down"></i>

					</a>

						<ul class="dropdown-menu">

							<li><a href="extra_profile.html"><i class="icon-user"></i>
									My Profile</a></li>

							<li><a href="page_calendar.html"><i
									class="icon-calendar"></i> My Calendar</a></li>

							<li><a href="inbox.html"><i class="icon-envelope"></i>
									My Inbox(3)</a></li>

							<li><a href="#"><i class="icon-tasks"></i> My Tasks</a></li>

							<li class="divider"></li>

							<li><a href="extra_lock.html"><i class="icon-lock"></i>
									Lock Screen</a></li>

							<li><a href="login.html"><i class="icon-key"></i> Log
									Out</a></li>

						</ul></li>

					<!-- END USER LOGIN DROPDOWN -->

				</ul>

				<!-- END TOP NAVIGATION MENU -->

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container row-fluid">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse">

			<!-- BEGIN SIDEBAR MENU -->

			<ul class="page-sidebar-menu">

				<jsp:include page="/static/left_common.jsp"/>

			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<div id="portlet-config" class="modal hide">

				<div class="modal-header">

					<button data-dismiss="modal" class="close" type="button"></button>

					<h3>portlet Settings</h3>

				</div>

				<div class="modal-body">

					<p>Here will be a configuration form</p>

				</div>

			</div>

			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12">


						<!-- BEGIN PAGE TITLE & BREADCRUMB-->

						<h3 class="page-title">

							股票详情<small>K线图</small>

						</h3>

						<ul class="breadcrumb">

							<li><i class="icon-home"></i> <a href="index.html">Home</a>

								<i class="icon-angle-right"></i></li>

							<li><a href="#">股票详情</a> <i class="icon-angle-right"></i></li>

							<li><a href="#">K线图展示</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="tabbable tabbable-custom tabbable-full-width">

						<ul class="nav nav-tabs">


							<li class="active"><a data-toggle="tab" href="#tab_2_1">Image
									Search</a></li>

							<li><a data-toggle="tab" href="#tab_2_2">分时线图</a></li>
							<li><a data-toggle="tab" href="#tab_2_3">日K线图</a></li>
							<li><a data-toggle="tab" href="#tab_2_4">周K线图</a></li>
							<li><a data-toggle="tab" href="#tab_2_5">月K线图</a></li>
						</ul>

						<div class="tab-content">



							<div id="tab_2_1" class="tab-pane active">


								<div class="row-fluid search-images">

									<ul class="thumbnails">

										<li class="span3"><a id="picture_1"
											class="fancybox-button" data-rel="fancybox-button"
											title="390 x 220 - keenthemes.com" href=""> <img
												id="picture1" class="x" src="" alt="" /> <span><em>545
														x 300 - keenthemes.com</em></span>

										</a></li>

										<li class="span3"><a id="picture_2"
											class="fancybox-button" data-rel="fancybox-button"
											title="Photo" href=""> <img id="picture2" class="x"
												src="" alt="" /> <span><em>545 x 300-
														example.com</em></span>

										</a></li>


									</ul>

									<ul class="thumbnails">

										<li class="span3"><a id="picture_3"
											class="fancybox-button" data-rel="fancybox-button"
											title="390 x 220 - keenthemes.com" href=""> <img
												id="picture3" class="x" src="" alt="" /> <span><em>545
														x 300 - keenthemes.com</em></span>

										</a></li>

										<li class="span3"><a id="picture_4"
											class="fancybox-button" data-rel="fancybox-button"
											title="390 x 220 - keenthemes.com" href=""> <img
												id="picture4" class="x" src="" alt="" /> <span><em>545
														x 300 - example.com</em></span>

										</a></li>


									</ul>


								</div>

								<div class="spac40"></div>
								</div>

								<div id="tab_2_2" class="tab-pane ">

									<div class="row-fluid search-images">

										<ul class="thumbnails">

											<li class="span10"><a id="picture_5"
												class="fancybox-button" data-rel="fancybox-button"
												title="390 x 220 - keenthemes.com" href=""> <img
													id="picture5" class="x" src="" alt="" /> <span><em>545
															x 300 - keenthemes.com</em></span>

											</a></li>

										</ul>

									</div>

									<div class="spac40"></div>
									</div>
									<div id="tab_2_3" class="tab-pane">


										<div class="row-fluid search-images">

											<ul class="thumbnails">


												<li class="span10"><a id="picture_6"
													class="fancybox-button" data-rel="fancybox-button"
													title="Photo" href=""> <img id="picture6" class="x"
														src="" alt="" /> <span><em>545 x 300-
																example.com</em></span>

												</a></li>


											</ul>

										</div>

										<div class="spac40"></div>
										</div>
									

										<div id="tab_2_4" class="tab-pane">


											<div class="row-fluid search-images">

												<ul class="thumbnails">

													<li class="span10"><a id="picture_7"
														class="fancybox-button" data-rel="fancybox-button"
														title="390 x 220 - keenthemes.com" href=""> <img
															id="picture7" class="x" src="" alt="" /> <span><em>545
																	x 300 - keenthemes.com</em></span>

													</a></li>

												</ul>


											</div>

											<div class="spac40"></div>
											</div>
											<div id="tab_2_5" class="tab-pane">

												<div class="row-fluid search-images">


													<ul class="thumbnails">

														<li class="span10"><a id="picture_8"
															class="fancybox-button" data-rel="fancybox-button"
															title="390 x 220 - keenthemes.com" href=""> <img
																id="picture8" class="x" src="" alt="" /> <span><em>545
																		x 300 - example.com</em></span>

														</a></li>


													</ul>


												</div>

												<div class="spac40"></div>
												</div>

												<form action="" method="post">
													<div>


														<span name="posNum" class="posNum"
															style="font-size: 30px; font-weight: bold; color: red"
															></span> <span style="font-size: 20px">的股民对该股票持赞同意见</span>

													</div>
												</form>
											</div>

											<!--end tab-pane-->
										</div>

									</div>

									<!--end tabbable-->

								</div>

								<!-- END PAGE CONTENT-->

							</div>

							<!-- END PAGE CONTAINER-->

						</div>

					<div style="width: 400px; border: 0px;" class="modal fade"
						id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content" style="height: 330px;">
								<div class="modal-header" style="border: 0px;">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<div class="content">
									<!-- BEGIN LOGIN FORM -->
									<form method="post" onsubmit="return loginValidation();">
										<h3 class="form-title"
											style="font-family: '微软雅黑'; margin-left: 70px;">登录账户</h3>
										<div class="alert alert-error hide">
											<button class="close" data-dismiss="alert"></button>
											<span>Enter any username and password.</span>
										</div>
										<div class="control-group" style="margin-left: 70px;">
											<label class="control-label visible-ie8 visible-ie9">用户名</label>
											<div class="controls">
												<div class="input-icon left">
													<i class="icon-user"></i> <input
														class="m-wrap placeholder-no-fix" type="text"
														placeholder="用户名" name="u_name" id="u_name"
														onblur="checkName()" />
												</div>
											</div>
											<div>
												<label id="prompt_name"
													style="font-size: 9px; display: none;"></label>
											</div>
										</div>

										<div class="control-group" style="margin-left: 70px;">
											<label class="control-label visible-ie8 visible-ie9">密码</label>
											<div class="controls">
												<div class="input-icon left">
													<i class="icon-lock"></i> <input
														class="m-wrap placeholder-no-fix" type="password"
														placeholder="密码" name="u_psd" id="u_psd"
														onblur="checkps()" />
												</div>
											</div>

											<div>
												<label id="prompt_ps" style="font-size: 9px; display: none;"></label>
											</div>
										</div>

										<div class="form-actions"
											style="border: 0px; padding: 0px; margin: 0px; padding-right: 84px;">
											<button type="button" onclick="loginValidation_comment();"
												class="btn green pull-right">
												登录 <i class="m-icon-swapright m-icon-white"></i>
											</button>
										</div>

										<div class="create-account"
											style="margin-left: 70px; margin-top: 30px;">
											<p>
												还没有账户？&nbsp; <a href="register" id="register-btn" class="">注册账户</a>
											</p>
										</div>
									</form>
									<!-- END LOGIN FORM -->
								</div>
							</div>
						</div>
					</div>
					
					<div style="background-color: white;height:100%;width:1123px;margin-left:226px;">
					<h3 style="padding:30px;">评论区</h3>
					<div style="padding-left:30px;">
						<a class="pull-left"> <img style="width:40px;height:40px;" alt=""
							src="<%=basePath%>/static/media/image/9.jpg" class="media-object">
						</a>
					</div>
					<div class="media">

						<c:forEach items="${list6}" var="l">

							<h4 class="media-heading">${l.u_name}
								<span>${l.com_time } / <input type="button" id="reply"
									value="回复"
									onclick="focus_reply('${l.u_id }','${l.com_id }','${l.u_name}');" /></span>
							</h4>
							<p>
								${l.com_content }

								<c:forEach items="${list7}" var="r">
									<c:if test="${r.r_commentid == l.com_id}">
										<div class="media">

											<a class="pull-left"> <img alt=""
												src="<%=basePath%>/static/media/image/9.jpg"
												class="media-object">

											</a>


											<div class="media-body">

												<h4 class="media-heading">${r.u_name}
													<span>${r.r_time }/ <input type="button" id="reply"
														value="回复"
														onclick="focus_reply('${r.u_id }','${r.r_commentid }','${r.u_name}');" /></span>
												</h4>

												<p>${r.r_content }</p>

											</div>

										</div>
									</c:if>

								</c:forEach>
								<hr>
										</c:forEach>
										</p>
										<!-- Nested media object -->
										<!--end media-->
											
									</div>	
									
									
								
								<div cla ss="post-comment" style="padding:30px;">

									<h3>发布评论</h3>
									
									<form name="form1" method="post" action="">

										<label>评论内容</label>

										<textarea id="test" name="test" class="span10 m-wrap" rows="8"></textarea>"
										<c:if test="${user.u_id!=null }">
										 <p> <input type="button"
									onclick="submit_remarkOrReply();" class="btn blue" value="提交评论" />
							</p>   
										</c:if>
										<c:if test="${user.u_id==null }">
										 <p> <input type="button" data-toggle="modal"
									data-target="#myModal" class="btn blue" value="提交评论" />
							</p>   
										</c:if>
									</form>
									<script type="text/javascript">
										function submit_remarkOrReply(){
											var test_val = $("#test").val();
											alert(test_val.indexOf('@'));
											if(test_val.indexOf('@') == 0){
												var s = save_id();
												//alert(s);
												var s1 = save_id2();
												document.form1.action = "<%=basePath%>/momo3?stock_id=${stock.stock_id}&commentator_id=${user.u_id}&u_id="+s+"&com_id="+s1;
												document.form1.submit();
											}else{
												document.form1.action = "<%=basePath%>/momo2?stock_id=${stock.stock_id}&commentator_id=${user.u_id}";
												document.form1.submit();
											}

										}
									</script>
								</div>
								
									
									
													
								</div>
								
								
								<script type="text/javascript">
											var u_id;
											var com_id;
											function focus_reply(id1,id2,name){
												
												document.getElementById("test").focus();
												$("#test").html("@"+ name+":");
												u_id = id1;
												com_id = id2;
												alert(u_id);
												alert(com_id);
											}
											function save_id(){
												return u_id;
											}
											function save_id2(){
												return com_id;
											}
								
				</script><hr>
								
								</div>
			</div>
	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2016 &copy; Metronic by keenthemes.

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

		</div>

	</div>

	<!-- END FOOTER -->
     <script type="text/javascript">
						window.onload = function showPicture() {
							// alert('${src1}'+":"+'${src2}');
							var img1 = document.getElementById("picture1");
							img1.src = '${src1}';
							var img_1 = document.getElementById("picture_1");
							img_1.href = '${src1}';

							var img2 = document.getElementById("picture2");
							img2.src = '${src2}';
							var img_2 = document.getElementById("picture_2");
							img_2.href = '${src2}';

							var img3 = document.getElementById("picture3");
							img3.src = '${src3}';
							var img_3 = document.getElementById("picture_3");
							img_3.href = '${src3}';

							var img4 = document.getElementById("picture4");
							img4.src = '${src4}';
							var img_4 = document.getElementById("picture_4");
							img_4.href = '${src4}';

							
							var img5 = document.getElementById("picture5");
							img5.src = '${src1}';
							var img_5 = document.getElementById("picture_5");
							img_5.href = '${src1}';

							var img6 = document.getElementById("picture6");
							img6.src = '${src2}';
							var img_6 = document.getElementById("picture_6");
							img_6.href = '${src2}';

							var img7 = document.getElementById("picture7");
							img7.src = '${src3}';
							var img_7 = document.getElementById("picture_7");
							img_7.href = '${src3}';

							var img8 = document.getElementById("picture8");
							img8.src = '${src4}';
							var img_8 = document.getElementById("picture_8");
							img_8.href = '${src4}';
							
							
							//----------------------
							$.ajax({
								type : 'post',

								url : 'stockEmotion',

								data:{   
									stockCd:'${stock.stock_cd}',  
		                        		  contentType: "application/x-www-form-urlencoded;charset=utf-8"  
		                            },
										
								success : function(data) {

									$(".posNum").text(data);
									
								}

							});

						}
					</script>
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="<%=basePath%>/static/media/js/jquery-1.10.1.min.js"
				type="text/javascript"></script>

	<script
				src="<%=basePath%>/static/media/js/jquery-migrate-1.2.1.min.js"
				type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script
				src="<%=basePath%>/static/media/js/jquery-ui-1.10.1.custom.min.js"
				type="text/javascript"></script>      

	<script src="<%=basePath%>/static/media/js/bootstrap.min.js"
				type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="<%=basePath%>/static/media/js/excanvas.min.js"></script>

	<script src="<%=basePath%>/static/media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="<%=basePath%>/static/media/js/jquery.slimscroll.min.js"
				type="text/javascript"></script>

	<script src="<%=basePath%>/static/media/js/jquery.blockui.min.js"
				type="text/javascript"></script>  

	<script src="<%=basePath%>/static/media/js/jquery.cookie.min.js"
				type="text/javascript"></script>

	<script src="<%=basePath%>/static/media/js/jquery.uniform.min.js"
				type="text/javascript"></script>

	<!-- END CORE PLUGINS -->

	<script type="text/javascript"
				src="<%=basePath%>/static/media/js/bootstrap-datepicker.js"></script>

	<script src="<%=basePath%>/static/media/js/jquery.fancybox.pack.js"></script>

	<script src="<%=basePath%>/static/media/js/app.js"></script>

	<script src="<%=basePath%>/static/media/js/search.js"></script>      

	<script src="<%=basePath%>/static/media/js/validation.js"
				type="text/javascript"></script>
	
	<script>
		jQuery(document).ready(function() {

			App.init();

			Search.init();

		});
	</script>

	<!-- END JAVASCRIPTS
	<script type="text/javascript">
	window.onload=function(){
	    
	
		$.ajax({
			type:'post',
			dataType:'json',
			url:'stockEmotion?stockCd=000005',
			
			success:function(data){
				
			alert(data);
			
			    
			}

		}); 
	};
	</script>
 -->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-37564768-1' ]);
	_gaq.push([ '_setDomainName', 'keenthemes.com' ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://'
				: 'http://')
				+ 'stats.g.doubleclick.net/dc.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</body>

<!-- END BODY -->

</html>