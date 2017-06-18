<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" 
import="com.stock.pojo.Upload"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>请下载</title>
</head>
<body>
<div>
	<c:forEach items="${list}" var="l">
		${l.upload_name } <a href="<%=basePath %>/download?upload_id=${l.upload_id }">下载</a>
		<br>
	</c:forEach>
</div>
</body>
</html>