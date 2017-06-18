<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>微博舆情分析 - Home</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- 
    Visual Admin Template
    http://www.templatemo.com/preview/templatemo_455_visual_admin
    -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
	<script src="js/jquery-1.11.2.min.js"></script>
<!-- 动画css开始 -->
<!-- 以下信息与演示无关，可不必理会 -->
<style>
* { margin: 0; padding: 0;}
ul { list-style-type: none;}
.nav { width: 1000px; margin: 0 auto 20px; text-align: center; font-size: 0;}
.nav li { display: inline-block; margin: 0 5px; padding: 10px 20px; font-size: 14px; color: #333; background-color: #ccc; cursor: pointer;}
.nav .active { color: #fff; background-color: #21b384;}
.sucaihuo { width: 1000px; margin: 0 auto; font-size: 0;}
.filtr-item { display: inline-block; width: 230px; padding: 10px;}
.filtr-item img { width: 100%; height: 131px;}
</style>

<!-- 动画css结束 -->
  </head>
  <body>  
  


    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>Visual Admin</h1>
        </header>
        <div class="profile-photo-container">
          <img src="img/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="index.jsp" ><i class="fa fa-home fa-fw"></i>今日热点</a></li>
            <li><a href="#" class="active"><i class="fa fa-bar-chart fa-fw"></i>近期要闻</a></li>
            <li><a href="data-visualization.html"><i class="fa fa-database fa-fw"></i>Data Visualization</a></li>
            <li><a href="maps.html"><i class="fa fa-map-marker fa-fw"></i>Maps</a></li>
            <li><a href="manage-users.html"><i class="fa fa-users fa-fw"></i>Manage Users</a></li>
            <li><a href="preferences.html"><i class="fa fa-sliders fa-fw"></i>Preferences</a></li>
            <li><a href="login.html"><i class="fa fa-eject fa-fw"></i>Sign Out</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="" class="active">Admin panel</a></li>
                <li><a href="">Dashboard</a></li>
                <li><a href="">Overview</a></li>
                <li><a href="login.html">Sign in form</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">
         
       

<ul class="nav">
	<li class="shuffle-btn" data-shuffle="">7月14号</li>
	<li class="shuffle-btn" data-shuffle="">7月15号</li>
	<li class="shuffle-btn" data-shuffle="">7月16号</li>
	<li class="shuffle-btn" data-shuffle="">7月17号</li>
	<li class="shuffle-btn" data-shuffle="">7月18号</li>
	<!-- <li class="sort-btn" data-sortasc="">顺序</li>-->
	<!-- <li class="sort-btn" data-sortdesc="">倒序</li> -->
</ul>

<div style="padding: 0px; position: relative; height: 453px;" class="sucaihuo">
            <div style="opacity: 1; transform: scale(1) translate3d(750px, 0px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="2">
                <a href="#">
                    <img src="img/city_1.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(500px, 0px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="1">
                <a href="#">
                    <img src="img/city_2.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(0px, 0px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="1">
                <a href="#">
                    <img src="img/city_3.jpg" alt="">
                </a>
            </div>

            <div style="opacity: 1; transform: scale(1) translate3d(250px, 0px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="3">
                <a href="#">
                    <img src="img/industrial_1.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(500px, 151px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="1">
                <a href="#">
                    <img src="img/industrial_2.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(0px, 302px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="2">
                <a href="#">
                    <img src="img/industrial_3.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(250px, 151px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="1">
                <a href="#">
                    <img src="img/nature_1.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(0px, 151px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="2">
                <a href="#">
                    <img src="img/nature_2.jpg" alt="">
                </a>
            </div>
            <div style="opacity: 1; transform: scale(1) translate3d(750px, 151px, 0px); perspective: 1000px; position: absolute; transition: all 0.5s ease-out 0ms;" class="filtr-item" data-category="2">
                <a href="#">
                    <img src="img/nature_3.jpg" alt="">
                </a>
            </div>
        </div>


<script>
$(function() {
	$('.sucaihuo').filterizr();

	$('.nav li').on('click', function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
});
</script>

     
          <footer class="text-right">
            <p>Copyright © 2084 Company Name 
            | Designed by <a href="http://www.templatemo.com" target="_parent">templatemo</a></p>
          </footer>         
        </div>
      </div>
    </div>

	<!-- JS -->
	<script src="js/jquery.filterizr.js"></script>
	<!-- jQuery -->
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<!--  jQuery Migrate Plugin -->

	<script type="text/javascript" src="js/templatemo-script.js"></script>
	<!-- Templatemo Script -->

  
</body>
</html>