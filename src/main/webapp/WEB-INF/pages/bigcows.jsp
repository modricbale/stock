<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	HashMap<String, ArrayList<String>> hmcollect =(HashMap<String, ArrayList<String>>) request.getAttribute("hmcollect");
	HashMap<String, Map<String, Integer>>hmscan = (HashMap<String, Map<String, Integer>>)request.getAttribute("hmscan");
	Set<String> nameset = hmcollect.keySet();
	Iterator it = nameset.iterator();
	Iterator it1 = nameset.iterator();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div  class="news-block-tags">
	 <%while(it.hasNext()){%>
	 <c:forEach items="${hmcollect}" var="t" >
	 <%String name = (String)it.next(); %>
	 <td>大牛<%=name %>收藏了</td>
	 <td><%=hmcollect.get(name)%></td>				
	</c:forEach>
	<%} %>
	<br><br>
	
	
	 
	 <%while(it1.hasNext()){%>
	 <c:forEach items="${hmscan}" var="t" >
	 <%String name = (String)it1.next(); %>
	 <td>大牛<%=name %>浏览了</td>
	 <td><%=hmscan.get(name)%></td>				
	</c:forEach>
	<%} %>
	</div>
	
</body>
</html>