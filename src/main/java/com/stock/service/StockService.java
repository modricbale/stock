package com.stock.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.StockMapper;
import com.stock.pojo.News;
import com.stock.pojo.Stock;
import com.stock.utils.Pager;
import com.alibaba.fastjson.JSON;

@Service
@Transactional
public class StockService {
	@Autowired
	StockMapper stockMapper;
    public Stock getStock(String stock_cd){
    	Stock stock=new Stock();
    	stock=stockMapper.selectByStockCd(stock_cd);
    	return stock;
    }
    
    public Stock getStockbyid(Integer stock_id){
    	Stock stock=new Stock();
    	stock=stockMapper.selectByPrimaryKey(stock_id);
    	return stock;
    }
    
    public Stock getStockbyname(String name){
    	Stock stock=new Stock();
    	stock=stockMapper.selectByname(name);
    	return stock;
    }
	
    public String getStockname(String stock_cd){
    	String stock_name;
    	stock_name = stockMapper.selectnamebycd(stock_cd);
    	return stock_name;
    }
	
    public List<String> selectname(){
    	List<String>list = stockMapper.selectname();
    	return list;
    }
    
	public List<Stock> getAllSearch(String stock_cd){
		
		List<Stock> cds = stockMapper.chooseByStockCd(stock_cd);
		

		return cds;
	}
	public List<Stock> getAllSearch1(String sec_short_name){
		
	
		List<Stock> snames = stockMapper.chooseByStockShortName(sec_short_name);

		return snames;
	}
	
	public List<Stock> getstockid(){
		List<Stock>list = stockMapper.getid();
		return list;
	}
    
	public List<Stock> getAllStock(Pager pager){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		List<Stock> stocks = stockMapper.listAllStockByPage(map);
//		for (int i = 0; i < stocks.size(); i++) {
//			System.out.println(stocks.get(i).getStock_cd());
//		}
		return stocks;
	}
	

}
