<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
	<body>
		<!-- BEGIN CONTAINER -->
		<div class="page-container row-fluid" style="position:fixed; z-index:1000; top:0;">
			<!-- BEGIN SIDEBAR -->
			<div class="page-sidebar nav-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<ul class="page-sidebar-menu">
					<li>
						<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
						<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					</li>
					<li>
						<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
						<form class="sidebar-search">
							<div class="input-box" style="height: 30px;"></div>
						</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
					</li>
					<li class="start "><a href="admin"> <i class="icon-home"></i>
						<span class="title">股票信息中心</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="icon-user"></i> <span class="title">管理用户</span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li class=""><a href="">管理员管理用户</a></li>
						</ul></li>
					<li class=""><a href="javascript:;"> <i class="icon-th"></i>
							<span class="title">管理新闻</span> <span class="selected"></span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a href="">管理新闻信息</a></li>
						</ul></li>
					<li class=""><a href="javascript:;"> <i
							class="icon-file-text"></i> <span class="title">管理评论</span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a href="portlet_general.html">管理评论信息</a></li>
						</ul></li>
					<li class="last "><a href="<%=basePath %>/admin88"> <i
							class="icon-bar-chart"></i> <span class="title">查看用户信息统计</span>
					</a></li>
				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
			<!-- END SIDEBAR -->
		</div>
	</body>
</html>
