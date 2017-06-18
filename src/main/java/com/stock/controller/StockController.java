package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.NameList;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.alibaba.fastjson.JSON;

import com.stock.mapping.StockMapper;
import com.stock.pojo.News;
import com.stock.pojo.Stock;
import com.stock.pojo.StockPrice;
import com.stock.pojo.User;
import com.stock.service.CommentService;
import com.stock.service.LogService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.StockPriceService;
import com.stock.service.StockService;
import com.stock.service.UserService;
import com.stock.utils.Pager;


@Controller
public class StockController {

	@Autowired
	StockService stockService;
	@Autowired
	StockPriceService stockPriceService;
	@Autowired
	NewsService newsService;
	@Autowired
	CommentService commentService;
	@Autowired
	ReplyService replyService;
	@Autowired
	LogService logService;

	IKCommentController ikcomments= new IKCommentController();
	
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
	
	
	@RequestMapping(value = "/show_graph")
	public String index(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		String stock_cd=(req.getParameter("stockCd"));
		//System.out.println(req.getParameter("stockCd"));
		
		Stock stock=new Stock();
	    stock=stockService.getStock(stock_cd);
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
		
	    int stock_id = stock.getStock_id();
		List<Map<String, Object>>list6 = commentService.queryComment1(stock_id);
		//System.out.println(news);
		List<Map<String, Object>>list7 = replyService.queryReply1(stock_id);
		model.addAttribute("stock",stock);
		model.addAttribute("list6",list6);
		model.addAttribute("list7",list7);
		model.addAttribute("src1", src1);
		model.addAttribute("src2", src2);
		model.addAttribute("src3", src3);
		model.addAttribute("src4", src4);
		return "kline_graph";
	}

	
	@RequestMapping(value="/stock_detail")
	public String queryStock(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception{
		
		String stock_cd=(req.getParameter("stockCd"));
		//System.out.println(req.getParameter("stockCd"));
		Stock stock=new Stock();
	    stock=stockService.getStock(stock_cd);
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

		
		
		HashMap<String, ArrayList<String>> all_trace =get_all_trace();
		System.out.println(all_trace);
		String stock_name = stock.getSec_short_name();
		Set<String>set = all_trace.keySet();
		Iterator<String> iterator = set.iterator();
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		while(iterator.hasNext()){
			String user_name = iterator.next();
			ArrayList<String> arrayList = all_trace.get(user_name);
			if(arrayList.contains(stock_name)){
				for(int j=0;j<arrayList.size();j++){
					String name = arrayList.get(j);
					if(hMap.get(name)==null){
						hMap.put(name, 1);
					}
					else{
						hMap.replace(name, hMap.get(name), hMap.get(name)+1);
					}
				}
			}
		}
		hMap.remove(stock_name);		
		
		List<Map.Entry<String, Integer>> infoIds2 =
			    new ArrayList<Map.Entry<String, Integer>>(hMap.entrySet());
		
		Collections.sort(infoIds2, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
		//System.out.println(infoIds2);
		model.addAttribute("hMap", infoIds2);
		return "stock_details";
	}
	
	@RequestMapping(value="/stock_detail1")
	public String queryStock1(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception{
		String stock_cd=(req.getParameter("stockCd"));
		//System.out.println(req.getParameter("stockCd"));
		Stock stock=new Stock();
	    stock=stockService.getStock(stock_cd);
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
	
	
	
	@RequestMapping(value="/stock_query")
	public String queryStocks(int pageNum ,Model model) throws Exception{
		
		Pager pager = new Pager(2870, pageNum);
		List<Stock> stocks =stockService.getAllStock(pager);
		model.addAttribute("stocks",stocks);
		
		List<StockPrice> stockprices = new LinkedList<StockPrice>();
		//System.out.println(pageNum);
		stockprices=stockPriceService.getAllStockPrice(pager);
		model.addAttribute("stockPrices",stockprices);
		model.addAttribute("pager",pager);
		return "index2";
	}

	@RequestMapping(value="/searchItem")
	public String searchStock(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception{
		String stock_cd=(req.getParameter("stock_cd"));
		System.out.println(req.getParameter("stock_cd"));
		Stock stock=new Stock();
	    stock=stockService.getStock(stock_cd);
		model.addAttribute("stock",stock);
		
		return "stock_details";
	}
	
	@RequestMapping(value="/search")
	@ResponseBody
	public void search(Model model,HttpServletRequest req,HttpServletResponse res) throws Exception{
        String key= new String(req.getParameter("key").getBytes("iso-8859-1"),"utf-8");
        System.out.println(req.getCharacterEncoding());
        
        System.out.println(key);
        Pattern pattern = Pattern.compile("^[\u4E00-\u9FA5]+$",Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(key);
        List<Stock> cds=null;
        if(matcher.matches()){
        	System.out.println("输入的是中文");
        	cds =stockService.getAllSearch1("%"+key+"%");
        	
        }
        else{
        	System.out.println("输入的是代码");
        	cds =stockService.getAllSearch("%"+key+"%");
        }
        res.setCharacterEncoding("UTF-8");
	 	
		model.addAttribute("cds",cds);
		String json=(String) JSON.toJSONString(cds,true);		
		PrintWriter writer=res.getWriter();
		System.out.println(json);
		writer.write(json);
		writer.flush();
		writer.close();
		
	}
	
	
	
	
	@RequestMapping(value="/stock_detail2")
	public String queryStock2(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception{
		
		String name1 = new String(req.getParameter("index").getBytes("iso-8859-1"),"utf-8");
		System.out.println(name1);
		//System.out.println(req.getParameter("stockCd"));
		Stock stock=stockService.getStockbyname(name1);
	    
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

		
		
		HashMap<String, ArrayList<String>> all_trace =get_all_trace();
		String stock_name = stock.getSec_short_name();
		Set<String>set = all_trace.keySet();
		Iterator<String> iterator = set.iterator();
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		while(iterator.hasNext()){
			String user_name = iterator.next();
			ArrayList<String> arrayList = all_trace.get(user_name);
			if(arrayList.contains(stock_name)){
				for(int j=0;j<arrayList.size();j++){
					String name = arrayList.get(j);
					if(hMap.get(name)==null){
						hMap.put(name, 1);
					}
					else{
						hMap.replace(name, hMap.get(name), hMap.get(name)+1);
					}
				}
			}
		}
		List<Map.Entry<String, Integer>> infoIds2 =
			    new ArrayList<Map.Entry<String, Integer>>(hMap.entrySet());
		
		Collections.sort(infoIds2, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        //return (o2.getValue() - o1.getValue()); 
		    	return (o2.getValue() - o1.getValue()); 
		    }
		}); 
		System.out.println(infoIds2);
		model.addAttribute("hMap", infoIds2);
		return "stock_details";
	}
	
	
	
	
}
