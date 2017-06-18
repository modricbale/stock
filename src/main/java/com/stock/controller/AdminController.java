package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.stock.pojo.News;
import com.stock.pojo.User;
import com.stock.pojo.area_tag;
import com.stock.service.A_tagService;
import com.stock.service.BigcowsService;
import com.stock.service.CommentService;
import com.stock.service.LogService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.StockPriceService;
import com.stock.service.StockService;
import com.stock.service.UserService;


@Controller
public class AdminController {
	@Autowired
	private LogService logService;
	@Autowired
	private NewsService newsservice;
	@Autowired
	private UserService userService;
	@Autowired
	private BigcowsService bigcowsService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private StockService stockService;
	@Autowired
	private A_tagService tagService;
	@Autowired
	private StockPriceService stockpriceService;
	@RequestMapping("/admin5")
	public String queryNews(HttpServletRequest req,Model model){
		List<News>list= newsservice.queryallNews();
		/*Iterator<News> iterator = list1.iterator();
		while(iterator.hasNext()){
			System.out.println(iterator.next());
		}*/
		model.addAttribute("list", list);
		return "newsManage";
	}	
	
	
	@RequestMapping("/news_delete_by_id")
	public String news_delete_by_id(HttpServletRequest req,Model model){
		int u_id = Integer.parseInt(req.getParameter("id"));
		newsservice.news_delete_by_id(u_id);
		List<News> list = newsservice.queryallNews();
		model.addAttribute("list",list);
		return "newsManage";
	}
	
	
	
	@RequestMapping("/InsertNews")
	public String InsertUser(HttpServletRequest req, HttpServletResponse resp ,Model model) throws Exception{
		//System.out.println("xxxxxxxxxxxxxxxxx");
		//int u_id = Integer.parseInt(req.getParameter("id"));
		
		String news_title = new String(req.getParameter(("news_title")).getBytes("ISO-8859-1"),"utf-8");
		System.out.println(news_title);
		String news_source = req.getParameter("news_source");
		System.out.println(news_source);
		String news_time = new String(req.getParameter(("news_time")).getBytes("ISO-8859-1"),"utf-8");
		System.out.println(news_time);
		String news_type = req.getParameter("news_type");
		System.out.println(news_type);
		String news_content = req.getParameter("news_content");
		System.out.println(news_content);
		
		boolean b = newsservice.selectByName(news_title)==null;
		ArrayList<ArrayList<String>>total = new ArrayList<ArrayList<String>>();
		List<News> content_list = newsservice.getnewscontent();//得到所有新闻内容
		List<area_tag>tag_list1 = tagService.tag();
		ArrayList<String>tag_list = new ArrayList<String>();
		for(int i=0;i<tag_list1.size();i++){
			tag_list.add(tag_list1.get(i).getAtag_name());//得到所有标签内容
		}
		//System.out.println(tag_list);
		//System.out.println(content_list);
		
			ArrayList<String>word1 = new ArrayList<String>();
		
			Analyzer anal=new IKAnalyzer(true);       
			StringReader reader=new StringReader(news_content );  	
			//分词  
			TokenStream ts=anal.tokenStream("", reader);
			CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
			ArrayList<String> list1 = new ArrayList<String>();
			//遍历分词数据  
			try {
				while(ts.incrementToken()){  
				//	System.out.print(term.toString()+"|");
					list1.add(term.toString());
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			//System.out.println(list);
			//System.out.println(list.size());
			for(int j=0;j<list1.size();j++){
				
				String word = list1.get(j);
				//System.out.println(i+"   "+word);
				//System.out.println(tag_list);
				if(tag_list.contains(word)){
					word1.add(word);
					
				}
			}
			String final_tag="" ;
			for(int k=0;k<word1.size();k++){
				final_tag+=word1.get(k);
			}
		if(b){
		News news = new News();
		//user.setU_id(1);
		news.setNews_title(news_title);
		news.setNews_source(news_source);
		news.setNews_time(news_time);
		news.setNews_type(news_type);
		news.setNews_content(news_content);
		news.setNews_area(final_tag);
		news.setNews_keywords(null);
		news.setNews_industry(null);
		news.setNews_weight(0);
		System.out.println(news);
		newsservice.InsertUser(news);
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
			News news = newsservice.selectByName(news_title);
			news.setNews_source(news_source);
			news.setNews_time(news_time);
			news.setNews_title(news_title);
			news.setNews_type(news_type);
			news.setNews_content(news_content);
			news.setNews_area(final_tag);
			newsservice.updateByPrimaryKeySelective(news);
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
		List<News> list = newsservice.queryallNews();
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("list",list);
		//System.out.println("6");
		return "index2";
}
		
}
