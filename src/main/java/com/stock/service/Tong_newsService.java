package com.stock.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.Tong_newsMapper;
import com.stock.pojo.Tong_news;

@Service
@Transactional
public class Tong_newsService {
	@Autowired 
	Tong_newsMapper tong_newsMapper;
	
	public List<Tong_news> select_all(String page){
		int tmp = Integer.parseInt(page)*10-10;
		List<Tong_news> news_all = tong_newsMapper.select_all(tmp);
		return news_all;
	}
	
	public List<Tong_news> select_day(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		List<Tong_news> news_day = tong_newsMapper.select_day(today,page_tmp);
		System.out.println("size:"+news_day.size());
		return news_day;
	}
	
	public List<Tong_news> select_week(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -7);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		List<Tong_news> news_week = tong_newsMapper.select_week(today,last,page_tmp);
		return news_week;
	}
	
	public List<Tong_news> select_month(String today,String page){
		int page_tmp = Integer.parseInt(page)*10-10;
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		List<Tong_news> news_month = tong_newsMapper.select_month(today,last,page_tmp);
		return news_month;
	}
	
	public int count_all(String today){
		int count_all = tong_newsMapper.count_all(today);
		return count_all;
	}
	public int count_day(String today){
		int count_day = tong_newsMapper.count_day(today);
		return count_day;
	}
	public int count_week(String today){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -7);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		int count_week = tong_newsMapper.count_week(today,last);
		//System.out.println("last week:"+last);
		return count_week;
	}
	public int count_month(String today){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		Date tmp = c.getTime();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String last = df.format(tmp);
		int count_month = tong_newsMapper.count_month(today,last);
		//System.out.println("last month:"+last);
		return count_month;
	}
	//今日新闻新闻相关公司
	public List<Tong_news>company_name(String today){
		System.out.println("date:"+today);
		return tong_newsMapper.company_name(today);
	}
	//今日新闻涉及公司数量
	public int company_name_count(String today){
		return tong_newsMapper.company_name_count(today);
	}
	
	//新闻来源统计
	public List<String>news_source(String today){
		return tong_newsMapper.news_source(today);
	}
	//来源一周统计
	public List<String>news_source_week(String today,String last){
		return tong_newsMapper.news_source_week(today,last);
		}
		//行业一月统计
		public List<String>news_source_month(String today,String last){
			return tong_newsMapper.news_source_month(today,last);
		}
	//今日新闻涉及新闻数量
	public int news_source_count(String today){
		return tong_newsMapper.news_source_count(today);
	}
	//行业今日统计
	public List<String>category(String today){
		return tong_newsMapper.category(today);
	}
	//行业一周统计
	public List<String>category_week(String today,String last){
		return tong_newsMapper.category_week(today,last);
	}
	//行业一月统计
	public List<String>category_month(String today,String last){
		return tong_newsMapper.category_month(today,last);
	}
	//行业数目
	public int cetegory_count(String today){
		return tong_newsMapper.category_count(today);
	}
}
