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
	<!-- Modal -->

<style type="text/css">
		#search{
		text-align: center;
		position:relative;
		}
		.autocomplete{
		border: 1px solid #9ACCFB;
		background-color: white;
		text-align: left;
		}
		.autocomplete li{
		list-style-type: none;
		}
		.clickable {
		cursor: default;
		}
		.highlight {
		background-color: #9ACCFB;
		}
		.drop{
		position:absolute;
		left:0px;
		top:34px;
		width:219px;
		background:#fff;
		border:2px solid #ccc;
		
		}
		.odd{
		background:#e7e7e7;
		}
		.drop_ul{
		width:100%;
		height:auto;
		margin:0px;
		}
		.drop_li{
		padding-top:5px;
		padding-bottom:5px;
		width:100%;
		height:40px;
	
		}
		.drop_li p{
		padding-left:10px;
		line-height:40px;
		width:45%;
		height:40px;
		color:#333;
		font-size:16px;
		float:left;
		}
		</style>
		
		<script type="text/javascript" src="<%= basePath%>/static/media/js/jquery.js"></script>

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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
      </div>
     	<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<form action="userLogin" method="post" onsubmit="return loginValidation();">
				<h3 class="form-title">登录账户</h3>
				
				<div class="alert alert-error hide">
					<button class="close" data-dismiss="alert"></button>
					<span>Enter any username and password.</span>
				</div>
				
				<div class="control-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
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
				
				<div class="control-group">
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
	
				<div class="form-actions">
					<button type="submit" class="btn green pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
					</button>            
				</div>
	
				<div class="forget-password">
					<p>忘记密码 ？</p>
					<p>
						不要担心，点击 <a href="javascript:;" class="" id="forget-password">这里</a>
						重置密码.
					</p>
				</div>
	
				<div class="create-account">
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
	

				<!-- END PAGE HEADER-->

	   				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">
					<div class="inbox-header">

							<form action="/stock/stock_detail1" class="form-search pull-right">

								<div class="input-append" style="position:relative">
									<div class="drop">
										<ul class="drop_ul">
											
									
										</ul>
									</div>
									<input id='search' name="stockCd" class="m-wrap" type="text" placeholder="Search Mail">

									<button class="btn green" type="submit">Search</button>

								</div>

							</form>

						</div>


						<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>股票基本信息</div>

							</div>

							<div class="portlet-body">

								<div class="clearfix">



								</div>

								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">

								 <thead>
                                <tr>
                                    <th>股票代码</th>
                                    <th>股票简称</th>
                                    <th>股票类别</th>
                                    <th>总股本</th>
                                    <th>公司无限售流通股份合计</th>
                                    <th>无线售流通股本</th>
                                    <th>所有者权益合计</th>
                                    <th>收藏</th>
                                </tr>
                                </thead>
                                
                               
                               <c:forEach items="${ stocks}" var="stock">
                                                 
                                <tr class="">
                                    <td><a href="/stock/stock_detail?stockCd=${stock.stock_cd}">${stock.stock_cd}</td>
                                    <td>${stock.sec_short_name}</td>
                                    <td>${stock.stock_type}</td>
                                    <td>${stock.total_shares }</td>
                                    <td>${stock.nonrest_float_capital_stock }</td>
                                    <td>${stock.nonrest_float_shares }</td>
                                    <td>${stock.total_equity }</td>
                                    
                                    
                                   	<c:if test="${user.u_id!=null }">
                                    <td><a input type = "button"  class = "btn blue" id="shaoshuai" onclick = "papa('${stock.stock_cd}')" >收藏</a></td>
                               		</c:if>
                               	
                               		<c:if test="${user.u_id==null }">
                                    <td><a input type = "button"  class = "btn blue" id="shaoshuai" data-toggle="modal" data-target="#myModal" >收藏</a></td>
                               		</c:if>
                               	
                               		
                                </tr> 
                                     
                          
                                                    
                                </c:forEach>
                                
                               
                                <script type="text/javascript">
                             
                                function papa(stockcd){
                                	var stock_cd = stockcd;
                                	//alert(stock_id);
                                    var u_id =${user.u_id};                
                                    $.ajax({
                                        url:'admin9',
                                        cache:false,
                                        type:'post',
                                        async:true,
                                        dataType:'html',
                                        data:{
                                            "stock_cd":stock_cd,
                                            "u_id":u_id,
                                            contentType: "application/x-www-form-urlencoded;charset=utf-8"
                                        },
                                        success:function (msg){
                                            if(msg == 'success'){alert('收藏成功');};
                                            if(msg=='fail'){alert('该股票您已收藏')}
                                        }

                                    })
                                }


                                    // 当<a>触发click时，处理业务
                                </script>   
                                

                                
                                
                                
                                
                                </tbody>

								</table>

							</div>

						</div>

						<!-- END EXAMPLE TABLE PORTLET-->

					<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>股票价格信息</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<div class="clearfix">



								</div>

								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">

								 <thead>
                                <tr>
                                    <th>股票代码</th>
                                 
                                    <th class="numeric">当前价格</th>
                                    <th class="numeric">涨跌金额</th>
                                    <th class="numeric">涨跌率</th>
                                    <th class="numeric">今日最低价</th>
                                    <th class="numeric">今日最高价</th>
                                    <th class="numeric">今日开盘价</th>
                                    <th class="numeric">昨日收盘价</th>
                                    <th class="numeric">成交股票数</th>
                                    <th class="numeric">成交金额</th>
                                    <th >最近更新日期</th>
                                    <th >最近更新时间</th>
                                </tr>
                                </thead>
                                
                               
                               <c:forEach items="${ stockPrices}" var="sp">
                                                 
                                <tr class="">
                                    <td><a href="/stock/show_graph?stockCd=${sp.sp_code}">${sp.sp_code}</a></td>
                                   
                                    <td>${sp.curr_pri }</td>
                                    <c:if test="${sp.updown_money >= 0}">
	                                    <td style="color:red">+${sp.updown_money }</td>
                                    </c:if>
                                    <c:if test="${sp.updown_money < 0}">
                                    	<td style="color:#00DB00">${sp.updown_money }</td>
                                    </c:if>
                                     
                                    <c:if test="${sp.updown_rate >= 0}">
                                    	<td style="color:red">+${sp.updown_rate }</td>                                    
                                    </c:if>
                                    <c:if test="${sp.updown_rate < 0}">
	                                    <td style="color:#00DB00">${sp.updown_money }</td>
                                    </c:if>
                                     
                                    <td>${sp.tod_min_pri }</td>
                                    <td>${sp.tod_max_pri }</td>
                                    <td>${sp.tod_opening_pri}</td>
                                    <td>${sp.yes_closing_pri}</td>
                                    <td>${sp.trade_stocks }</td>
                                    <td>${sp.turn_pri }</td>
                                    <td>${sp.sp_date }</td>
                                    <td>${sp.sp_time }</td>
                                </tr> 
                                                             
                                </c:forEach>
                                
                                </tbody>

								</table>
								<div class="pagination" style="text-align: center;">
									<ul>
										<li><a href="#">共  ${pager.recordCount } 条数据，每页  ${pager.pageSize } 条，共  ${pager.pageCount } 页，当前是第  ${pager.pageNum } 页</a></li>	
									</ul>
								</div>
								    
								<div class="pagination pagination-centered">
									<ul>
										<li ${pager.pageNum==1?'class="disabled"':''}><a href="stock_query?pageNum=1">首页</a></li>
										<li ${pager.pageNum==1?'class="disabled"':''}><a href="stock_query?pageNum=${pager.pageNum-1 }">上页</a></li>		
										<li ${pager.pageNum==pager.pageCount?'class="disabled"':''}><a href="stock_query?pageNum=${pager.pageNum+1 }">下页</a></li>
										<li ${pager.pageNum==pager.pageCount?'class="disabled"':''}><a href="stock_query?pageNum=${pager.pageCount }">末页</a></li>
										<li><a >转到 </a></li>
										<li><a><input id="changePage" type="text" style="width: 35px;padding:0px;margin:-3px;" /></a></li>
										<li><a>页 </a></li>
										<li><a href="javascript:goPage();">跳转</a></li>		
									</ul>
								</div>

							</div>

						</div>

						<!-- END EXAMPLE TABLE PORTLET-->
					<div class="headline">

					<h3>股市大牛</h3>

				</div>

				<ul class="thumbnails">

					<%HashMap<String, ArrayList<String>> hmcollect =(HashMap<String, ArrayList<String>> ) request.getAttribute("hmcollect"); 
					HashMap<String, Map<String, Integer>>hmscan =(HashMap<String, Map<String, Integer>> ) request.getAttribute("hmscan"); 
					%>
					<%ArrayList<String> text = new ArrayList<String>();
					text.add(basePath+"/static/media/image/2.jpg");
					text.add(basePath+"/static/media/image/3.jpg");
					text.add(basePath+"/static/media/image/5.jpg");
					
					%>
							<%Set<String>set = hmcollect.keySet();
							  
							  Iterator<String> it = set.iterator();
							  
							%>
							<%int h=0; %>
							<% while(it.hasNext()){%>
							
							<%String name = it.next(); %>
						<li class="span3"  style="width:200px">
							<div class="meet-our-team">
							<h3><%=name %> </h3>

							<img src=<%=text.get(h) %> alt="" />

						<%h++; %>
							<div class="team-info">

								<p><%=name%>最近浏览了<%=hmcollect.get(name).get(0) %></p>
								<p><%=name%>最近浏览了<%=hmcollect.get(name).get(1) %></p>
								<%Set<String>set1 = hmscan.get(name).keySet();
								Iterator<String> it1 = set1.iterator();
								%>
								<p><%=name%>最近收藏了<%=it1.next() %></p>
								<p><%=name%>最近收藏了<%=it1.next() %></p>

							</div>
						</div>
					</li>
                        <%} %>

				</ul>

				<!--/thumbnails-->

				<!-- //End Meer Our Team -->     
					
					</div>

				</div>

				<!-- END PAGE CONTENT -->


			</div>

			<!-- END PAGE CONTAINER-->

		</div>

		<!-- END PAGE -->

	</div>

	<!-- END CONTAINER -->
<script>
function goPage(){
	 var curPage=document.getElementById("changePage").value * 1;
       if (!/^[1-9]\d*$/.test(curPage)) {
           alert("请输入正整数");
           return ;
       }
       var max = ${pager.pageCount};
       if (curPage > max) {
           alert("超出数据页面");
           return ;
       }
     //  alert(curPage);
       window.location.href = "?pageNum="+curPage;
}

</script>
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

	<script type="text/javascript" src="<%= basePath%>/static/media/js/bootstrap-datepicker.js"></script>

	<script src="<%= basePath%>/static/media/js/jquery.fancybox.pack.js"></script>

	<script src="<%= basePath%>/static/media/js/app.js"></script>

	<script src="<%= basePath%>/static/media/js/search.js"></script>    
	<script src="<%= basePath%>/static/media/js/validation.js" type="text/javascript"></script>
	  

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		   Search.init();

		});

	</script>
	
		<script type="text/javascript">
	  $('#search').val('');
	$("#search").keyup(function(){ 
		$('.drop_ul').css('display','block');
		var key=$(this).val();
		$.ajax({
			type:'post',
			dataType:'json',
			url:'search?key='+key,
			
			success:function(data){
				
				 var ul="";
				 
				$.each(data, function(index,values){   // 解析出data对应的Object数组  
	                 // 遍历Object数组 ，每个对象的值存放在value ，index2表示为第几个对象  
	                    //  根据自己的逻辑进行数据的处理 
	                    if(index%2==0)
	                   ul+="<li class='drop_li'><p style='font-size:18px' class='searchkey'>"+values.stock_cd+"</p> <p>"+values.sec_short_name+"</p></li>";
	                   else{
	                	   ul+="<li class='drop_li odd'><p style='font-size:18px' class='searchkey'>"+values.stock_cd+"</p> <p>"+values.sec_short_name+"</p></li>";
	                   }
	                
	            });
				$('.drop_ul').html(ul);
			
			    
			}

		}); 
	});
	

  $(document).on('click','.drop_li',function(){
              var item=$(this).find('.searchkey');
              var key=item.text();
              $('#search').val(key);
              $('.drop_ul').css('display','none');
              
  });
	
	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>