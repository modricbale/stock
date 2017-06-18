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
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>comment emotion test</title>
	</head>
	<body>
		<form action="commentMark" method="post">
			<%-- <div>
				<label>评论内容</label>
				<input name="com_content" value="${com_content}"/>
				<label>情感</label>
				<input name="com_emotion" value="${com_emotion}"/>
			</div> --%> 
			
			<div>
				<label>股票id：</label>
				<input name="stock_id" value="${stock_id}"/>
				<label>评论总数：</label>
				<input name="allCommentNum" value="${allCommentNum}"/>
				<label>正向：</label>
				<input name="posNum" value="${posNum}"/>
				<label>逆向：</label>
				<input name="negNum" value="${negNum}"/>
			</div>
		</form>
	</body>
</html>