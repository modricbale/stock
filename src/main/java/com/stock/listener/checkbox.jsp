<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
     String str = (String)application.getAttribute("nisd");
     //System.out.print(str);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
<link href="<%= basePath%>/static/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="<%= basePath%>/static/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<link href="<%= basePath%>/static/media/css/jquery.fancybox.css" rel="stylesheet" />

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="<%= basePath%>/static/media/css/news.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="<%= basePath%>/static/media/image/favicon.ico" />
	
</head>
<body>
	<form action="checkbox1" name="form" id="form" method="post">
		  项目属性：<input type="text" id="text1" name="input1" ><br/>
		  项目属性：<input type="text" id="text2" name="input2"><br/>
		  项目属性：<input type="text" id="text3" name="input3"><br/>
	  <input name="chkItem" type="checkbox" value="今日话题" />今日话题
	    <input type="hidden" name="csfId" id="csfId1" value="1"> 
	    
        <input name="chkItem" type="checkbox" value="视觉焦点" />视觉焦点
         <input type="hidden" name="视觉焦点" id="csfId2" value="2"> 
	    
        <input name="chkItem" type="checkbox" value="财经" />财经
         <input type="hidden" name="财经" id="csfId3" value="${nisd }"> 
	    
        <input name="chkItem" type="checkbox" value="汽车" />汽车
         <input type="hidden" name="汽车" id="csfId4" value="4"> 
	    
        <input name="chkItem" type="checkbox" value="科技" />科技
         <input type="hidden" name="科技" id="csfId5" value="5"> 
	    
        <input name="chkItem" type="checkbox" value="房产" />房产
         <input type="hidden" name="房产" id="csfId6" value="6"> 
	    
        <input name="chkItem" type="checkbox" value="旅游" />旅游        
         <input type="hidden" name="旅游" id="csfId7" value="7"> 
	    
        <input type="submit"  value="提交">
	</form>
</body>

	<script src="<%= basePath%>/static/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="<%= basePath%>/static/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="<%= basePath%>/static/media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="<%= basePath%>/static/media/js/excanvas.min.js"></script>

	<script src="<%= basePath%>/static/media/js/respond.min.js"></script>  

	<![endif]-->   
	<script src="<%= basePath%>/static/media/js/jquery.validate.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="<%= basePath%>/static/media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="<%= basePath%>/static/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
	<script src="<%= basePath%>/static/media/js/ajaxfileupload.js" type="text/javascript"></script>

	<!-- END CORE PLUGINS -->

	<script src="<%= basePath%>/static/media/js/app.js"></script>      

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->
</html>