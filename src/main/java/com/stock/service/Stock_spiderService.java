package com.stock.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.Stock_spiderMapper;
import com.stock.pojo.Stock_spider;


@Service
@Transactional
public class Stock_spiderService {
	@Autowired
	Stock_spiderMapper stock_spiderMapper;
	
	public List<Stock_spider> select_all(String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		List<Stock_spider> stock_spider_all = stock_spiderMapper.select_all(page_tmp);
		return stock_spider_all;
	}
	
	public List<Stock_spider> select_day(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		List<Stock_spider> stock_spider_day = stock_spiderMapper.select_day(today,page_tmp);
		return stock_spider_day;
	}
	
	public List<Stock_spider> select_week(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -7);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		List<Stock_spider> stock_spider_week = stock_spiderMapper.select_week(today,last,page_tmp);
		return stock_spider_week;
	}
	
	public List<Stock_spider> select_month(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		List<Stock_spider> stock_spider_month = stock_spiderMapper.select_month(today,last,page_tmp);
		return stock_spider_month;
	}
	
	public int count_all(){
		int count_all = stock_spiderMapper.count_all();
		System.out.println("fgfg:"+count_all);
		return count_all;
	}
	public int count_day(String today){
		int count_day = stock_spiderMapper.count_day(today);
		return count_day;
	}
	public int count_week(String today){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -7);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		int count_week = stock_spiderMapper.count_week(today,last);
		//System.out.println("last week:"+last);
		return count_week;
	}
	public int count_month(String today){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		int count_month = stock_spiderMapper.count_month(today,last);
		//System.out.println("last month:"+last);
		return count_month;
	}
	
	public int count_company(String today){
		return stock_spiderMapper.count_company(today);
	}
	
	
	//股票行业涨跌统计
	public List<Stock_spider>category(String today){
		return stock_spiderMapper.category(today);
	}
	
	public List<Stock_spider>category_all(String today,String last){
		return stock_spiderMapper.category_all(today,last);
	}
}
