  <%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	List<Map.Entry<String, Double>> scoremap=(List<Map.Entry<String, Double>>) request.getAttribute("scoremap");
	List<Map.Entry<String, Double>> scoremap1=(List<Map.Entry<String, Double>>) request.getAttribute("scoremap1");
%>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<head>
		<title>饼图</title>
		<!--<script src="js/Chart.js"></script>-->
		<!--<script src="js/Chart.min.js"></script>-->
		<script src="<%= basePath%>/static/media/js/Chart-1.0.1-beta.4.js"></script>

	</head>



	<body>
		<canvas id="myChart" width="300" height="300"></canvas>
		<canvas id="myChart1" width="300" height="300"></canvas>
		<canvas id="myChart2" width="300" height="300"></canvas>
		<canvas id="myChart3" width="300" height="300"></canvas>
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
								<%=arrtime.get(i)%>,
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
	<div>
	 <td><hr>最近热门新闻：<hr></td>	
	 <%for(int i=0;i<scoremap.size()&&i<5;i++){%>
	 
	 <%String name = scoremap.get(i).getKey(); %>

	 <td><a href="<%=basePath %>/indexpa?index=<%=i%>"><%=name%></td>	<br>			
	
	<%} %><br>
	</div>
	
	
	 <div>
	  <td><hr>最近热门股票：<hr></td>	
	 <%for(int j=0;j<scoremap1.size()&&j<5;j++){%>
	 
	 <%String name = scoremap1.get(j).getKey(); %>

	 <td><a href="<%=basePath %>/indexpa1?index=<%=j%>"><%=name%></td>	<br>			
	
	<%} %><br>
	</div>
	</body>
</html>





