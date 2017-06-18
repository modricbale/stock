<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<li class="active">
							<a href="#" class="dropdown-toggle">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 新闻信息管理 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								
								
								<li>
									<a href="#" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										新闻一览
										<b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
										<li >
											<a href="/stock/scannews?flag=today&page=1" >
										今日新闻一览
											</a>
										</li>
									
									
										<li >
											<a href="/stock/scannews?flag=week&page=1" >
										最近一周新闻一览
											</a>
										</li>
									
										<li >
											<a href="/stock/scannews?flag=month&page=1" >
										最近一月新闻一览
											</a>
										</li>
										
										<li >
											<a href="/stock/scannews?flag=all&page=1" >
										历史新闻一览
											</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										公司新闻
										<b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
										<li >
											<a href="/stock/news_company_today" >
										今日新闻相关公司
											</a>
										</li>
																		
										<li >
											<a href="/stock/news_company_today" >
										今日新增上市公司
											</a>
										</li>	
										
										<li >
											<a href="/stock/statistics" >
										新闻来源统计
											</a>
										</li>	
										<li >
											<a href="/stock/statistics" >
										新闻行业分布
											</a>
										</li>
										<li >
											<a href="/stock/news_statistics" >
										各行业今日新闻增加统计
											</a>
										</li>									
									</ul>
								</li>

								<li>
									<a href="/stock/spider" >
										<i class="icon-double-angle-right"></i>
										爬虫状态统计
										
									</a>
									
								</li>
							</ul>
						</li>











						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 股票信息管理 </span>		
								<b class="arrow icon-angle-down"></b>						
							</a>
							<ul class="submenu">
										<li>
										<a href="#" class="dropdown-toggle">
											<i class="icon-double-angle-right"></i>
												股票一览
											<b class="arrow icon-angle-down"></b>
										</a>
										<ul class="submenu">
										<li >
											<a href="/stock/scanstock?flag=today" >
												今日股票最新数据
											</a>
										</li>
																		
										<li >
											<a href="/stock/scanstock?flag=week" >
												最近一周股票数据
											</a>
										</li>	
										
										<li >
											<a href="/stock/scanstock?flag=month" >
												最近一个月股票数据
											</a>
										</li>	
										<li >
											<a href="/stock/scanstock?flag=all" >
												07年至今所有数据统计
											</a>
										</li>
																		
									</ul>										
										</li>
																		
										<li>
											<a href="/stock/stock_statistics" >
												大盘走势统计
											</a>
										</li>
										<li>
											<a href="/stock/spider" >
												爬虫状态统计
											</a>
										</li>									
									</ul>
						</li>
					
						<li>
							<a href="/stock/behavior" >
								<i class="icon-desktop"></i>
								<span class="menu-text"> 用户行为统计 </span>							
							</a>							
						<li>
							<a href="/stock/statistics" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> 网站流量统计 </span>

								
							</a>
								
								
							
						</li>

						
				
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
</body>
</html>