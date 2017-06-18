<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	System.out.print(basePath);
	List<Map.Entry<String, Double>> scoremap=(List<Map.Entry<String, Double>>) request.getAttribute("scoremap");
	List<Map.Entry<String, Double>> scoremap1=(List<Map.Entry<String, Double>>) request.getAttribute("scoremap1");

	
%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>Metronic | Visual Charts</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<script src="<%= basePath%>/static/media/js/Chart-1.0.1-beta.4.js"></script>

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
	
	<script>
			<% List<Map.Entry<String, Integer>> stocklist =(List<Map.Entry<String, Integer>>) request.getAttribute("stocklist");
			List<Map.Entry<String, Integer>> newslist =(List<Map.Entry<String, Integer>>) request.getAttribute("newslist");
			List<Map.Entry<String, Integer>> collectlist =(List<Map.Entry<String, Integer>>) request.getAttribute("collectlist");
			HashMap<Integer, ArrayList<String>> hmcollect =(HashMap<Integer, ArrayList<String>>) request.getAttribute("hmcollect");
			ArrayList<String> colorlist = new ArrayList<String>();
			colorlist.add("#FF0000");
			colorlist.add("#FF00FF");
			colorlist.add("#70DB93");
			colorlist.add("#9932CD");
			colorlist.add("#A67D3D");
			colorlist.add("#97694F");   
			colorlist.add("#00FF00");   
			%>
			
			var stockscandata = [

				<% 
				int total=0;
				int m=0;
				for(int i=0;i<stocklist.size();i++){
					total+=stocklist.get(i).getValue();
				}
					for(int i = 0;i<stocklist.size()&&i<6;i++){
						
				%>
				{
					label: "'<%=stocklist.get(i).getKey()%>'"+"占总数百分之",
					value: <%=(stocklist.get(i).getValue())*100/total%>,
					color:"<%=colorlist.get(i)%>",
				},
					
				<%
				if(i==5){
					int total_fuck=0;
					for(int s=0;i<6;i++){
						
						total_fuck += stocklist.get(i).getValue();
					}
				%>
				{
					label: "'其他'"+"占总数百分之",
					value: <%=(total-total_fuck)%>,
					color:"<%=colorlist.get(6)%>",
				},
				<%}%>
			<%}%>
			];
			
			var newsscandata = [
			     				<% 
			     				int total1=0;
			     				int pa = 0;
			    				for(int i=0;i<newslist.size()&&i<6;i++){
			    					total1+=newslist.get(i).getValue();
			    				}
			     					for(int i = 0;i<newslist.size();i++){
			     						if(i>=7){
			    							pa=i-7;
			    						}
			    						else{
			    							pa=i;
			    						}
			     				%>
			     				{
			     					label: "'<%=newslist.get(i).getKey()%>'"+"占总数百分之",
			     					value: <%=(newslist.get(i).getValue())*100/total1%>,
			     					color:"<%=colorlist.get(pa)%>",
			     				},
			     				<%
			    				if(i==5){
			    					int total_fuck=0;
			    					for(int s=0;i<6;i++){
			    						
			    						total_fuck += newslist.get(i).getValue();
			    					}
			    				%>
			    				{
			    					label: "'其他'"+"占总数百分之",
			    					value: <%=(total-total_fuck)%>,
			    					color:"<%=colorlist.get(6)%>",
			    				},
			    				<%}%>
			     			
			     			<%}%>
			     			];
			

			var collectdata = [
			     				<% 
			     				int total2=0;
			     				int papa=0;
			    				for(int i=0;i<collectlist.size();i++){
			    					total2+=collectlist.get(i).getValue();
			    				}
			     					for(int i = 0;i<collectlist.size();i++){
			     						if(i>=7){
			    							papa=i-7;
			    						}
			     						
			    						else{
			    							papa=i;
			    						}
			     				%>
			     				{
			     					label: "'<%=collectlist.get(i).getKey()%>'"+"占总数百分之",
			     					value: <%=(collectlist.get(i).getValue())*100/total2%>,
			     					color:"<%=colorlist.get(papa)%>",
			     				},
			     					
			     				<%
			    				if(i==5){
			    					int total_fuck=0;
			    					for(int s=0;i<6;i++){
			    						
			    						total_fuck += collectlist.get(i).getValue();
			    					}
			    				%>
			    				{
			    					label: "'其他'"+"占总数百分之",
			    					value: <%=(total-total_fuck)%>,
			    					color:"<%=colorlist.get(6)%>",
			    				},
			    				<%}%>
			     			<%}%>
			     			];
			
		
			
			<% HashMap<String, Integer> timemap = (HashMap<String, Integer>)request.getAttribute("timemap");
			   ArrayList<Integer>arrtime = new ArrayList<Integer>();
			   for(int i=0;i<10;i+=2){
				   int a1=0,a2=0;
				   if(timemap.get(("0"+i))!=null){
				    a1 = timemap.get(("0"+i));
				   }
				   if(timemap.get(("0"+(i+1)))!=null){
				    a2 = timemap.get(("0"+(i+1)));
				   }
				   arrtime.add(a1+a2);
				
			   }
			   for(int i=10;i<24;i+=2){
				   int a1=0,a2=0;
				   if(timemap.get(String.valueOf(i))!=null){
					   a1=timemap.get(String.valueOf(i));
				   }
				   if(timemap.get(String.valueOf(i+1))!=null){
					   a2=timemap.get(String.valueOf(i+1));
				   }
				   arrtime.add(a1+a2);
				   
			   }
			%>
			var timedata = {
					labels : ["0:00--2:00","2:00--4:00","4:00--6:00","6:00--8:00","8:00--10:00","10:00--12:00","12:00--14:00", "14:00--16:00","16:00--18:00","18:00--20:00","20:00--22:00","22:00--24:00"],
					datasets : [
						{
							barItemName: "name1",
							fillColor : "rgba(220,220,220,0.5)",
							strokeColor : "rgba(220,220,220,1)",
							data : [
							<%
							for(int i=0;i<arrtime.size();i++){
								
							%>
								<%=arrtime.get(i)%>
							<%}%>
							]
						},
					
					]
				};
			
			

			
			var chartPie = null;
			var chartPie1 = null;
			window.onload = function(){				
				var ctx = document.getElementById("myChart").getContext("2d");
				var ctx1 = document.getElementById("myChart1").getContext("2d");
				var ctx2 = document.getElementById("myChart2").getContext("2d");
				var ctx3 = document.getElementById("myChart3").getContext("2d");
				
				chartPie = new Chart(ctx).Pie(stockscandata, {segmentShowStroke : false, animation : true, showTooltips : 1});
				chartPie1 = new Chart(ctx1).Pie(newsscandata, {segmentShowStroke : false, animation : true, showTooltips : 1});
				chartPie3 = new Chart(ctx3).Pie(collectdata, {segmentShowStroke : false, animation : true, showTooltips : 1});
				chartBar2 = new Chart(ctx2).Bar(timedata);
				//initEvent(chartPie, clickCall);
			}
			
			function clickCall(evt) {
				var segments = chartPie.getSegmentsAtEvent(evt);
				
				if ( segments.length > 0 ) {
					var segment = segments[0];
					alert( segment.label + ": " + segment.value);
				}
			}
			
			function initEvent(chart, handler) {
				var method = handler;
				var eventType = "click";
				var node = chart.chart.canvas;
								
				if (node.addEventListener) {
					node.addEventListener(eventType, method);
				} else if (node.attachEvent) {
					node.attachEvent("on" + eventType, method);
				} else {
					node["on" + eventType] = method;
				}
			}
			
		</script>
	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="index.html">

				<img src="media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

				<img src="<%= basePath%>/static/media/image/menu-toggler.png" alt="" />

				</a>          

				<!-- END RESPONSIVE MENU TOGGLER -->            





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

							Visual Charts <small>visual charts & graphs</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.html">Home</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">Visual Charts</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN CHART PORTLETS-->

		

				<!-- END CHART PORTLETS-->

				<!-- BEGIN PIE CHART PORTLET-->

				<div class="row-fluid">

					<div class="span6">

						<div class="portlet box yellow">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>扇形图1</div>

								<div class="tools">

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

								</div>

							</div>

							<div class="portlet-body">

								<h4>股票浏览分布比例</h4>

								
								
								<canvas id="myChart" width="300" height="300"></canvas>

							</div>

						</div>

						<div class="portlet box purple">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>扇形图2</div>

								<div class="tools">

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

								</div>

							</div>

							<div class="portlet-body">

								<h4>新闻浏览分布比例</h4>

								
								
								<canvas id="myChart1" width="300" height="300"></canvas>

							</div>

						</div>

					</div>

					<div class="span6">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>扇形图3</div>

								<div class="tools">

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

								</div>

							</div>

							<div class="portlet-body">

								<h4>股票收藏比例</h4>

							<canvas id="myChart3" width="300" height="300"></canvas>

							</div>

						</div>

					
						<div class="portlet box red">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>扇形图4</div>

								<div class="tools">

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

								</div>

							</div>

							<div class="portlet-body">
								<h4>用户登录时间分布</h4>
								<canvas id="myChart2" width="500" height="300"></canvas>


							</div>

						</div>

					</div>

				</div>

				<!-- END PIE CHART PORTLET-->



				<!-- END PAGE CONTENT-->

			</div>

			<!-- BEGIN PAGE CONTAINER-->     

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

	<script src="<%= basePath%>/static/edia/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

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

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="<%= basePath%>/static/media/js/jquery.flot.js"></script>

	<script src="<%= basePath%>/static/media/js/jquery.flot.resize.js"></script>

	<script src="<%= basePath%>/static/media/js/jquery.flot.pie.js"></script>

	<script src="<%= basePath%>/static/media/js/jquery.flot.stack.js"></script>

	<script src="<%= basePath%>/static/media/js/jquery.flot.crosshair.js"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="<%= basePath%>/static/media/js/app.js"></script>

	<script src="<%= basePath%>/static/media/js/charts.js"></script>      

	<script>

		jQuery(document).ready(function() {       

		   // initiate layout and plugins

		   App.init();

		   Charts.init();

		   Charts.initCharts();

		   Charts.initPieCharts();

		});

	</script>
	
	

	<!-- END PAGE LEVEL SCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>