<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.util.*"
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

	<title>用户主页</title>

	<meta content="width=device-width, height=device-height, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="<%= basePath%>/static/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/font-awesome.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="<%= basePath%>/static/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	
	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link rel="stylesheet" href="<%= basePath%>/static/media/css/DT_bootstrap.css" />

	<!-- END PAGE LEVEL STYLES -->

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

					<li class="start active ">

					<a href="index2.html">

					<i class="icon-home"></i> 

					<span class="title" >股票信息中心</span>
					
					<span class="selected"></span>

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

							查看个人信息</a>

						</li>

						<li >

							<a href="ui_buttons.html">

							修改个人信息</a>

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

					<li class="">

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

							股票行情 <small>所有股票信息</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index2.html">Home</a> 

							</li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN SAMPLE FORM PORTLET-->   

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>Sample Form</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body form">

								<!-- BEGIN FORM-->

								<form action="" class="form-horizontal">

									<div class="control-group">

										<label class="control-label">股票代码</label>

										<div class="controls">

											<input type="text" class="span6 m-wrap" id="stock_cd" name="stock_cd" value="${stock.stock_cd} " placeholder="Disabled input here..." disabled />

										</div>

									</div>
                                    <div class="control-group">

										<label class="control-label">所属证券所</label>
										
                                        <c:if test="${stock.securities=='XSHG' }" >
                                        
										<div class="controls">

											<label class="radio">

											<input type="radio" name="optionsRadios1" value="option1" checked />

											上海证券所

											</label>

											<label class="radio">

											<input type="radio" name="optionsRadios1" value="option2"  />

											深圳证券所
											</label>  

										</div>
                                        </c:if>
                                         <c:if test="${stock.securities!='XSHG' }" >
										<div class="controls">

											<label class="radio">

											<input type="radio" name="optionsRadios1" value="option1"  />

											上海证券所

											</label>

											<label class="radio">

											<input type="radio" name="optionsRadios1" value="option2" checked />

											深圳证券所
											</label>  

										</div>
                                        </c:if>
									</div>

									<div class="control-group">

										<label class="control-label">上市板块</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="list_sector" name="list_sector" value="${stock.list_sector} " placeholder="Disabled input here..." disabled />

											
										</div>

									</div>

									<div class="control-group">

										<label class="control-label">交易货币</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="trans_curr" name="trans_curr" value="${stock.trans_curr} " placeholder="Readonly input here..." disabled />

									

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">简称</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="sec_short_name" name="sec_short_name" value="${stock.sec_short_name} " placeholder="Readonly input here..." disabled />

								

										</div>

									</div>
									
									<div class="control-group">

										<label class="control-label">全称</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="sec_full_name" name="sec_full_name" value="${stock.sec_full_name} " placeholder="Readonly input here..." disabled />

											

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">上市状态</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="list_status" name="list_status" value="${stock.list_status} " placeholder="Readonly input here..." disabled />

										

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">上市日期</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="list_date" name="list_date" value="${stock.list_date} " placeholder="Readonly input here..." disabled />

											

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">股票类别</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="stock_type" name="stock_type" value="${stock.stock_type} " placeholder="Readonly input here..." disabled />

										

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">交易市场所属地区</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="market_country" name="market_country" value="${stock.market_country} " placeholder="Readonly input here..." disabled />

											

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">总股本</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="total_shares" name="total_shares" value="${stock.total_shares} " placeholder="Readonly input here..." disabled />

										

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">无限售流通股本</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="nonrest_float_capital_stock" name="nonrest_float_capital_stock" value="${stock.nonrest_float_capital_stock} " placeholder="Readonly input here..." disabled />

										
										</div>

									</div>
									<div class="control-group">

										<label class="control-label">办公地址</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="office_addr" name="office_addr" value="${stock.office_addr} " placeholder="Readonly input here..." disabled />

										

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">主营业务范围</label>

										<div class="controls">

											<textarea class="span6 m-wrap" rows="3" id="prime_operating" name="prime_operating">${stock.prime_operating}</textarea>

										</div>

									</div>
									<div class="control-group">

										<label class="control-label">所有权益合计</label>

										<div class="controls">

											<input class="span6 m-wrap" type="text" id="total_equity" name="total_equity" value="${stock.total_equity} " placeholder="Readonly input here..." disabled />

										</div>

									    </div>														     
					                    <div align="center">
            
                                        
                                   
                                       </div>
                                       <div class="control-group">

										<label class="control-label">同行业推荐股票</label>

										<div class="controls">
											<c:forEach items="${stockList }" var="s">
											<a  class = "btn blue" href="<%=basePath %>/stock_detail?stockCd=${s.stock_cd}" >${s.sec_short_name} </a>
											</c:forEach>
										</div>
										<br>
										
										
										<%List<Map.Entry<String, Integer>> hMap = (List<Map.Entry<String, Integer>>)request.getAttribute("hMap"); %>
										<%if(hMap!=null){ %>
										<label class="control-label">查看该股票的其他用户还查看了</label>
										<div class="controls">
											<%for(int i=0;i<3&&i<hMap.size();i++){ %>
											<a  class = "btn blue" href="<%=basePath %>/stock_detail2?index=<%=hMap.get(i).getKey() %>" ><%=hMap.get(i).getKey() %> </a>
										<%} %>
										</div>
										<%} %>
									    </div>														     
					                    <div align="center">
            
                                        <input type="button" name="button" id="button" value="返回上一页" onClick="history.back();" class="btn btn-primary">
                                   
                                       </div>
								</form>

								<!-- END FORM-->       

							</div>

						</div>

						<!-- END SAMPLE FORM PORTLET-->

					</div>

				</div>

				<!-- END PAGE CONTENT-->         

			</div>

			<!-- END PAGE CONTAINER-->



			</div>

			<!-- END PAGE CONTAINER-->

		</div>

		<!-- END PAGE -->

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->


	<div class="footer">


		<div class="footer-inner">


			2016 &copy; Metronic by 张玉筱.


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

	<script src="<%= basePath%>/static/media/js/validation.js" type="text/javascript"></script>
	

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


		   // initiate layout and plugins


		   App.init();


		});


	</script>


<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>


<!-- END BODY -->


</html>
</html>
