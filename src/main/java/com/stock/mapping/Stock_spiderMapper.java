package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Stock_spider;



public interface Stock_spiderMapper {
	List<Stock_spider> select_all(int page);
	List<Stock_spider> select_day(String today,int page);
	List<Stock_spider> select_week(String today,String last,int page);
	List<Stock_spider> select_month(String today,String last,int page);
	int count_all();
	int count_day(String today);
	int count_week(String week,String last);
	int count_month(String month,String last);
	int count_company(String today);
	//股票行业涨跌统计
	List<Stock_spider> category(String today);
	List<Stock_spider> category_all(String today,String last);
}
