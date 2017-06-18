package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stock.mapping.UserMapper;
import com.stock.pojo.User;
import com.stock.service.UserService;
@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/user_delete_by_id")
	public String user_delete_by_id(HttpServletRequest req,Model model){
		int u_id = Integer.parseInt(req.getParameter("id"));
		userService.user_delete_by_id(u_id);
		List<User> list = userService.queryUsers();
		model.addAttribute("list",list);
		return "adminManage";
	}
	
	@RequestMapping("/InsertUser")
	public String InsertUser(HttpServletRequest req, HttpServletResponse resp ,Model model) throws Exception{
		//System.out.println("xxxxxxxxxxxxxxxxx");
		//int u_id = Integer.parseInt(req.getParameter("id"));
		
		String u_name = new String(req.getParameter(("u_name")).getBytes("ISO-8859-1"),"utf-8");
		System.out.println(u_name);
		String u_psd = req.getParameter("u_psd");
		int u_type = Integer.parseInt(req.getParameter("u_type"));
		String u_nickname = new String(req.getParameter(("u_nickname")).getBytes("ISO-8859-1"),"utf-8");
		System.out.println(u_nickname);
		String u_sex = req.getParameter("u_sex");
		String u_email = req.getParameter("u_email");
		String u_phone = req.getParameter("u_phone");
		String u_introduce =  new String(req.getParameter(("u_introduce")).getBytes("ISO-8859-1"),"utf-8");
		
		boolean b = userService.selectByName(u_name)==null;
		System.out.println(b);
		if(b){
		System.out.println("1111111111111");
		User user = new User();
		//user.setU_id(1);
		user.setU_name(u_name);
		user.setU_psd(u_psd);
		user.setU_nickname(u_nickname);
		user.setU_type(u_type);
		user.setU_sex(u_sex);
		user.setU_email(u_email);
		user.setU_phone(u_phone);
		user.setU_introduce(u_introduce);
		System.out.println(user);
		userService.InsertUser(user);
		try {
			PrintWriter out = resp.getWriter();
			out.print("success");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		else {
			
			User user = userService.selectByName(u_name);
			
			user.setU_name(u_name);
			user.setU_psd(u_psd);
			user.setU_nickname(u_nickname);
			user.setU_type(u_type);
			user.setU_sex(u_sex);
			user.setU_email(u_email);
			user.setU_phone(u_phone);
			user.setU_introduce(u_introduce);
			System.out.println("yyyyyyyyyyyyyy");
			userService.updateByPrimaryKeySelective(user);
			try {
				PrintWriter out = resp.getWriter();
				out.print("success");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<User> list = userService.queryUsers();
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("list",list);
		//System.out.println("6");
		return "adminManage";
}
		
	
	
	@RequestMapping("/index")
	public String queryUsers(HttpServletRequest req,HttpServletResponse res ,Model model){
		List<User> list = userService.queryUsers();
		model.addAttribute("list",list);
		return "adminManage";
	}
	
	

	/**
	 * 查看个人信息
	 * @author Xiaoyan
	 */
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest req, Model mode){
		//System.out.println("papapapa");
		int u_id = Integer.parseInt(req.getParameter("u_id"));
		//System.out.println(u_id+"papapa");
		User user = userService.selectByPrimaryKey(u_id);
		mode.addAttribute("user", user);	
		return "userInfo";

	}
		
	/**
	 * 从查看个人信息页面跳转到修改个人信息页面
	 * @author Xiaoyan
	 */
	@RequestMapping("/jumpEditUserInfo")
	public String jumpEditUserInfo(HttpServletRequest req, User user, Model mode){
		
		mode.addAttribute("user", user);
		
		return "editUserInfo";
	}
	
	/**
	 * 修改个人信息
	 * @author Xiaoyan
	 */
	@RequestMapping(value="/editUserInfo")
	public String editUserInfo(HttpServletRequest req, User user){
		
		System.out.println("修改" + user.getU_name() +"的个人信息");
		System.out.println(user.toString());
		
		
		userService.updateByPrimaryKey(user);
		
		return "userInfo";		
	}
	
	/**
	 * 修改个人信息页面-显示个人信息
	 * @author Xiaoyan
	 */
	@RequestMapping(value="/showUserInfo")
	public String showUserInfo(HttpServletRequest req, Model mode){
		
		
		User user = (User) req.getSession().getAttribute("user");
		User userr = userService.selectByPrimaryKey(user.getU_id());
		
		
		
		mode.addAttribute(userr);
		return "editUserInfo";
	}
	
	/**
	 * 根据email查询用户是否存在
	 * @author Xiaoyan
	 * @throws IOException 
	 */
	@RequestMapping(value="/getEmailValidation")
	public void getEmailValidation(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		String email = req.getParameter("u_email");
		User userEmail = userService.selectByEmail(email);
		
		PrintWriter out = resp.getWriter();//????
		if(userEmail == null){
			System.out.println("邮箱重复验证：" + email + "的用户不存在");
			out.print("success");
		}else{
			System.out.println("邮箱重复验证：" + email + "的用户存在"+userEmail.toString());
			out.print("failure");
		}
	}
		
	/**
	 * 根据用户名查询用户是否存在
	 * @author Xiaoyan
	 */
	@RequestMapping(value="/getNameValidation")
	public void getNameValidation(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String name = req.getParameter("u_name");
		User userName =userService.selectByName(name);
		
		PrintWriter out = res.getWriter();
		if(userName != null){
			System.out.println("用户名重复验证：" + name + "的用户存在");
			out.print("success");
		}else{
			out.print("failure");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
