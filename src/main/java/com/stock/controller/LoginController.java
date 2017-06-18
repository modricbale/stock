package com.stock.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.fabric.Response;
import com.stock.pojo.News;
import com.stock.pojo.User;
import com.stock.service.NewsService;
import com.stock.service.UserService;

@Controller
public class LoginController {
	/*
	 * Spring注入实现：自动装配
	 */
	@Autowired
	UserService userService;
	@Autowired
	NewsService newsService;
	/**
	 * 注册
	 * @author Xiaoyan
	 */
	@RequestMapping(value="/userRegister")
	public String UserRegister(HttpServletRequest req, HttpServletResponse res,Model model) throws Exception{
		
		String username = req.getParameter("u_name");
		String userpsd = req.getParameter("u_psd");
		String useremail = req.getParameter("u_email");
		User user = new User();
		user.setU_name(username);
		user.setU_psd(userpsd);
		user.setU_email(useremail);
		user.setU_type(1);//用户类型 1-用户
		System.out.println("注册:用户输入的邮箱："+user.getU_email());
		userService.userRegister(user);
		model.addAttribute("user", user);
		return "login";
	}
	
	@RequestMapping(value = "/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest req,HttpServletResponse res){
		System.out.println("aaaaaaaaaaaaaaaaa");
		HttpSession session = req.getSession();
		
		session.removeAttribute("user");
		try {
			PrintWriter out = res.getWriter();
			out.print("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 登录
	 * @author Xiaoyan
	 */
	@RequestMapping(value="/userLogin")
	public String login(HttpServletRequest req, HttpServletResponse res,Model model) throws Exception{
		
		String username = req.getParameter("u_name");
		String userpsd = req.getParameter("u_psd");
		//System.out.println("登录:用户的输入：" + username + "&" + userpsd);
		
		User user = userService.userLogin(username, userpsd);
		if(user != null){
			user = userService.selectByName(user.getU_name());
			//System.out.println("登录:用户ID：" + user.getU_id());

			//req.getSession().setAttribute("u_id", user.getU_id());
			req.getSession().setAttribute("user", user);
			//System.out.println(user.toString());
		}
	
		List<News>list1 = newsService.queryNews("1");
		List<News>list2 = newsService.queryNews("2");
		List<News>list3 = newsService.queryNews("3");
		List<News>list4 = newsService.queryNews("4");
		List<News>list5 = newsService.queryNews("5");
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);					//model是一层一层传
		req.getSession().setAttribute("user", user);       	//利用session是整个都能用user对象
		
		return "stock_news";
			
	}
	
	@RequestMapping(value = "/userLogin_comment")
	public void userLogin_comment(){
		
		System.out.println("load to userLogin_comment ......");
		
		
	}
	
	/**
	 * 登录
	 * @param req
	 * @param resp
	 * @throws Exception
	 * @author Xiaoyan
	 */
	@RequestMapping(value = "/checkUsernamePwd")
	public void checkUsernamePwd(HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
		String username = req.getParameter("u_name");
		String userpsd = req.getParameter("u_psd");
		//System.out.println("登录:用户的输入：" + username + "&" + userpsd);
		
		User user = userService.userLogin(username, userpsd);
		PrintWriter out = resp.getWriter();		
			if(user != null){
				user = userService.selectByName(user.getU_name());
				//System.out.println("登录:用户ID：" + user.getU_id());

				//req.getSession().setAttribute("u_id", user.getU_id());
				req.getSession().setAttribute("user", user);
				//System.out.println(user.toString());
				out.print("success");
				model.addAttribute("flag", 1);
				model.addAttribute("u_name", username);
				model.addAttribute("u_psd", userpsd);
			}else{
				out.print("failure");
				model.addAttribute("flag", 2);
				model.addAttribute("u_name", username);
				model.addAttribute("u_psd", userpsd);
			}
	}
	
	@RequestMapping(value = "/login")
	public String login(){
		return "login";
	}
}
