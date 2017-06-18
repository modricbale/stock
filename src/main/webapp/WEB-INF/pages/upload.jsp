<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
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
	<form id="form_pa" name = "form_pa">
		  上传用户：<input type="text" id="username" name="username"><br/>
	              上传文件1：<input type="file"  id="file1" name="file1" accept="image/*"><br/>
                          上传文件2：<input type="file" id="file2" name="file2"><br/>
         <input type="button" onclick="submithaha();" value="提交">
	</form>
	<script type="text/javascript">
	function getImgURL(node) {

	    var imgURL = "";
	    try{
	        var file = null;
	        if(node.files && node.files[0] ){
	            file = node.files[0];
	        }else if(node.files && node.files.item(0)) {
	            file = node.files.item(0);
	        }
	        //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
	        try{
	            //Firefox7.0
	            imgURL =  file.getAsDataURL();
	            //alert("//Firefox7.0"+imgRUL);
	        }catch(e){
	            //Firefox8.0以上
	            imgURL = window.URL.createObjectURL(file);
	            //alert("//Firefox8.0以上"+imgRUL);
	        }
	    }catch(e){      //这里不知道怎么处理了，如果是遨游的话会报这个异常
	        //支持html5的浏览器,比如高版本的firefox、chrome、ie10
	        if (node.files && node.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                imgURL = e.target.result;
	            };
	            reader.readAsDataURL(node.files[0]);
	        }
	    }
	    return imgURL;
	}
	
	
	
	//webObj.HttpAddPostFile("attachment", getPath(document.getElementById("attachment")));

	function submithaha(){
		
		//var username = document.getElementById("username").value;
		//var file1 = document.getElementById("file1");
		//var tmp = document.getElementById("file1");
		//var file2 = document.getElementById("file2").value;2
		//var path1 = getImgURL(tmp);
		//var path2 = getImgURL(file1);
		//alert(path1);
		//alert(path2);
		//var path = getPath(file1);
		//alert(path);
		//var path2 = getPath(tmp);
		//alert(path2);
		var form = new FormData();
	//	form.append('username', $('#username')[0].files[0]);
		form.append('file1', $('#file1')[0].files[0]);
		//form.append('file2', $('#file2')[0].files[0]);
		//form.append("username",username);
		//form.append("file1",file1);
		//form.append("file2",file2)
		
	 $.ajax({  
      	    url:'upload',
      	             
      	    cache:false,  
            
      	    type:'post',  
            
      	    data:form,
            
      	    processData:false,
            
            contentType:false,
            
         	success:function (msg){
           
         	if(msg == 'success'){alert('success');};
           }            
       })
        }

	
	
	
	
	
	
	
	
	
	
	
	   function getPath(obj)  
       {  
         if(obj)  
           {  
        
           if (window.navigator.userAgent.indexOf("MSIE")>=1)  
             {  
               obj.select();  
        
             return document.selection.createRange().text;  
             }  
        
           else if(window.navigator.userAgent.indexOf("Firefox")>=1)  
             {  
             if(obj.files)  
               {  
        
               return obj.files.item(0).getAsDataURL();  
               }  
             return obj.value;  
             }  
           return obj.value;  
           }  
       }  
	
	
	
	
	
	
	
	
	
	</script>
	
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