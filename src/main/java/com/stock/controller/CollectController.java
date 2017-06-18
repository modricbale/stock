package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stock.mapping.StockMapper;
import com.stock.pojo.Collect;
import com.stock.pojo.Stock;
import com.stock.pojo.StockPrice;
import com.stock.service.CollectService;
import com.stock.service.CommentService;
import com.stock.service.NewsService;
import com.stock.service.ReplyService;
import com.stock.service.StockPriceService;
import com.stock.service.StockService;
import com.stock.utils.Pager;
import com.stock.utils.RecommenderCollect;
import com.stock.utils.getStockData;
import com.stock.utils.getStockData1;

@Controller
public class CollectController {
	@Autowired CommentService commentService;
	@Autowired NewsService newsService;
	@Autowired ReplyService replyService;
	@Autowired CollectService collectService;
	@Autowired
	StockService stockService;
	@Autowired
	StockPriceService stockPriceService;
	@Autowired
	StockMapper stockMapper;
	
	
	
	@RequestMapping(value="/admin9")
	public void ppp1(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String stock_cd =req.getParameter("stock_cd");
		//System.out.println(stock_cd);
		int u_id = Integer.parseInt(req.getParameter("u_id"));
		List<String> cd = collectService.selectcdbyid(u_id);
		System.out.println(cd);
		if(!cd.contains(stock_cd)){
		Collect collect = new Collect();
		collect.setStock_cd(stock_cd);
		collect.setUser_id(u_id);
		collectService.insert(collect);
		try {
			//System.out.println("success111111");
			PrintWriter out = res.getWriter();
			out.print("success");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch blocks
			e.printStackTrace();
		}
		
		}
		else{
			PrintWriter out = res.getWriter();
			out.print("fail");
			out.flush();
			out.close();
		}
	}
	
	
	@RequestMapping(value="/collect_delete_by_id")
	public void ppp3(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String stock_cd = req.getParameter("stock_cd");
		System.out.println(stock_cd);
		collectService.deletebycd(stock_cd);
		try {
			PrintWriter out = res.getWriter();
			out.print("success");
			out.flush();
			out.close();
			System.out.println("success");
		} catch (IOException e) {
			// TODO Auto-generated catch blocks
			e.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping(value="/collect")
	public String ppp2(HttpServletRequest req, HttpServletResponse res ,Model model) throws Exception {
		int u_id = Integer.parseInt(req.getParameter("u_id"));
		List<Integer> ArrayList = RecommenderCollect.CFDemo(u_id);
		List<Stock> stocklist = new ArrayList<Stock>();
		for(int i=0;i<ArrayList.size();i++){
			stocklist.add(stockService.getStockbyid(ArrayList.get(i)));
		}
		System.out.println(u_id);
        List<String> stock_cd = collectService.selectcdbyid(u_id);
        List<StockPrice> c_stockprices = new LinkedList<StockPrice>();
        List<String> stock_name = new ArrayList<String>();
        for(int i=0;i<stock_cd.size();i++){
        	if(stockMapper.selectByStockcd(stock_cd.get(i)).equals("XSHG")){
        		String name = stockService.getStockname(stock_cd.get(i));
        		stock_name.add(name);
        		StockPrice stockprice = new StockPrice();
				stockprice.setSp_code(stock_cd.get(i));
				//获得上海交易所的股票价格信息
				String[] stockPrice_sh = getStockData.getStockPrice_sh(stock_cd.get(i));
				stockprice.setTod_opening_pri(Double.valueOf(stockPrice_sh[1]));
				stockprice.setYes_closing_pri(Double.valueOf(stockPrice_sh[2]));
				stockprice.setCurr_pri(Double.valueOf(stockPrice_sh[3]));
				stockprice.setTod_min_pri(Double.valueOf(stockPrice_sh[5]));
				stockprice.setTod_max_pri(Double.valueOf(stockPrice_sh[4]));
				stockprice.setBid_pri(Double.valueOf(stockPrice_sh[6]));
				stockprice.setComp_pri(Double.valueOf(stockPrice_sh[7]));
				stockprice.setTrade_stocks(Integer.valueOf(stockPrice_sh[8]));
				stockprice.setTurn_pri(Double.valueOf(stockPrice_sh[9]));
				stockprice.setSp_date(stockPrice_sh[30]);
				stockprice.setSp_time(stockPrice_sh[31]);
								
				//获得上海交易所的股票涨跌信息
				String[] stockPrice1_sh = getStockData1.getStockPrice1_sh(stock_cd.get(i));
				stockprice.setUpdown_money(Double.valueOf(stockPrice1_sh[2]));
				stockprice.setUpdown_rate(Double.valueOf(stockPrice1_sh[3]));
				
				c_stockprices.add(stockprice);
        	}
        	else{
        		StockPrice stockprice = new StockPrice();
				stockprice.setSp_code(stock_cd.get(i));
				String name = stockService.getStockname(stock_cd.get(i));
        		stock_name.add(name);
				//获得上海交易所的股票价格信息
				String[] stockPrice_sh = getStockData.getStockPrice_sz(stock_cd.get(i));
				stockprice.setTod_opening_pri(Double.valueOf(stockPrice_sh[1]));
				stockprice.setYes_closing_pri(Double.valueOf(stockPrice_sh[2]));
				stockprice.setCurr_pri(Double.valueOf(stockPrice_sh[3]));
				stockprice.setTod_min_pri(Double.valueOf(stockPrice_sh[5]));
				stockprice.setTod_max_pri(Double.valueOf(stockPrice_sh[4]));
				stockprice.setBid_pri(Double.valueOf(stockPrice_sh[6]));
				stockprice.setComp_pri(Double.valueOf(stockPrice_sh[7]));
				stockprice.setTrade_stocks(Integer.valueOf(stockPrice_sh[8]));
				stockprice.setTurn_pri(Double.valueOf(stockPrice_sh[9]));
				stockprice.setSp_date(stockPrice_sh[30]);
				stockprice.setSp_time(stockPrice_sh[31]);
								
				//获得上海交易所的股票涨跌信息
				String[] stockPrice1_sh = getStockData1.getStockPrice1_sz(stock_cd.get(i));
				stockprice.setUpdown_money(Double.valueOf(stockPrice1_sh[2]));
				stockprice.setUpdown_rate(Double.valueOf(stockPrice1_sh[3]));
				c_stockprices.add(stockprice);
				
        	}
        	
        }
       /* for(int i=0;i<stock_name.size();i++){
        	System.out.println(stock_name.get(i));
        }*/
        model.addAttribute("c_stockprices", c_stockprices)	;
        model.addAttribute("stock_name", stock_name);
        model.addAttribute("stocklist",stocklist);
	//	List<Stock>list = stockService.getStock(stock_cd);
        return "collect";
	}
}
