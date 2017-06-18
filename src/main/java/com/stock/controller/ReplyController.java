package com.stock.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stock.pojo.Comment;
import com.stock.pojo.News;
import com.stock.pojo.Reply;
import com.stock.pojo.Stock;
import com.stock.service.CommentService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.StockService;

@Controller
public class ReplyController {
	@Autowired ReplyService replyService;
	@Autowired CommentService commentService;
	@Autowired NewsService newsService;
	@Autowired StockService stockservice;
	
	@RequestMapping(value = "/momo1")
	public String index4(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		
		Date date = new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String r_time=format.format(date);
		//System.out.println(r_time);
		int news_id = Integer.parseInt(req.getParameter("news_id"));
		//System.out.println(news_id);
		int r_sendid = Integer.parseInt(req.getParameter("commentator_id"));
		//System.out.println(r_sendid);
		int r_receiveid = Integer.parseInt(req.getParameter("u_id"));
		//System.out.println(r_receiveid);
		int r_commentid = Integer.parseInt(req.getParameter("com_id"));
		//System.out.println(r_commentid);
		String r_content = req.getParameter("test");
		//System.out.println(r_content);
		Reply r = new Reply();
		r.setR_newsid(news_id);
		r.setR_sendid(r_sendid);
		r.setR_receiveid(r_receiveid);
		r.setR_commentid(r_commentid);
		r.setR_content(r_content);
		r.setR_time(r_time);
		//System.out.println(r.getR_stockid());
		model.addAttribute("reply", r);
		/*Comment comment = new Comment();
		comment.setCom_content(r_content);
		comment.setCom_time(r_time);
		comment.setCommentator_id(r_sendid);
		comment.setNews_id(news_id);
		commentService.InsertComment(comment);*/
		replyService.InsertReply(r);
		News news = newsService.selectByID(news_id);
		List<Map<String, Object>>list6 = commentService.queryComment(news_id);
		//System.out.println(news);
		model.addAttribute("news", news);
		model.addAttribute("list6",list6);
		List<Map<String, Object>>list7 = replyService.queryReply(news_id);
		model.addAttribute("list7",list7);
		return "stock_newsItem";
		
	
	}
	
	@RequestMapping(value = "/momo3")
	public String index10(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		
		Date date = new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String r_time=format.format(date);
		//System.out.println(r_time);
		int stock_id = Integer.parseInt(req.getParameter("stock_id"));
		//System.out.println(news_id);
		int r_sendid = Integer.parseInt(req.getParameter("commentator_id"));
		//System.out.println(r_sendid);
		int r_receiveid = Integer.parseInt(req.getParameter("u_id"));
		//System.out.println(r_receiveid);
		int r_commentid = Integer.parseInt(req.getParameter("com_id"));
		//System.out.println(r_commentid);
		String r_content = req.getParameter("test");
		//System.out.println(r_content);
		Reply r = new Reply();
		System.out.println(r.getR_commentid());
		r.setR_stockid(stock_id);
		r.setR_sendid(r_sendid);
		r.setR_receiveid(r_receiveid);
		r.setR_commentid(r_commentid);
		r.setR_content(r_content);
		r.setR_time(r_time);
		/*Comment comment = new Comment();
		comment.setCom_content(r_content);
		comment.setCom_time(r_time);
		comment.setCommentator_id(r_sendid);
		comment.setNews_id(news_id);
		commentService.InsertComment(comment);*/
		replyService.InsertReply(r);
		Stock stock=stockservice.getStockbyid(stock_id);
		String stock_code=stock.getStock_cd();
		String security=stock.getSecurities();
		String src1=null;
		String src2=null;
		String src3=null;
		String src4=null;
		if (security=="XSHG"){
			 src1="http://image.sinajs.cn/newchart/min/n/sh"+stock_code+".gif";
			 src2="http://image.sinajs.cn/newchart/daily/n/sh"+stock_code+".gif";
			 src3="http://image.sinajs.cn/newchart/weekly/n/sh"+stock_code+".gif";
			 src4="http://image.sinajs.cn/newchart/monthly/n/sh"+stock_code+".gif";
		}
		else{
			 src1="http://image.sinajs.cn/newchart/min/n/sz"+stock_code+".gif";
			 src2="http://image.sinajs.cn/newchart/daily/n/sz"+stock_code+".gif";
			 src3="http://image.sinajs.cn/newchart/weekly/n/sz"+stock_code+".gif";
			 src4="http://image.sinajs.cn/newchart/monthly/n/sz"+stock_code+".gif";
		}
		System.out.println(src1);
		System.out.println(src2);
		System.out.println(src3);
		System.out.println(src4);
		
		//System.out.println(news_id);
		
	    
		List<Map<String, Object>>list6 = commentService.queryComment1(stock_id);
		//System.out.println(news);
		List<Map<String, Object>>list7 = replyService.queryReply1(stock_id);
		model.addAttribute("stock", stock);
		model.addAttribute("list6",list6);
		model.addAttribute("list7",list7);
		model.addAttribute("src1", src1);
		model.addAttribute("src2", src2);
		model.addAttribute("src3", src3);
		model.addAttribute("src4", src4);
		return "kline_graph";
	
	}
	
	
	
	
}
