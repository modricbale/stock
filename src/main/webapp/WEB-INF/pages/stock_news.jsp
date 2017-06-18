<%@page import="com.stock.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	User user  =(User)session.getAttribute("user");
	//System.out.println(basePath);
	int count = (Integer)(application.getAttribute("count"));
	System.out.println("is:"+count);
%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>


	<meta charset="utf-8" />

	<title>Metronic | Pages - News</title>

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

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="<%= basePath%>/static/media/css/news.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />
	
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">
									
									
								


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
									
									
									
									
									
		
								

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->
	
		<div>

			<div class="container-fluid">


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
						
						<ul class="dropdown-menu">

							<li><a input type = "button" onclick = "onclick1()"> 退出登录</a></li>
						
						</ul>
						
						</c:if>
						
						<c:if test="${user.u_id==null }">

						<span data-toggle="modal" data-target="#myModal">登录</span>
						
						</c:if>

						<i class="icon-angle-down"></i>

						</a>
						
					
						
						<script type="text/javascript">
						
						function onclick1(){
						$.ajax({
								type : 'post',

								url : 'logout',

								data:{   
								
		              			 contentType: "application/x-www-form-urlencoded;charset=utf-8"  
		                            },
										
								success : function(msg) {
									if(msg == 'success'){
									alert("logout");
									 window.location.reload();
									}
								}

							});
						
						}
						
						</script>
						
						

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
							<c:if test="${user.u_id!=null }">
							<a  href="<%=basePath %>/userInfo?u_id=${user.u_id }">查看个人信息</a>
							</c:if>
							<c:if test="${user.u_id==null }">
							<a  data-toggle="modal" data-target="#myModal" >查看个人信息</a>
							</c:if>
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
							<c:if test="${user.u_id!=null }">
							<a  href="<%=basePath %>/collect?u_id=${user.u_id }">查看我收藏的股票</a>
							</c:if>
							<c:if test="${user.u_id==null }">
							<a  data-toggle="modal" data-target="#myModal" >查看我收藏的股票</a>
							</c:if>
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

					</ul>

				</li>


			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

 <jsp:include page="/static/left_common.jsp"/>
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

					<div class="span12 news-page">

						<h1>最近热门新闻</h1>

						<div class="row-fluid">

							<div class="span5">

								<div id="myCarousel" class="carousel slide">

									<!-- Carousel indicators

										<ol class="carousel-indicators">

										 <li data-target="#myCarousel" data-slide-to="0" class="active"></li>

										 <li data-target="#myCarousel" data-slide-to="1"></li>

										 <li data-target="#myCarousel" data-slide-to="2"></li>

										</ol>

										-->

									<!-- Carousel items -->

									<div class="carousel-inner">

										<div class="active item">

											<img src="<%= basePath%>/static/media/image/image3.jpg" alt="">

											<div class="carousel-caption">

												<h4><a href="<%=basePath %>/admin2">1股市风云</a></h4>

												<p>精彩正在继续</p>

											</div>

										</div>

										<div class="item">

											<img src="<%= basePath%>/static/media/image/image2.jpg" alt="">

											<div class="carousel-caption">

												<h4><a href="<%=basePath %>/admin2">2股市风云</a></h4>

												<p>股市风云</p>

											</div>

										</div>

										<div class="item">

											<img id="imgtest"  src="<%= basePath%>/static/media/image/image1.jpg" alt="">

											<div class="carousel-caption">

												<h4><a href="<%=basePath %>/admin2">2股市风云</a></h4>

												<p>3股市风云</p>

											</div>

										</div>

									</div>

									<!-- Carousel nav -->

									<a class="carousel-control left" href="#myCarousel" data-slide="prev">

									<i class="m-icon-big-swapleft m-icon-white"></i>

									</a>

									<a class="carousel-control right" href="#myCarousel" data-slide="next">

									<i class="m-icon-big-swapright m-icon-white"></i>

									</a>

								</div>

								
								<div class="top-news">

									<a href="<%=basePath %>/admin3?news_type=1" class="btn blue">

									<span>热门新闻</span>

									<em>

									<i class="icon-tags"></i>

									中国财经

									</em>

									<i class="icon- icon-bullhorn top-news-icon"></i>                             

									</a>

								</div>
								
								 <c:forEach items="${list1}" var="l" varStatus="s">
									<c:if test="${s.index<3 }">
									<div class="news-blocks">

									<h3><a href="<%=basePath %>/admin2?news_id=${l.news_id }">${l.news_title} </a></h3>

									<div class="news-block-tags">

										<strong>${l.news_source}</strong>

										<em>${l.news_time}</em>

									</div>

									<p style="height:200px;"><img class="news-block-img pull-right" src="<%= basePath%>/static/media/image/image2.jpg" alt="">${l.news_content} </p>

									<a href="<%=basePath %>/admin2?news_id=${l.news_id }" class="news-block-btn">

									更多   
									

									<i class="m-icon-swapright m-icon-black"></i>                              

									</a>                          

								</div>
								</c:if>
								</c:forEach>


								

							</div>

							<!--end span5-->

							<div class="span4">
							
							    
								<div class="top-news">

									<a href="<%=basePath %>/admin3?news_type=2" class="btn red">

									<span>财经新闻</span>

									<em>

									<i class="icon-tags"></i>

									同花顺财经

									</em>

									<i class="icon-globe top-news-icon"></i>

									</a>

								</div>

								<c:forEach items="${list2}" var="l" varStatus="s">
									<c:if test="${s.index<2 }">
									<div class="news-blocks">

									<h3><a href="<%=basePath %>/admin2?news_id=${l.news_id }">${l.news_title} </a></h3>

									<div class="news-block-tags">

										<strong>${l.news_source}</strong>

										<em>${l.news_time}</em>

									</div>

									<p style="height:200px;"><img class="news-block-img pull-right" src="<%= basePath%>/static/media/image/image1.jpg" alt="">${l.news_content} </p>

									<a href="<%=basePath %>/admin2?news_id=${l.news_id }" class="news-block-btn">

									更多

									<i class="m-icon-swapright m-icon-black"></i>                              

									</a>                          

								</div>
								</c:if>
								</c:forEach>
								
								
								<div class="top-news">						
									<a href="<%=basePath %>/admin3?news_type=3" class="btn green">

									<span>市场新闻</span>

									<em>

									<i class="icon-tags"></i>

									Money, Business, Google

									</em>

									<i class="icon-briefcase top-news-icon"></i>

									</a>

								</div>

								 <c:forEach items="${list3}" var="l" varStatus="s">
									<c:if test="${s.index<2 }">
									<div class="news-blocks">

									<h3><a href="<%=basePath %>/admin2?news_id=${l.news_id }">${l.news_title} </a></h3>

									<div class="news-block-tags">

										<strong>${l.news_source}</strong>

										<em>${l.news_time}</em>

									</div>

									<p style="height:200px;"><img class="news-block-img pull-right" src="<%= basePath%>/static/media/image/image1.jpg" alt="">${l.news_content} </p>

									<a href="<%=basePath %>/admin2?news_id=${l.news_id }" class="news-block-btn">

									更多

									<i class="m-icon-swapright m-icon-black"></i>                              

									</a>                          

								</div>
								</c:if>
								</c:forEach>
								
								
								
							
							</div>

							<!--end span4-->

							<div class="span3" style="width:23.076923%">
								<div class="top-news">

									<a href="<%=basePath %>/admin3?news_type=4" class="btn purple">

									<span>专题新闻</span>

									<em>

									<i class="icon-tags"></i>

									Hi-Tech, Medicine, Space

									</em>

									<i class="icon-beaker top-news-icon"></i>

									</a>

								</div>

								 <c:forEach items="${list4}" var="l" varStatus="s">
									<c:if test="${s.index<2 }">
									<div class="news-blocks">

									<h3><a href="<%=basePath %>/admin2?news_id=${l.news_id }">${l.news_title} </a></h3>

									<div class="news-block-tags">

										<strong>${l.news_source}</strong>

										<em>${l.news_time}</em>

									</div>

									<p style="height:200px;"><img class="news-block-img pull-right" src="<%= basePath%>/static/media/image/image1.jpg" alt="">${l.news_content} </p>

									<a href="<%=basePath %>/admin2?news_id=${l.news_id }" class="news-block-btn">

									更多

									<i class="m-icon-swapright m-icon-black"></i>                              

									</a>                          

								</div>
								</c:if>
								</c:forEach>

								
								<div class="top-news">

									<a href="<%=basePath %>/admin3?news_type=5" class="btn yellow">

									<span>国际股市</span>

									<em>

									<i class="icon-tags"></i>

									Football, Swimming, Tennis 

									</em>

									<i class="icon-trophy top-news-icon"></i>

									</a>

								</div>
				 
				 <c:forEach items="${list5}" var="l" varStatus="s">
									<c:if test="${s.index<2 }">
									<div class="news-blocks">

									<h3><a href="<%=basePath %>/admin2?news_id=${l.news_id }">${l.news_title} </a></h3>

									<div class="news-block-tags">

										<strong>${l.news_source}</strong>

										<em>${l.news_time}</em>

									</div>

									<p style="height:200px;"><img class="news-block-img pull-right" src="<%= basePath%>/static/media/image/image1.jpg" alt="">${l.news_content} </p>

									<a href="<%=basePath %>/admin2?news_id=${l.news_id }" class="news-block-btn">

									更多

									<i class="m-icon-swapright m-icon-black"></i>                              

									</a>                          

								</div>
								</c:if>
								</c:forEach>
									
									 
                                
									
									                        

								</div>

							</div>

							<!--end span3-->

						</div>
							<!--end span6-->

						</div>
						

						<div class="space20"></div>

						<h2>News Feeds</h2>

						<div class="row-fluid top-news">

							<div class="span3">

								<a href="#" class="btn red">

								<span>同花顺</span>

								<em>Posted on: April 16, 2013</em>

								<em>

								<i class="icon-tags"></i>

								Money, Business, Google

								</em>

								<i class="icon-briefcase top-news-icon"></i>

								</a>

							</div>

							<div class="span3">

								<a href="#" class="btn green">

								<span>新浪财经</span>

								<em>Posted on: April 15, 2013</em>

								<em>

								<i class="icon-tags"></i>

								Internet, Music, People

								</em>

								<i class="icon-music top-news-icon"></i>                             

								</a>

							</div>

							<div class="span3">

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

							<div class="span3">

								<a href="#" class="btn yellow">

								<span>大秦财经</span>

								<em>Posted on: April 13, 2013</em>

								<em>

								<i class="icon-tags"></i>

								Education, Students, Canada

								</em>

								<i class="icon-book top-news-icon"></i>                              

								</a>

							</div>

						</div>

						<div class="row-fluid top-news">

							<div class="span3">

								<a href="#" class="btn green">

								<span>Top Week</span>

								<em>Posted on: April 15, 2013</em>

								<em>

								<i class="icon-tags"></i>

								Internet, Music, People

								</em>

								<i class="icon-music top-news-icon"></i>                             

								</a>

							</div>

							<div class="span3">

								<a href="#" class="btn yellow">

								<span>Study Abroad</span>

								<em>Posted on: April 13, 2013</em>

								<em>

								<i class="icon-tags"></i>

								Education, Students, Canada

								</em>

								<i class="icon-book top-news-icon"></i>                              

								</a>

							</div>

							<div class="span3">

								<a href="#" class="btn red">

								<span>Metronic News</span>

								<em>Posted on: April 16, 2016</em>

								<em>

								<i class="icon-tags"></i>

								Money, Business, Google

								</em>

								<i class="icon-briefcase top-news-icon"></i>

								</a>

							</div>

							<div class="span3">

								<a href="#" class="btn blue">

								<span>Gold Price Falls</span>

								<em>Posted on: April 14, 2013</em>

								<em>

								<i class="icon-tags"></i>

								USA, Business, Apple

								</em>

								<i class="icon-globe top-news-icon"></i>                             

								</a>

							</div>

						</div>

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

	<script src="<%= basePath%>/static/media/js/excanvas.min.js"></script>

	<script src="<%= basePath%>/static/media/js/respond.min.js"></script>  

	<![endif]-->   
	<script src="<%= basePath%>/static/media/js/validation.js" type="text/javascript"></script>

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