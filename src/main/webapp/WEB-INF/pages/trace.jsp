<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	ArrayList<String>arr = (ArrayList<String>)request.getAttribute("news_trace");
	ArrayList<String>arr1 = (ArrayList<String>)request.getAttribute("stock_trace");
	ArrayList<String>arr2 = (ArrayList<String>)request.getAttribute("all_trace");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	 <div  class="news-block-tags">
	 
	 <%int i=0; %>
	 <c:forEach items="${news_trace}" var="t" >
		
	 <td><%=arr.get(i)%></td>
	 
	 <%i++; %>				
								
	</c:forEach><br>
	<%int j=0; %>
	 <c:forEach items="${stock_trace}" var="t" >
		
	
	 <td><%=arr1.get(j)%></td>
	 <%j++; %>				
								
	</c:forEach><br>
		<%int k=0; %>
	 <c:forEach items="${all_trace}" var="t" >
		
	
	 <td><%=arr2.get(k)%></td><br>
	 <%k++; %>				
								
	</c:forEach><br>
	</div>
</body>
</html>