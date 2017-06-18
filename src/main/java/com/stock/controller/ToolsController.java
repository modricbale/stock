package com.stock.controller;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.classification.InterfaceAudience.Public;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.tomcat.TomcatLoadTimeWeaver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.stock.aop.Tools;
import com.stock.pojo.Bigcows;
import com.stock.pojo.Log;
import com.stock.pojo.News;
import com.stock.pojo.Stock;
import com.stock.pojo.StockPrice;
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
import com.stock.utils.Pager;

@Controller
public class ToolsController {
	
	@Autowired
	private LogService logService;
	@Autowired
	private NewsService newsService;
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
	
	public HashMap<String, Integer> show_time_rank(){
	HashMap<String,Integer>  hm = new HashMap<String, Integer>();
	List<String> list = logService.selecttime(1);
	for(int i=0;i<list.size();i++){
		String index = list.get(i).substring(11, 13);
		if(hm.get(index)==null){
			hm.put(index, 1);
		}
		else{
			hm.replace(index, hm.get(index),  hm.get(index)+1);
		}
	}
	return hm;
	}
	
	public List<Map.Entry<String, Integer>> show_stock_rank(){
		HashMap<String,
		Integer>  hm1 = new HashMap<String, Integer>();     
		List<String> list6 = logService.selectstock(5);
		for(int i=0;i<list6.size();i++){
			int start = list6.get(i).indexOf("'");
			int end = list6.get(i).lastIndexOf("'");
			String name = list6.get(i).substring(start+1, end);
			if(hm1.get(name)==null){
				hm1.put(name, 1);
			}
			else{
				hm1.replace(name, hm1.get(name),  hm1.get(name)+1);
			}
			
		}
		List<Map.Entry<String, Integer>> infoIds =
			    new ArrayList<Map.Entry<String, Integer>>(hm1.entrySet());
		
		Collections.sort(infoIds, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
		return infoIds;
	}
	
	public ArrayList<String> show_user_stock_trace(int u_id){
		List<Log> list7 = logService.selectbyuser(u_id,5);
		ArrayList<String> arrayList= new ArrayList<String>();
		for(int i=0;i<list7.size();i++){
			int start = list7.get(i).getContent().indexOf("'");
			int end = list7.get(i).getContent().lastIndexOf("'");
			String name = list7.get(i).getContent().substring(start+1, end);
			int id = list7.get(i).getUserid();
			if(id!=0){
			arrayList.add(("用户:"+userService.selectByID(list7.get(i).getUserid()).getU_name()
					+"在"+list7.get(i).getCreatedate()+"查看了股票:"+name));
			}
			else{
			arrayList.add(("用户:"+userService.selectByID(list7.get(i).getUserid()).getU_name()
					+"在"+list7.get(i).getCreatedate()+"查看了股票:"+name));
			System.out.println("匿名用户在"+list7.get(i).getCreatedate()+"查看了股票:"+name);
			}
		}
		return arrayList;
	}
	
	
	public List<Map.Entry<String, Integer>> show_news_rank(){

		HashMap<String,Integer>  hmtime = new HashMap<String, Integer>();     
		List<String> list8 = logService.selectbytype(8);
		for(int i=0;i<list8.size();i++){
			int start = list8.get(i).indexOf("'");
			int end = list8.get(i).lastIndexOf("'");
			String name = list8.get(i).substring(start+1, end);
			if(hmtime.get(name)==null){
				hmtime.put(name, 1);
			}
			else{
				hmtime.replace(name, hmtime.get(name),  hmtime.get(name)+1);
			}
			
		}
		List<Map.Entry<String, Integer>> infoIds1= 
			    new ArrayList<Map.Entry<String, Integer>>(hmtime.entrySet());
		
		Collections.sort(infoIds1, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
			return infoIds1;
	}
	
	
	
	
	public ArrayList<String> show_user_news_trace(int u_id){
		List<Log> list9 = logService.selectbyuser(u_id,8);
		ArrayList<String> arrayList = new ArrayList<String>();
		for(int i=0;i<list9.size();i++){
			int start = list9.get(i).getContent().indexOf("'");
			int end = list9.get(i).getContent().lastIndexOf("'");
			String name = list9.get(i).getContent().substring(start+1, end);
			int id = list9.get(i).getUserid();
			if(id!=0){
				arrayList.add("用户:"+userService.selectByID(list9.get(i).getUserid()).getU_name()
					+"在"+list9.get(i).getCreatedate()+"查看了新闻:"+name);
			}
			else{
				arrayList.add("匿名用户在"+list9.get(i).getCreatedate()+"查看了新闻:"+name);
			}
		}
		return arrayList;
	}
	
	public List<Map.Entry<String, Integer>> show_collect_rank(){
		
		HashMap<String,Integer>  hmcollect = new HashMap<String, Integer>();     
		List<String> list10 = logService.selectbytype(7);
		for(int i=0;i<list10.size();i++){
			int start = list10.get(i).indexOf(":");
			String name = list10.get(i).substring(start+1, list10.get(i).length());
			if(hmcollect.get(name)==null){
				hmcollect.put(name, 1);
			}
			else{
				hmcollect.replace(name, hmcollect.get(name),  hmcollect.get(name)+1);
			}
		
		}
		List<Map.Entry<String, Integer>> infoIds2 =
			    new ArrayList<Map.Entry<String, Integer>>(hmcollect.entrySet());
		
		Collections.sort(infoIds2, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
		return infoIds2;
		
	}
	
	
	public ArrayList<HashMap> showbigcows(){
		List<Map<String, Object>>list = bigcowsService.querybigcows();
		//System.out.println("qqq"+list);
		ArrayList<HashMap> total = new ArrayList<HashMap>();
		HashMap<String, ArrayList<String>> hmcollect = new HashMap<String,  ArrayList<String>>();
		HashMap<String, Map<String, Integer>>hmscan = new HashMap<String, Map<String,Integer>>();
		for(int i=0;i<list.size();i++){
			int u_id = (Integer)list.get(i).get("u_id");
			int type = (Integer)list.get(i).get("type");
			String name = userService.selectByID((Integer)list.get(i).get("u_id")).getU_name();
			String content =(String) list.get(i).get("content");	
			if(type==5){
				int start = content.indexOf("'");
				int end = content.lastIndexOf("'");
				String stockname = content.substring(start+1, end);
				if(hmscan.get(name)==null){
					Map<String, Integer> map = new HashMap<String, Integer>();
					map.put(stockname, 1);
					hmscan.put(name, map);
				}
				else{
					Map<String, Integer> map = hmscan.get(name);
					if(!map.containsKey(stockname)){
						map.put(stockname, 1);
					}
					else{
						map.replace(stockname, map.get(stockname), map.get(stockname)+1);
					}
				}
			}
			else if(type==7){
				int start = content.indexOf(":");
				int end = content.length();
				String collectname = content.substring(start+1, end);
				if(hmcollect.get(name)==null){
					ArrayList<String>arrayList = new ArrayList<String>();
					arrayList.add(collectname);
					hmcollect.put(name, arrayList);
				}
				else{
					ArrayList<String>arrayList = hmcollect.get(name);
					arrayList.add(collectname);
				}
			}
			
		}
		total.add(hmcollect);
		total.add(hmscan);
		return total;
	}
	
	public HashMap<Integer, Integer> hotcomment(){
		List<News>newsid = newsService.getnewsid();
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=0;i<newsid.size();i++){
			int comcount = commentService.getcommentcount(newsid.get(i).getNews_id());
			int recount = replyService.getreplycount(newsid.get(i).getNews_id());
			map.put(newsid.get(i).getNews_id(), comcount+recount);
		}
		return map;
	}
	
	public HashMap<Integer, Integer> stock_hot_comment(){
		List<Stock>stock_id = stockService.getstockid();
		
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=0;i<stock_id.size();i++){
			int comcount = commentService.get_stock_comment_count(stock_id.get(i).getStock_id());
			int recount = replyService.getstock_reply_count(stock_id.get(i).getStock_id());
			int j=stock_id.get(i).getStock_id();
			//System.out.println(j);
			map.put(j, comcount+recount);
		}
		return map;
	}
	
	
	
	public List<Map.Entry<String, Double>> get_news_score(){
		List<Map.Entry<String, Integer>> newslist = show_news_rank();
		HashMap<Integer, Integer> commentmap = hotcomment();
		HashMap<String, Double> scoremap = new HashMap<String, Double>();
		
		//System.out.println(newslist);
			int scan_count = 0;
			int comment_count=0;
			Set<Integer> key = commentmap.keySet();
			//System.out.println("11"+commentmap);
			Iterator<Integer> iterator = key.iterator();
			while(iterator.hasNext()){
				int flag = 0;
				int news_id = iterator.next();
				String news_name = newsService.selectByID(news_id).getNews_title();
				comment_count = commentmap.get(news_id);
				for(int i=0;i<newslist.size();i++){
					String name = newslist.get(i).getKey();
					
				if(news_name.equals(name)){
					//System.out.println(news_name);
					scan_count = newslist.get(i).getValue();	
					double score = 0.4*comment_count+0.6*scan_count;
					//System.out.println(news_id+"  "+scan_count+"  "+comment_count);
					scoremap.put(news_name, score);
					
					flag=1;
					break;
					}
				}
				if(flag==0){
					scan_count =0;
					double score = 0.4*comment_count+0.6*scan_count;
					//System.out.println("momo"+news_id+"  "+scan_count+"  "+comment_count);
					scoremap.put(news_name, score);
					
				}
			}
			List<Map.Entry<String, Double>> infoIds3 =
				    new ArrayList<Map.Entry<String, Double>>(scoremap.entrySet());
			
			Collections.sort(infoIds3, new Comparator<Map.Entry<String, Double>>() {   
			    public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {      
			        //return (o2.getValue() - o1.getValue()); 
			    	return (int) (o2.getValue() - o1.getValue()); 
			    }
			}); 
			
			return infoIds3;
			
	}
	
	public List<Map.Entry<String, Double>> get_stock_score(){
		List<Map.Entry<String, Integer>> stocklist = show_stock_rank();
		HashMap<String, Double> scoremap1 = new HashMap<String, Double>();
		HashMap<Integer, Integer> stock_comment_map =stock_hot_comment();
		//System.out.println(newslist);
			int scan_count = 0;
			int comment_count=0;
			Set<Integer> key = stock_comment_map.keySet();
			//System.out.println("11"+commentmap);
			Iterator<Integer> iterator = key.iterator();
			while(iterator.hasNext()){
				int flag = 0;
				int stock_id = iterator.next();
				String name = stockService.getStockbyid(stock_id).getSec_short_name();
				comment_count = stock_comment_map.get(stock_id);
				for(int i=0;i<stocklist.size();i++){
					String stock_name = stocklist.get(i).getKey();
					
				if(stock_name.equals(name)){
					scan_count = stocklist.get(i).getValue();	
					double score = 0.4*comment_count+0.6*scan_count;				
					scoremap1.put(name, score);
					flag=1;
					break;
					}
				}
				if(flag==0){
					scan_count =0;
					double score = 0.4*comment_count+0.6*scan_count;
					//System.out.println("momo"+news_id+"  "+scan_count+"  "+comment_count);
					scoremap1.put(name, score);
				}
			}
			List<Map.Entry<String, Double>> infoIds4 =
				    new ArrayList<Map.Entry<String, Double>>(scoremap1.entrySet());
			
			Collections.sort(infoIds4, new Comparator<Map.Entry<String, Double>>() {   
			    public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {      
			        //return (o2.getValue() - o1.getValue()); 
			    	double p = o2.getValue() - o1.getValue();
			    	int flag=0;
			    	if(p>0)
			    		flag = 1;
			    	else if(p==0)
			    		flag = 0;
			    	else if(p<0)
			    		flag = -1;
			    	return flag;
			    }
			}); 
			return infoIds4;
	}
	
	//获取所有用户股票踪迹用来推荐
	public  HashMap<String, ArrayList<String>> get_all_trace(){
		HashMap<String, ArrayList<String>> total = new HashMap<String,ArrayList<String>>();
		
		List<String> all_trace = logService.selectbytype(5);
		for(int i=0;i<all_trace.size();i++){
			String content = all_trace.get(i);
			int start = content.indexOf("户");
			int end = content.lastIndexOf("查");
			if((end-start==1)){
				continue;
			}
			else{
				
		String user_name = content.substring(start+1, end);
		int start1 = content.indexOf("'");
		int end1 = content.lastIndexOf("'");
		String stock_name = content.substring(start1+1,end1);
		if(total.get(user_name)==null){
			
			ArrayList<String>arrayList = new ArrayList<String>();
			arrayList.add(stock_name);
			total.put(user_name, arrayList);
				}
		else{
			
			ArrayList<String>arrayList = total.get(user_name);
			if(!arrayList.contains(stock_name)){
				arrayList.add(stock_name);
					}
				}
			}
		}
		return total; 
	}
	
	@RequestMapping(value = "/admin2")
	public String index(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		int news_id = Integer.parseInt(req.getParameter("news_id"));
		//System.out.println(news_id);
		News news = newsService.selectByID(news_id);
		List<Map<String, Object>>list6 = commentService.queryComment(news_id);
		//System.out.println(news);
		List<Map<String, Object>>list7 = replyService.queryReply(news_id);
		model.addAttribute("news", news);
		model.addAttribute("list6",list6);
		model.addAttribute("list7",list7);
		List<Map.Entry<String, Double>> scoremap = get_news_score();
		List<Map.Entry<String, Double>> scoremap1 = get_stock_score();
		model.addAttribute("scoremap", scoremap);
		model.addAttribute("scoremap1", scoremap1);
		System.out.println(scoremap);
		System.out.println(scoremap1);
		return "stock_newsItem";
	}
	
	@RequestMapping(value = "/admin88")
	public String index2(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception {
		HashMap<String, Integer> timemap = show_time_rank();
		List<Map.Entry<String, Integer>> stocklist = show_stock_rank();
		List<Map.Entry<String, Integer>> newslist = show_news_rank();
		List<Map.Entry<String, Integer>> collectlist = show_collect_rank();
		ArrayList<HashMap> total = showbigcows();
		HashMap<String, ArrayList<String>> hmcollect = total.get(0);
		HashMap<String, Map<String, Integer>>hmscan = total.get(1);
		HashMap<Integer, Integer> commentmap = hotcomment();
		HashMap<Integer, Integer> stock_comment_map =stock_hot_comment();
		model.addAttribute("timemap",timemap);
		model.addAttribute("stocklist",stocklist);
		model.addAttribute("newslist", newslist);
		model.addAttribute("collectlist",collectlist);
		model.addAttribute("hmcollect", hmcollect);
		model.addAttribute("hmscan", hmscan);
		List<Map.Entry<String, Double>> scoremap = get_news_score();
		List<Map.Entry<String, Double>> scoremap1 = get_stock_score();
		model.addAttribute("scoremap", scoremap);
		model.addAttribute("scoremap1", scoremap1);
		 HashMap<String, ArrayList<String>> all_trace = get_all_trace();
		//System.out.println(all_trace);
		return "charts";
	}
	@RequestMapping(value = "/user_trace")
	public String user_trace(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		int u_id = Integer.parseInt(req.getParameter("id"));
		ArrayList<String> news_trace = show_user_news_trace(u_id);
		//System.out.println(news_trace);
		ArrayList<String> stock_trace = show_user_stock_trace(u_id);
		List<Log> all_trace1 = logService.all_trace(u_id);
		ArrayList<String> all_trace = new ArrayList<String>();
		for(int j=0;j<all_trace1.size();j++){
			//System.out.println(all_trace1.get(j).getContent());
			String time = all_trace1.get(j).getCreatedate();
			all_trace.add(time+":"+all_trace1.get(j).getContent());
		}
		ArrayList<String> login_trace = new ArrayList<String>();
		List<Log> login_trace1 = logService.login_trace(u_id,1);
		System.out.println(login_trace1);
		for(int i=0;i<login_trace1.size();i++){
			String time = login_trace1.get(i).getCreatedate();
			String content = login_trace1.get(i).getContent();
			String s = time+":"+content;
			login_trace.add(s);
		}
		System.out.println(login_trace);
		model.addAttribute("news_trace", news_trace);
		model.addAttribute("stock_trace", stock_trace);
		model.addAttribute("all_trace", all_trace);
		model.addAttribute("login_trace", login_trace);
		return "logtrace";
	}
	
	@RequestMapping(value="/stock_query1")
	public String queryStocks(HttpServletRequest req ,Model model) throws Exception{
		int pageNum1 = Integer.parseInt(req.getParameter("pagenum"));
		Pager pager = new Pager(2870, pageNum1);
		List<Stock> stocks =stockService.getAllStock(pager);
		model.addAttribute("stocks",stocks);
		
		List<StockPrice> stockprices = new LinkedList<StockPrice>();
		//System.out.println(pageNum);
		stockprices=stockpriceService.getAllStockPrice(pager);
		ArrayList<HashMap> total = showbigcows();
		HashMap<String, ArrayList<String>> hmcollect = total.get(0);
		HashMap<String, Map<String, Integer>>hmscan = total.get(1);
		model.addAttribute("stockPrices",stockprices);
		model.addAttribute("pager",pager);
		model.addAttribute("hmcollect",hmcollect);
		model.addAttribute("hmscan",hmscan);
		System.out.println(hmcollect);
		System.out.println(hmscan);
		return "index2";
	}
	@RequestMapping(value = "/bigcows")
	public String bigcows(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		ArrayList<HashMap> total = showbigcows();
		HashMap<String, ArrayList<String>> hmcollect = total.get(0);
		HashMap<String, Map<String, Integer>>hmscan = total.get(1);
		model.addAttribute("hmcollect", hmcollect);
		model.addAttribute("hmscan", hmscan);
		return "bigcows";
	}
	@RequestMapping(value = "/indexpa")
	public String indexpa(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		int i = Integer.parseInt(req.getParameter("index"));
		List<Map.Entry<String, Double>> scoremap = get_news_score();
		String new_name = scoremap.get(i).getKey();
		
		//System.out.println(news_id);
		News news = newsService.selectByName(new_name);
		int news_id = news.getNews_id();
		List<Map<String, Object>>list6 = commentService.queryComment(news_id);
		//System.out.println(news);
		List<Map<String, Object>>list7 = replyService.queryReply(news_id);
		model.addAttribute("news", news);
		model.addAttribute("list6",list6);
		model.addAttribute("list7",list7);
		return "stock_newsItem";
		
	}
	
	@RequestMapping(value = "/indexpa1")
	public String indexpa1(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		int k = Integer.parseInt(req.getParameter("index"));
		List<Map.Entry<String, Double>> scoremap1 = get_stock_score();
		String stock_name = scoremap1.get(k).getKey();
		
		//System.out.println(news_id);
		Stock stock = stockService.getStockbyname(stock_name);
		String stock_prime_operating = stock.getPrime_operating();
		Analyzer anal=new IKAnalyzer(true);       
		StringReader reader=new StringReader(stock_prime_operating );  	
		//分词  
		TokenStream ts=anal.tokenStream("", reader);
		CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
		List<String> namelist = new ArrayList<String>();
		//遍历分词数据  
		try {
			while(ts.incrementToken()){  
			//	System.out.print(term.toString()+"|");
				namelist.add(term.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	    
	    
	    
	    
		List list = stockService.selectname();
		//System.out.println(list.size());
		ArrayList <ArrayList<String>>arrbig = new ArrayList<ArrayList<String>>();
		for(int i=0;i<list.size();i++){
			//req.setAttribute("name", list.get(i));

			ArrayList<String>arr = new ArrayList<String>();		
			//创建分词对象  
			Analyzer anal1=new IKAnalyzer(true);       
			//System.out.println(list.get(i));
			StringReader reader1=new StringReader((String) list.get(i));  
			//分词  
			TokenStream ts1=anal1.tokenStream("", reader1);
			
			CharTermAttribute term1=ts1.getAttribute(CharTermAttribute.class);  
			
			try {
				while(ts1.incrementToken()){  
					//System.out.print(term1.toString()+"|");
					arr.add(term1.toString());
				
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		  				
			arrbig.add(arr); 	 
		}

		HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
		for(int j=0;j<arrbig.size();j++){
			int score1=0;
			for(int i=0;i<namelist.size();i++){
				if(arrbig.get(j).contains(namelist.get(i))){
					score1++;
				}
			}
			hm.put(j, score1);
		}
		List<Map.Entry<Integer, Integer>> infoIds =
			    new ArrayList<Map.Entry<Integer, Integer>>(hm.entrySet());
		
		Collections.sort(infoIds, new Comparator<Map.Entry<Integer, Integer>>() {   
		    public int compare(Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
			

		Stock s1 = stockService.getStockbyid(infoIds.get(1).getKey()+5745);
		Stock s2 = stockService.getStockbyid(infoIds.get(2).getKey()+5745);
		Stock s3 = stockService.getStockbyid(infoIds.get(3).getKey()+5745);
		Stock s4 = stockService.getStockbyid(infoIds.get(4).getKey()+5745);

		ArrayList<Stock>stockList = new ArrayList<Stock>();
		stockList.add(s1);
		stockList.add(s2);
		stockList.add(s3);
		stockList.add(s4);
		model.addAttribute("stockList", stockList);
		model.addAttribute("stock",stock);
		return "stock_details";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/update")
	public String update(HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		
		ArrayList<ArrayList<String>>total = new ArrayList<ArrayList<String>>();
		List<News> content_list = newsService.getnewscontent();//得到所有新闻内容
		List<area_tag>tag_list1 = tagService.tag();
		ArrayList<String>tag_list = new ArrayList<String>();
		for(int i=0;i<tag_list1.size();i++){
			tag_list.add(tag_list1.get(i).getAtag_name());//得到所有标签内容
		}
		//System.out.println(tag_list);
		//System.out.println(content_list);
		for(int i=0;i<content_list.size();i++){
			ArrayList<String>word1 = new ArrayList<String>();
			String news_content = content_list.get(i).getNews_content();
			Analyzer anal=new IKAnalyzer(true);       
			StringReader reader=new StringReader(news_content);  	
			//分词  
			TokenStream ts=anal.tokenStream("", reader);
			CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
			ArrayList<String> list = new ArrayList<String>();
			//遍历分词数据  
			try {
				while(ts.incrementToken()){  
				//	System.out.print(term.toString()+"|");
					list.add(term.toString());
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			//System.out.println(list);
			//System.out.println(list.size());
			for(int j=0;j<list.size();j++){
				
				String word = list.get(j);
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
		}
			return "stock_newsItem";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
