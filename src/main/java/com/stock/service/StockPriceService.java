package com.stock.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.StockMapper;
import com.stock.mapping.StockPriceMapper;
import com.stock.pojo.Stock;
import com.stock.pojo.StockPrice;
import com.stock.utils.Pager;
import com.stock.utils.getStockData;
import com.stock.utils.getStockData1;

@Service
@Transactional
public class StockPriceService {
	@Autowired
	StockPriceMapper stockPriceMapper;
	@Autowired
	StockMapper stockMapper;
	@Autowired
	StockService stockService;
	public List<Map<String,Object>> listAllStockPrice(){
	//	HashMap<String,Integer> map=new HashMap<String,Integer>();
	//	map.put(arg0, arg1);
		List<Map<String,Object>> list = stockPriceMapper.listAllStockPrice();
	//		for (int i = 0; i < stockPrices.size(); i++) {
	//			System.out.println(stockPrices.get(i).getStock_cd());
	//		}
		return list;
	}
	
	//查询股票价格涨跌数据
	public List<StockPrice> getAllStockPrice(Pager pager) throws Exception{
		StockPrice sp=new StockPrice();
		List<Stock> stock = stockMapper.listAllStock();
		//股票价格列表
		List<StockPrice> stockprices = new LinkedList<StockPrice>();
		for (int i = pager.getStart(); i < pager.getStart() + pager.getPageSize() ; i++) {
			StockPrice stockprice = new StockPrice();
			String stock_code = stock.get(i).getStock_cd();
			if(stockMapper.selectByStockcd(stock_code).equals("XSHG")){
			//	System.out.println("XXXXXXXXXXXXXSSSSSSSSSSSHHHHHHHHHHHGGGGGGGGGGGGGGG");
				stockprice.setSp_code(stock_code);
				//获得上海交易所的股票价格信息
				String[] stockPrice_sh = getStockData.getStockPrice_sh(stock_code);
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
				String[] stockPrice1_sh = getStockData1.getStockPrice1_sh(stock_code);
				stockprice.setUpdown_money(Double.valueOf(stockPrice1_sh[2]));
				stockprice.setUpdown_rate(Double.valueOf(stockPrice1_sh[3]));
				
				stockprices.add(stockprice);
			}else{
				//System.out.println("!其他！！！！！！！！！！！！！！！！！！");
				stockprice.setSp_code(stock_code);
				//获得深圳交易所的股票价格信息
				String[] stockPrice_sh = getStockData.getStockPrice_sz(stock_code);
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
								
				//获得深圳交易所的股票涨跌信息
				String[] stockPrice1_sh = getStockData1.getStockPrice1_sz(stock_code);
				stockprice.setUpdown_money(Double.valueOf(stockPrice1_sh[2]));
				stockprice.setUpdown_rate(Double.valueOf(stockPrice1_sh[3]));
				
				stockprices.add(stockprice);
			}
		}
		
		return stockprices;
	}
	
}
