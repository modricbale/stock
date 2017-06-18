package com.stock.aop;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.hadoop.classification.InterfaceAudience.Private;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.stock.pojo.Collect;
import com.stock.pojo.Comment;
import com.stock.pojo.Log;
import com.stock.pojo.News;
import com.stock.pojo.Reply;
import com.stock.pojo.Stock;
import com.stock.pojo.User;
import com.stock.service.CommentService;
import com.stock.service.LogService;
import com.stock.service.NewsService;
import com.stock.service.StockService;
import com.stock.service.UserService;

@Aspect  
@Component
public class Aop {
	
	@Autowired  
    private LogService logService;
	@Autowired
	private UserService userService;
	@Autowired
	private StockService stockService;
	@Autowired
	private NewsService newsService;
	@Autowired 
	private CommentService commentService; 
	
	 @Pointcut("execution(* com.stock.service.CollectService.insert(..))")  
	    public void insertServiceCall() { }  
	 
	 @Pointcut("execution(* com.stock.controller.LoginController.checkUsernamePwd(..))")  
	    public void loginServiceCall() { }  
	 
	 @Pointcut("execution(* com.stock.service.NewsService.queryNews(..))")  
	    public void queryNewsCall() { }
	
//	 @Pointcut("execution(* com.stock.controller.NewsController.index(..))")  
//	    public void selectByIDCall() { }
	 
	 @Pointcut("execution(* com.stock.controller.ToolsController.index(..))")  
	    public void selectByIDCall() { }
	 
	 @Pointcut("execution(* com.stock.controller.StockController.queryStock(..))")  
	    public void queryStockCall() { }
	 
	 @Pointcut("execution(* com.stock.controller.LoginController.logout(..))")  
	    public void logoutCall() { }
	 
	 @Pointcut("execution(* com.stock.service.UserService.userRegister(..))")  
	    public void UserRegisterCall() { }

	 @Pointcut("execution(* com.stock.controller.StockController.queryStock1(..))")  
	    public void queryStock1Call() { }
	 
	 @Pointcut("execution(* com.stock.controller.NewsController.index2(..))")  
	    public void index2Call() { }
	 
	 @Pointcut("execution(* com.stock.controller.ToolsController.indexpa(..))")  
	    public void indexpaCall() { }
	 
	 @Pointcut("execution(* com.stock.service.CommentService.InsertComment(..))")  
	    public void momoCall() { }
	 
	 @Pointcut("execution(* com.stock.service.ReplyService.InsertReply(..))")  
	    public void momo1Call() { }
	 
	 @After("momo1Call()") //回复评论
	 public void momo1callCalls(JoinPoint joinPoint)throws Throwable{
		 Reply r =(Reply) (joinPoint.getArgs()[0]);
		 System.out.println(r);
		 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
     	 log.setCreatedate(time);
    	 log.setOperation("回复评论");
    	 log.setUserid(r.getR_sendid());
    	 if(r.getR_stockid()==0){
    		// System.out.println("1");
    	 log.setContent("用户:"+userService.selectByID(r.getR_sendid()).getU_name()+
    			 "对新闻:"+newsService.selectByID(r.getR_newsid()).getNews_title()+
    			 "在评论:"+commentService.selectByID(r.getR_commentid()).getCom_content()+" 下回复了"
    			 +r.getR_content()+"给"+userService.selectByID(r.getR_receiveid()).getU_name());
    	 }
    	 else{
    		// System.out.println("22");
    	 log.setContent("用户:"+userService.selectByID(r.getR_sendid()).getU_name()+
    			 "对股票:"+stockService.getStockbyid(r.getR_stockid()).getSec_short_name()+
    			 "关于评论:"+commentService.selectByID(r.getR_commentid()).getCom_content()+
    			 "回复了"+r.getR_content()+"给"+userService.selectByID(r.getR_receiveid()).getU_name());
    	 }
    	 log.setType(10);
    	 logService.log(log);
	 }
	 
	 @After("momoCall()") //评论
	 public void momocallCalls(JoinPoint joinPoint)throws Throwable{
		 Comment comment = (Comment)joinPoint.getArgs()[0];
		 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
     	 log.setCreatedate(time);
    	 log.setOperation("评论");
    	 log.setUserid(comment.getCommentator_id());
    	 if(comment.getStock_id()==null){
    		 log.setContent("用户:"+userService.selectByID(comment.getCommentator_id()).getU_name()+"对新闻"+newsService.selectByID(comment.getNews_id()).getNews_title()+"发表评论"+comment.getCom_content());
    	 }
    	 else{
    		 log.setContent("用户:"+userService.selectByID(comment.getCommentator_id()).getU_name()+"对股票"+stockService.getStockbyid(comment.getStock_id()).getSec_short_name()+"发表评论"+comment.getCom_content());
    	 }
    	 log.setType(9);
    	 logService.log(log);
	 }
	 

	 @After("index2Call()") //查看首页
	 public void index2CallCalls(JoinPoint joinPoint)throws Throwable{
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
		 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
     	 log.setCreatedate(time);
    	 log.setOperation("查看首页");
    	 if(user!=null){
    		 log.setUserid(user.getU_id());	
        	 log.setContent("用户"+user.getU_name()+"查看了首页");  	 
        	 }
        	 else{
        	 log.setUserid(0);
        	 log.setContent("匿名用户查看了首页");
        	 }
    	     log.setType(4);
        	 logService.log(log);
        	 
	 }
	 
	 
	 @After("queryStockCall()") //查看股票
	 public void queryStockCallCalls(JoinPoint joinPoint)throws Throwable{
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
		 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
     	 Stock stock =(Stock) ((Map)joinPoint.getArgs()[2]).get("stock");
    	 log.setCreatedate(time);
    	 log.setOperation("查看股票");
    	 if(user!=null){
    		 log.setUserid(user.getU_id());	
        	 log.setContent("用户"+user.getU_name()+"查看了股票:"+"'"+stock.getSec_short_name()+"'");  	 
        	 }
        	 else{
        	 log.setUserid(0);
        	 log.setContent("匿名用户查看了股票："+"'"+stock.getSec_short_name()+"'");
        	 }
    	 	 log.setType(5);
        	 logService.log(log);
        	
	 }
	 
	 @After("queryStock1Call()") //搜索股票
	 public void queryStockCall1Calls(JoinPoint joinPoint)throws Throwable{
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
		 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
     	 Stock stock =(Stock) ((Map)joinPoint.getArgs()[2]).get("stock");
    	 log.setCreatedate(time);
    	 log.setOperation("搜索股票");
    	 if(user!=null){
    		 log.setUserid(user.getU_id());	
        	 log.setContent("用户"+user.getU_name()+"搜索了股票:"+"'"+stock.getSec_short_name()+"'");  	 
        	 }
        	 else{
        	 log.setUserid(0);
        	 log.setContent("匿名用户搜索了股票："+"'"+stock.getSec_short_name()+"'");
        	 }
    	 	 log.setType(6);
        	 logService.log(log);
	 }
	 
	 @After("selectByIDCall()") //查看新闻
	 	public void selectByIDCallCalls(JoinPoint joinPoint)throws Throwable{
		 //System.out.println("lampard");
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
	     Map hm = ((Map)joinPoint.getArgs()[2]);
	     News news = (News)hm.get("news");
	     String news_title = news.getNews_title();
	     //System.out.println(news_title);
	     //System.out.println(hm);
	 	 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
    	 log.setCreatedate(time);
    	 log.setOperation("查看新闻");
    	 if(user!=null){
    	 log.setUserid(user.getU_id());	
    	 log.setContent("用户"+user.getU_name()+"查看了新闻:"+"'"+news_title+"'");  	 
    	 }
    	 else{
    	 log.setUserid(0);
    	 log.setContent("匿名用户查看了新闻："+"'"+news_title+"'");
    	 }
    	 log.setType(8);
    	 logService.log(log);
    	 
//	     for(int i=0;i<joinPoint.getArgs().length;i++){
//		    	System.out.println(joinPoint.getArgs()[i]);
//		    	System.out.println(joinPoint.getArgs().length);
//		    }
	     
	 }
	 
	 @After("insertServiceCall()")  //收藏股票
	    public void insertServiceCallCalls(JoinPoint joinPoint) throws Throwable{ 
	    	//System.out.println("1111111111111");
		 	String methodName = joinPoint.getSignature().getName();
		 	//System.out.println(methodName);
//		    for(int i=0;i<joinPoint.getArgs().length;i++){
//		    	System.out.println(joinPoint.getArgs()[i]);
//		    }
		 	System.out.println(joinPoint.getArgs()[0]);
		 	String stock_cd = ((Collect) joinPoint.getArgs()[0]).getStock_cd();
		 	int user_id = ((Collect) joinPoint.getArgs()[0]).getUser_id();	
		 	Date date = new Date();
		 	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=format.format(date);
	    	Log log = new Log();
	    	log.setCreatedate(time);
	    	log.setOperation("收藏");
	    	log.setUserid(user_id);
	    	log.setContent("用户"+userService.selectByID(user_id).getU_name()+"收藏了"+stock_cd+"号股票:"+stockService.getStockname(stock_cd));
	    	log.setType(7);
	    	logService.log(log);
	    } 
	 
//	 @Before("insertServiceCall()")  
//	    public void queryNewsCallCalls() throws Throwable{ 
//	    	System.out.println("111111111112222222222222222222211");
//	    } 
	 
	 
	 @After("UserRegisterCall()")
	 	public void UserRegisterCallCalls(JoinPoint joinPoint)throws Throwable{
		// System.out.println(joinPoint.getArgs());
		 User user1 =(User)joinPoint.getArgs()[0];
		 User user = userService.selectByName(user1.getU_name());
		 System.out.println(user);
		 Date date = new Date();
		 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
	     Log log = new Log();
	     log.setCreatedate(time);
	     log.setOperation("注册");
	     log.setUserid(user.getU_id());
	     log.setContent("用户名："+user.getU_name()+"完成注册,密码："+user.getU_psd());
	     log.setType(3);
	     logService.log(log);
	    
	 }
	 
	 @After("loginServiceCall()")  //用户登录
	 	public void loginServiceCallCalls(JoinPoint joinPoint)throws Throwable{
		 String username = (String)((Map) joinPoint.getArgs()[2]).get("u_name");
		 String password = (String)((Map) joinPoint.getArgs()[2]).get("u_psd");
		 System.out.println(joinPoint.getArgs()[2]);
		 int flag = (Integer)((Map)joinPoint.getArgs()[2]).get("flag");
		// boolean b = userService.selectByName(username)==null;
		// if(!b){
		 if(flag==1){
		 int user_id = userService.selectByName(username).getU_id();
		 Date date = new Date();
		 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
	     Log log = new Log();
	     log.setCreatedate(time);
	     log.setUserid(user_id);
	     log.setOperation("登录成功");
	     log.setContent("用户"+username+"登陆成功");
	     log.setType(1);
	     logService.log(log);
		 //}
		 }
		 if(flag ==2){
			 Date date = new Date();
			 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 String time=format.format(date);
		     Log log = new Log();
		     log.setCreatedate(time);
		     log.setOperation("登录失败");
		     log.setUserid(0);
		     log.setContent("用户名:"+username+"密码："+password+"登陆失败");
		     log.setType(11);
		     logService.log(log);
		 }
	 }

	 @Before("logoutCall()")  //用户退出登录
	 	public void logoutCallCalls(JoinPoint joinPoint)throws Throwable{
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
	     Date date = new Date();
		 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
	     Log log = new Log();
	     log.setCreatedate(time);
	     log.setUserid(user.getU_id());
	     log.setContent("用户"+userService.selectByID(user.getU_id()).getU_name()+"退出登录");
	     log.setOperation("退出登录");
	     log.setType(2);
	     logService.log(log);
	 }

	 @After("indexpaCall()") //评论
	 public void indexpaCallCalls(JoinPoint joinPoint)throws Throwable{
		 RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		 ServletRequestAttributes sra = (ServletRequestAttributes)ra;
	     HttpServletRequest request = sra.getRequest();	   
	     User user = (User) request.getSession().getAttribute("user");
	     Map hm = ((Map)joinPoint.getArgs()[2]);
	     News news = (News)hm.get("news");
	     String news_title = news.getNews_title();
	     //System.out.println(news_title);
	     //System.out.println(hm);
	 	 Date date = new Date();
	 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
     	 Log log = new Log();
    	 log.setCreatedate(time);
    	 log.setOperation("查看新闻");
    	 if(user!=null){
    	 log.setUserid(user.getU_id());	
    	 log.setContent("用户"+user.getU_name()+"查看了新闻:"+"'"+news_title+"'");  	 
    	 }
    	 else{
    	 log.setUserid(0);
    	 log.setContent("匿名用户查看了新闻："+"'"+news_title+"'");
    	 }
    	 log.setType(8);
    	 logService.log(log);
	 }

}
