package com.stock.mapping;

import java.util.List;
import java.util.Map;

import com.stock.pojo.News;
import com.stock.pojo.Stock;
import com.stock.utils.Pager;


public interface StockMapper {
    //查询单个股票信息
	Stock selectByPrimaryKey(Integer stock_id);
	//根据股票代码查询单个股票信息
	Stock selectByStockCd(String stock_cd);
	
	Stock selectByname(String stock_name);
	//查询股票所属证券所
	String selectByStockcd(String stock_cd);
	
	String selectnamebycd(String stock_cd);
	
	//用于搜索
	List<Stock> chooseByStockCd(String stock_cd);
	List<Stock> chooseByStockShortName(String sec_short_name);
    //列出全部股票
    List<Stock> listAllStock();
    List<Stock> getid();
    //列出全部股票
    List<Stock> listAllStockByPage(Map map);
	
    List<String> selectname();
}
