package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Tong_news;

public interface Tong_newsMapper {
	List<Tong_news> select_all(int page);
	List<Tong_news> select_day(String today,int page);
	List<Tong_news> select_week(String today,String last,int page);
	List<Tong_news> select_month(String today,String last,int page);
	int count_all(String today);
	int count_day(String today);
	int count_week(String week,String last);
	int count_month(String month,String last);
	List<Tong_news>company_name(String today);
	int company_name_count(String today);
	List<String> news_source(String today);
	List<String> news_source_week(String today,String last);
	List<String> news_source_month(String today,String last);
	int news_source_count(String today);
	List<String> category(String today);
	List<String> category_week(String today,String last);
	List<String> category_month(String today,String last);
	int category_count(String today);
}
