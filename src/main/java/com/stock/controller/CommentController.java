package com.stock.controller;

import java.io.IOException;
import java.io.StringReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.locale.converters.DoubleLocaleConverter;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.stock.pojo.Comment;
import com.stock.pojo.Emo_Neg;
import com.stock.pojo.Emo_Pos;
import com.stock.pojo.News;
import com.stock.pojo.Reply;
import com.stock.pojo.Stock;
import com.stock.service.CommentService;
import com.stock.service.EmoService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.StockService;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	@Autowired NewsService newsService;
	@Autowired ReplyService replyService;
	@Autowired StockService stockservice;
	@Autowired EmoService emoService;
	
	@RequestMapping("/momo")
	public String index(HttpServletResponse res,HttpServletRequest req,Model model){
		//System.out.println("1111111111111111111111");
		Date date = new Date();
		System.out.println(date);
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		System.out.println(time);
		String s = req.getParameter("test");
		//System.out.println(s);
		int news_id = Integer.parseInt(req.getParameter("news_id"));
		//System.out.println(req.getParameter("news_id"));
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");                    
		//System.out.println(req.getParameter("com_time"));
		//commentService.InsertComment(s);
		
			//System.out.println("a");
		int commentator_id = Integer.parseInt(req.getParameter("commentator_id"));
		Comment comment = new Comment();
		comment.setCom_content(s);
		comment.setCom_time(time);
		comment.setCommentator_id(commentator_id);
		comment.setNews_id(news_id);
		commentService.InsertComment(comment);
		model.addAttribute("comment", comment);
		//long time = date.getTime();
		News news = newsService.selectByID(news_id);
		List<Map<String, Object>>list6 = commentService.queryComment(news_id);
		//System.out.println(news);
		model.addAttribute("news", news);
		model.addAttribute("list6",list6);
		List<Map<String, Object>>list7 = replyService.queryReply(news_id);
		model.addAttribute("list7",list7);
		return "stock_newsItem";
		
	}
	
	@RequestMapping("/momo2")
	public String index9(HttpServletResponse res,HttpServletRequest req,Model model){
		double posNum;
		//System.out.println("1111111111111111111111");
		Date date = new Date();
		System.out.println(date);
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		System.out.println(time);
		String s = req.getParameter("test");
		System.out.println(s);
		Analyzer anal=new IKAnalyzer(true);       
		StringReader reader=new StringReader(s);  
		
		//分词  
		TokenStream ts=anal.tokenStream("", reader);
		CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
		
		List<String> comlist = new ArrayList<String>();
		//遍历分词数据  
		try {
			while(ts.incrementToken()){  
				System.out.print(term.toString()+"|");
				comlist.add(term.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		//reader.close();  
		//System.out.println();
		
		Emo_Neg emoneg = null;
		Emo_Pos emopos = null;
		int emotion = 0;//情感得分
		//匹配
		for(int i = 0; i < comlist.size(); i++){
			
			System.out.println("comlist的第"+i+"项："+comlist.get(i));
			emoneg = emoService.selectByWordneg(comlist.get(i));
	
			if(null != emoneg){//逆向-1
				emotion--;
			}else{
				emopos = emoService.selectByWordpos(comlist.get(i));
			
				if(null != emopos){
					emotion++;
				}
			}
			
		}
		//System.out.println(s);
		int stock_id = Integer.parseInt(req.getParameter("stock_id"));
		
		
		
		
		
		//获取某股票的评论数量
				int	allCommentNum = emoService.selectEmotionNum(stock_id);
				System.out.println("所有评论数量："+allCommentNum);
				
				//正向情感
				int posNum1 = emoService.selectEmotionpos(stock_id);
				posNum = posNum1/(double)allCommentNum;
				System.out.println("wangqian"+posNum);
				

		
		//System.out.println(req.getParameter("news_id"));
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");                    
		//System.out.println(req.getParameter("com_time"));
		//commentService.InsertComment(s);
		
			//System.out.println("a");
		int commentator_id = Integer.parseInt(req.getParameter("commentator_id"));
		Comment comment = new Comment();
		comment.setCom_content(s);
		comment.setCom_time(time);
		comment.setCommentator_id(commentator_id);
		comment.setStock_id(stock_id);
		comment.setCom_emotion(emotion);
		commentService.InsertComment(comment);
		//emoService.updateEmotion(comment, emotion);
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
		model.addAttribute("posNum1",posNum);
		return "kline_graph";
		
	}
	
	@RequestMapping("/admin6")
	public String index2(HttpServletResponse res,HttpServletRequest req,Model model){
		List<Map<String, Object>>list8 = replyService.all_comment_reply();
		model.addAttribute("list8",list8);
		return "commentManage";
	}
	
	@RequestMapping("/reply_delete_by_id")
	public String index5(HttpServletResponse res, HttpServletRequest req,Model model){
		int r_id = Integer.parseInt(req.getParameter("r_id"));
		replyService.reply_delete_by_id(r_id);
		List<Map<String, Object>>list8 = replyService.all_comment_reply();
		model.addAttribute("list8",list8);
		return "commentManage";
	}
	
	@RequestMapping("/comment_delete_by_id")
	public String index6(HttpServletResponse res, HttpServletRequest req,Model model){
		int com_id = Integer.parseInt(req.getParameter("com_id"));
		int news_id = Integer.parseInt(req.getParameter("news_id"));
		ArrayList<Reply>list = replyService.getreply(news_id);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getR_commentid()==com_id){
				replyService.reply_delete_by_id(list.get(i).getR_id());
			}
		}
		
		commentService.comment_delete_by_id(com_id);
		List<Map<String, Object>>list8 = replyService.all_comment_reply();
		model.addAttribute("list8",list8);
		return "commentManage";
		}
	
		}
	














