<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<body style="z-index:1000; top:0;">
<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		
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
						<div class="input-box" style="height:30px;"></div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start ">
					<a href="admin">
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
							<a href="<%=basePath %>/collect?u_id=${user.u_id }">查看我收藏的股票</a>
							</c:if>
							<c:if test="${user.u_id==null }">
							<a data-toggle="modal" data-target="#myModal" >查看我收藏的股票</a>
							</c:if>
						</li>
					</ul>
				</li>
				<!-- <li class="">
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
				</li> -->
				<li >
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">新闻中心</span>
					<span class="selected"></span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="admin">
							<i class="icon-coffee"></i>
							行业新闻</a>
						</li>
					</ul>
				</li>
				<li class="">
					<a href="javascript:;">
					<i class="icon-bookmark-empty"></i> 
					<span class="title">股票信息</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a  href="<%=basePath%>/stock_query1?pagenum=0">
							查看股票信息</a>
						</li>
					</ul>
				</li>
			</ul>
			
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		</div>
</body>