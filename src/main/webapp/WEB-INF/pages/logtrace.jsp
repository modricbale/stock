<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	ArrayList<String>arr = (ArrayList<String>)request.getAttribute("news_trace");
	ArrayList<String>arr1 = (ArrayList<String>)request.getAttribute("stock_trace");
	ArrayList<String>arr2 = (ArrayList<String>)request.getAttribute("all_trace");
	ArrayList<String>arr3 = (ArrayList<String>)request.getAttribute("login_trace");
%><html>

<head>

	<meta charset="utf-8" />

	<title>Metronic | Extra - FAQ</title>

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

	<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />

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

				<a class="brand" href="index.html">

				<img src="<%= basePath%>/static/media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->


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


				<li class="start ">

					<a href="index.html">

					<i class="icon-home"></i> 

					<span class="title">Dashboard</span>

					</a>

				</li>

				<li class="">

					<a href="javascript:;">

					<i class="icon-cogs"></i> 

					<span class="title">Layouts</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu">

						<li >

							<a href="layout_horizontal_sidebar_menu.html">

							Horzontal & Sidebar Menu</a>

						</li>

						<li >

							<a href="layout_horizontal_menu1.html">

							Horzontal Menu 1</a>

						</li>

					</ul>

				</li>

			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content">


			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12">


						<!-- BEGIN PAGE TITLE & BREADCRUMB-->

						<h3 class="page-title">

							日志查看<small>用户踪迹</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.html">Home</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">日志查看</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">用户踪迹</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<div class="span3" style="float:left;width:200px;">

							<ul class="ver-inline-menu tabbable margin-bottom-10">

								<li class="active" style="width:200px">

									<a href="#tab_1"  data-toggle="tab">

									<i class="icon-briefcase"></i> 

									登录踪迹

									</a> 

									<span class="after"></span>                                    

								</li>

								<li style="width:200px"><a href="#tab_2"  data-toggle="tab"><i class="icon-group"></i> 股票浏览踪迹</a></li>

								<li style="width:200px"><a href="#tab_3"  data-toggle="tab"><i class="icon-leaf"></i> 新闻浏览踪迹</a></li>



							</ul>

						</div>

						<div class="span9" style="width:70%;float:right;">

							<div class="tab-content" style="width:600px;">

								<div class="tab-pane active" id="tab_1" style="width:600px;">

									<div class="accordion in collapse" id="accordion1" style="height: auto;width:600px;">

										<div class="accordion-group"style="width:400px" >

											<div class="accordion-heading">

												<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse_2_1">
												<%int start2 = arr3.get(0).indexOf("户");
												  int end2 = arr3.get(0).indexOf("登");
												  String name2 = arr3.get(0).substring(start2+1, end2);
												%>
												<%=name2 %>登录浏览踪迹

												</a>

											</div>

											<div id="collapse_1" class="accordion-body collapse in">

												<div class="accordion-inner">

													<%int m=0; %>
												 <c:forEach items="${login_trace}" var="t" >
		
	
												 <p><%=arr3.get(m)%></p>
	 												<%m++; %>	
	 											</c:forEach>

												</div>

											</div>

										</div>

									


									</div>

								</div>

								<div class="tab-pane" id="tab_2">

									<div class="accordion in collapse" id="accordion2" style="height: auto;">

										<div class="accordion-group" style="width:400px" >

											<div class="accordion-heading" >

												<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse_2_1">
												<%int start = arr1.get(0).indexOf(":");
												  int end = arr1.get(0).indexOf("在");
												  String name = arr1.get(0).substring(start+1, end);
												%>
												<%=name %>股票浏览踪迹

												</a>

											</div>

											<div id="collapse_2_1" class="accordion-body collapse in">

												<div class="accordion-inner">

													<%int j=0; %>
												 <c:forEach items="${stock_trace}" var="t" >
		
	
												 <p><%=arr1.get(j)%></p>
	 												<%j++; %>	
	 											</c:forEach>

												</div>

											</div>

										</div>

								


									</div>

								</div>

								<div class="tab-pane" id="tab_3">

									<div class="accordion in collapse" id="accordion3" style="height: auto;">

										<div class="accordion-group"style="width:400px" >

											<div class="accordion-heading">

												<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion3" href="#collapse_3_1">

												<%int start1 = arr1.get(0).indexOf(":");
												  int end1 = arr1.get(0).indexOf("在");
												  String name1 = arr1.get(0).substring(start1+1, end1);
												%>
												<%=name1 %>新闻浏览踪迹

												</a>

											</div>

											<div id="collapse_3_1" class="accordion-body collapse in">

													<div class="accordion-inner">

													<%int k=0; %>
												 <c:forEach items="${news_trace}" var="t" >
		
	
												 <p><%=arr.get(k)%></p>
	 												<%k++; %>	
	 											</c:forEach>

												</div>

											</div>

										</div>

							

									

									</div>

								</div>

							</div>

						</div>

						<!--end span9-->                                   

					</div>

				</div>

				<!-- END PAGE CONTENT-->
			</div>

			<!-- END PAGE CONTAINER--> 

		</div>

		<!-- END PAGE -->    

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2013 &copy; Metronic by keenthemes.

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

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

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