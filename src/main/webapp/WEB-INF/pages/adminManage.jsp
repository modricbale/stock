<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	//request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Metronic | Data Tables - Editable Tables</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <script src="http://code.jquery.com/jquery-1.11.1.js"></script>
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
    <link rel="stylesheet" type="text/css" href="<%= basePath%>/static/media/css/select2_metro.css" />
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
                        <span class="username">管理员：张玉筱</span>
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
        
            <jsp:include page="/static/left_manager.jsp"/>
            
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
                        管理员管理界面
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-th"></i>
                            <a href="index.html">管理用户</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">修改用户</a>
                        </li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-edit"></i>修改用户</div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                <a href="javascript:;" class="reload"></a>
                                <a href="javascript:;" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="clearfix">
                                <div class="btn-group">
                                    <button id="sample_editable_1_new" class="btn green">
                                        增加新用户 <i class="icon-plus"></i>
                                    </button>
                                </div>
                               
                            </div>
                            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">   
                                <thead>
                                <tr>
                                    
                                    <th>用户名</th>
                                    <th>用户密码</th>
                                    <th>用户类型</th>
                                    <th>用户昵称</th>
                                    <th>用户性别</th>
                                    <th>用户邮箱</th>
                                    <th>用户电话</th>
                                    <th>用户简介</th>
                                    <th>操作</th>
                                    <th>操作</th>
                                    <th>查看用户详情</th>
                                </tr>
                                </thead>
                                
                               
                               <c:forEach items="${list}" var="l">
                                             
                                <tr class="">
                                
                                    
                                    <td>${l.u_name}</td>
                                    <td>${l.u_psd }</td>
                                    <td> ${l.u_type}</td>
                                    <td>${l.u_nickname }</td>
                                    <td>${l.u_sex }</td>
                                    <td>${l.u_email }</td>
                                    <td>${l.u_phone }</td>
                                    <td>${l.u_introduce }</td>
                                    <td><a class="edit" href="">编辑</a></td>
                                    <td><a class="" href="<%=basePath %>/user_delete_by_id?id=${l.u_id }">删除</a></td>
                                    <td><a class="" href="<%=basePath %>/user_trace?id=${l.u_id }">查看用户详情</a></td>
                                </tr> 
                                                             
                                </c:forEach>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2013 &copy; Metronic by 张玉筱
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
<script src="<%= basePath%>/static/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%= basePath%>/static/media/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%= basePath%>/static/media/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="<%= basePath%>/static/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="<%= basePath%>/static/media/js/select2.min.js"></script>
<script type="text/javascript" src="<%= basePath%>/static/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="<%= basePath%>/static/media/js/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%= basePath%>/static/media/js/app.js"></script>
<script src="<%= basePath%>/static/media/js/table-editable.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        TableEditable.init();
    });
</script>
<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>
<!-- END BODY -->
</html>