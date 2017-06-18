<%@ page language="java"  import="java.util.*" import="java.text.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>新闻具体详情</title>

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
	<link href="<%= basePath%>/static/media/css/jquery.fancybox.css" rel="stylesheet" />
	<script src="<%= basePath%>/static/media/js/validation.js" type="text/javascript"></script>
	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="<%= basePath%>/static/media/css/news.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/blog.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />

	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="<%= basePath%>/static/media/css/login.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />
		
		
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<script type="text/javascript">
	function a(){
	    document.getElementById("test").value(); 
	}
    	
	</script>

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="index.html">

				<img src="<%= basePath%>/static/media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

				<img src="<%= basePath%>/static/media/image/menu-toggler.png" alt="" />

				</a>          

				<!-- END RESPONSIVE MENU TOGGLER -->            

				<!-- BEGIN TOP NAVIGATION MENU -->              

				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->

					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">

						<img alt="" src="<%= basePath%>/static/media/image/avatar1_small.jpg" />

						<c:if test="${user.u_id!=null }">

						<span class="username">${user.u_name }</span>
						
						</c:if>
						
						<c:if test="${user.u_id==null }">

						<span data-toggle="modal" data-target="#myModal">登录</span>
						
						</c:if>

						<i class="icon-angle-down"></i>

						</a>


					</li>

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

				<li>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone"></div>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>

				<li>

					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

					<form class="sidebar-search">

						<div class="input-box">

							<a href="javascript:;" class="remove"></a>

							<input type="text" placeholder="Search..." />

							<input type="button" class="submit" value=" " />

						</div>

					</form>

					<!-- END RESPONSIVE QUICK SEARCH FORM -->

				</li>

				<li class="start ">

					<a href="index.html">

					<i class="icon-home"></i> 

					<span class="title">股票信息中心</span>

					</a>

				</li>


				<li class="">

					<a href="javascript:;">

					<i class="icon-bookmark-empty"></i> 

					<span class="title">个人信息</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu">

						<li >

							<a href="ui_general.html">

							General</a>

						</li>

						<li >

							<a href="ui_buttons.html">

							Buttons</a>

						</li>

					
					</ul>

				</li>

				<li class="">

					<a href="javascript:;">

					<i class="icon-table"></i> 

					<span class="title">股票收藏</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu">

						<li >

							<a href="form_layout.html">

							查看我的收藏的股票</a>

						</li>


					</ul>

				</li>
				<li class="">

					<a href="javascript:;">

					<i class="icon-table"></i> 

					<span class="title">我的评论</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu">

						<li >

							<a href="form_layout.html">

							查看我的评论</a>

						</li>
						<li >

							<a href="form_layout.html">

							删除我的评论</a>

						</li>
						<li >

							<a href="form_layout.html">

							查看我评论的股票</a>

						</li>
					</ul>

				</li>

				<li class="active ">

					<a href="javascript:;">

					<i class="icon-briefcase"></i> 

					<span class="title">新闻管理</span>

					<span class="selected"></span>

					<span class="arrow open"></span>

					</a>

					<ul class="sub-menu">

					

						<li class="active">

							<a href="page_news.html">

							<i class="icon-coffee"></i>

							行业新闻</a>

						</li>


						<li >

							<a href="page_about.html">

							<i class="icon-group"></i>

							公司新闻</a>

						</li>



					</ul>

				</li>


			</ul>

			<!-- END SIDEBAR MENU -->

		</div>
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

							新闻中心<small>新闻展示页面</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.html">Home</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">新闻管理</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">行业新闻</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12 news-page blog-page">

						<div class="row-fluid">

							<div class="span8 blog-tag-data">

								<h1>最近热门新闻</h1>

								<img src="<%= basePath%>/static/media/image/item_img1.jpg" alt="">

								<div class="row-fluid">

									<div class="span6">

										<ul class="unstyled inline blog-tags">

											<li>

												<i class="icon-tags"></i> 

												<a href="#">财经新闻</a> 
												<a href="#"></a> 


											</li>

										</ul>

									</div>

									<div class="span6 blog-tag-data-inner">

										<ul class="unstyled inline">

											<li><i class="icon-calendar"></i> <a href="#">${news.news_time }</a></li>

										</ul>

									</div>

								</div>

								<div class="news-item-page">

									<p>
										${news.news_content }
                                    </p>
                           		
								<div class="media">
									
									
									
									


<!-- Modal -->
<div style="width:400px;border:0px;" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="height:330px;">
      <div class="modal-header" style="border:0px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      
     	<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<form method="post" onsubmit="return loginValidation();">
				<h3 class="form-title" style="font-family:'微软雅黑';margin-left:70px;">登录账户</h3>
				<div class="alert alert-error hide">
					<button class="close" data-dismiss="alert"></button>
					<span>Enter any username and password.</span>
				</div>
				<div class="control-group" style="margin-left:70px;">
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
				
				<div class="control-group" style="margin-left:70px;">
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
	
				<div class="form-actions" style="border:0px;padding:0px;margin:0px;padding-right:84px;">
					<button type="button" onclick="loginValidation_comment();" class="btn green pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
					</button>            
				</div>
	
				<div class="create-account" style="margin-left:70px;margin-top:30px;">
					<p>
						还没有账户？&nbsp; 
						<a href="register" id="register-btn" class="">注册账户</a>
					</p>
				</div>				
			</form>
			<!-- END LOGIN FORM -->        
		</div>
     </div>
  </div>
</div>
									
	
									
									<h3>评论区</h3>
									
									<a  class="pull-left">

									<img alt="" src="<%= basePath%>/static/media/image/9.jpg" class="media-object">

									</a>
									
									<div class="media">
									
									<c:forEach items="${list6}" var="l">
										
										<h4 class="media-heading">${l.u_name} 
										<span>${l.com_time } / <input type="button" id="reply" value="回复" 
										onclick="focus_reply('${l.u_id }','${l.com_id }','${l.u_name}');"  /></span>
										</h4>
										<p>
											${l.com_content }
																	
										<c:forEach items="${list7}" var="r">
										<c:if test="${r.r_commentid == l.com_id}">
										<div class="media">

											<a  class="pull-left">

											<img alt="" src="<%= basePath%>/static/media/image/9.jpg" class="media-object">

											</a>

											
											<div class="media-body">
												
												<h4 class="media-heading">${r.u_name}  <span>${r.r_time }/ <input type="button" id="reply" value="回复" 
										onclick="focus_reply('${r.u_id }','${r.r_commentid }','${r.u_name}');"  /></span></h4>

												<p>
													${r.r_content }
												</p>

											</div>
											
										</div>
										</c:if>	
										
										</c:forEach>
										<hr>
										</c:forEach>
										
										<!-- Nested media object -->
										<!--end media-->
											
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
												//alert(u_id);
												//alert(com_id);
											}
											function save_id(){
												return u_id;
											}
											function save_id2(){
												return com_id;
											}
								</script>
								
								
								

								<hr>
								
								
								<div class="post-comment">

									<h3>发布评论</h3>
									
									<form name="form1" method="post" action="">

										<label>评论内容</label>

										<textarea id = "test" name="test" class="span10 m-wrap" rows="8"></textarea>"
										<c:if test="${user.u_id!=null }">
										 <p> <input type="button" onclick="submit_remarkOrReply();" class="btn blue"  value="提交评论"/></p>   
										</c:if>
										<c:if test="${user.u_id==null }">
										 <p> <input type="button"  data-toggle="modal" data-target="#myModal" class="btn blue"  value="提交评论"/></p>   
										</c:if>
									</form>
									<script type="text/javascript">
										function submit_remarkOrReply(){
											
											var test_val = $("#test").val();
											//alert(test_val.indexOf('@'));
											if(test_val.indexOf('@') == 0){
												var s = save_id();
												//alert(s);
												var s1 = save_id2();
												document.form1.action = "<%=basePath%>/momo1?news_id=${news.news_id}&commentator_id=${user.u_id}&r_id=&u_id="+s+"&com_id="+s1;
												document.form1.submit();
											}else{
												document.form1.action = "<%=basePath%>/momo?news_id=${news.news_id}&commentator_id=${user.u_id}";
												document.form1.submit();
											}
											
										}
									</script>
								</div>
								
								</div>




							</div>

							<div class="span4">

								<h2>同行业链接</h2>

								<div class="top-news">

									<a href="#" class="btn green">

									<span>同花顺</span>

									<em>Posted on: April 15, 2013</em>

									<em>

									<i class="icon-tags"></i>

									Internet, Music, People

									</em>

									<i class="icon-music top-news-icon"></i>                             

									</a>

									<a href="#" class="btn yellow">

									<span>新浪财经</span>

									<em>Posted on: April 13, 2013</em>

									<em>

									<i class="icon-tags"></i>

									Education, Students, Canada

									</em>

									<i class="icon-book top-news-icon"></i>                              

									</a>

									<a href="#" class="btn red">

									<span>大秦财经</span>

									<em>Posted on: April 16, 2013</em>

									<em>

									<i class="icon-tags"></i>

									Money, Business, Google

									</em>

									<i class="icon-briefcase top-news-icon"></i>

									</a>

									<a href="#" class="btn blue">

									<span>腾讯财经</span>

									<em>Posted on: April 14, 2013</em>

									<em>

									<i class="icon-tags"></i>

									USA, Business, Apple

									</em>

									<i class="icon-globe top-news-icon"></i>                             

									</a>

								</div>
							
								<div class="space20"></div>

								<h3>股票点击排行榜</h3>
								<%List<Map.Entry<String, Double>> scoremap = (List<Map.Entry<String, Double>>)request.getAttribute("scoremap");
								List<Map.Entry<String, Double>> scoremap1 = (List<Map.Entry<String, Double>>)request.getAttribute("scoremap1"); %>

								<ul class="unstyled inline sidebar-tags">
										<%int m=0; %>
										 <c:forEach items="${scoremap1}" var="s" varStatus="v">
										<c:if test="${v.index<4 }">
										<li><a href="#"><i class="icon-tags"></i> <%=scoremap1.get(m).getKey() %></a></li>
	 												<%m++; %>	
	 												</c:if>
	 									</c:forEach>
									

								</ul>

								<div class="space20"></div>

								<h3>新闻点击排行榜</h3>

								<div class="tabbable tabbable-custom">

									<ul class="nav nav-tabs">

										<li class="active"><a data-toggle="tab" href="#tab_1_1">热门新闻NO.1</a></li>

										<li class=""><a data-toggle="tab" href="#tab_1_2">热门新闻NO.2</a></li>

										<li class=""><a data-toggle="tab" href="#tab_1_3">热门新闻NO.3</a></li>

									</ul>

									<div class="tab-content">

										

											
									
									    <c:forEach items="${scoremap}" var="s1" >
									    
										
									    <div id="tab_1_1" class="tab-pane ">
									    
									    
											<p><%=scoremap.get(0).getKey() %></p>		
											
										</div>
												<div id="tab_1_2" class="tab-pane">

											<p><%=scoremap.get(1).getKey() %></p>

											

										</div>

										<div id="tab_1_3" class="tab-pane">

											<p><%=scoremap.get(2).getKey() %></p>

										

										</div>
										
										
										
	 									</c:forEach>
									

										

									</div>

								</div>

				

							</div>

						</div>

					</div>

				</div>

				<!-- END PAGE CONTENT-->


			</div>

			<!-- END PAGE CONTAINER--> 

		</div>

		<!-- END PAGE -->    


	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->
		<div class="footer" STYLE="FLOAT:RIGHT">

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
	<script src="<%= basePath%>/static/media/js/jquery.validate.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="<%= basePath%>/static/media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
	

	<!-- END CORE PLUGINS -->

	<script src="<%= basePath%>/static/media/js/app.js"></script>      

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>