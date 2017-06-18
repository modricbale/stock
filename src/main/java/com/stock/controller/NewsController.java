package com.stock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stock.aop.Tools;
import com.stock.pojo.Comment;
import com.stock.pojo.News;
import com.stock.pojo.Reply;
import com.stock.pojo.User;
import com.stock.service.CommentService;
import com.stock.service.LogService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.UserService;


@Controller
//@RequestMapping(value="/admintest")
public class NewsController {
	
	@Autowired NewsService newsService;
	@Autowired UserService userService;
	@Autowired CommentService commentService;
	@Autowired ReplyService replyService;
	@Autowired LogService logService;
	
	
//	@RequestMapping(value = "/admin2")
//	public String index(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
//		int news_id = Integer.parseInt(req.getParameter("news_id"));
//		//System.out.println(news_id);
//		News news = newsService.selectByID(news_id);
//		List<Map<String, Object>>list6 = commentService.queryComment(news_id);
//		//System.out.println(news);
//		List<Map<String, Object>>list7 = replyService.queryReply(news_id);
//		model.addAttribute("news", news);
//		model.addAttribute("list6",list6);
//		model.addAttribute("list7",list7);
//	
//		
//		return "stock_newsItem";
//	}
//	
	
	
	
	@RequestMapping(value = "/admin3")
	public String index1(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		String news_type = req.getParameter("news_type");
		List<News> list = newsService.queryNews(news_type);
		model.addAttribute("list", list);
		return "page_timeline";
		}
	
	@RequestMapping(value = "/admin")	
	public String index2(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception {
		//ServletContext sc = req.getSession().getServletContext();
		//String qString = sc.getInitParameter("qqq");
		//System.out.println(".........."+qString);
		List<News>list1 = newsService.queryNews("1");
		List<News>list2 = newsService.queryNews("2");
		List<News>list3 = newsService.queryNews("3");
		List<News>list4 = newsService.queryNews("4");
		List<News>list5 = newsService.queryNews("5");
		//User user = (User)req.getAttribute("user");
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);	//model是一层一层传

		//req.getSession().setAttribute("user", user);       	//利用session是整个都能用user对象
		return "stock_news";
		}
	
}
