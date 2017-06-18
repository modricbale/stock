package com.stock.service;

import java.util.List;

import javax.enterprise.inject.New;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.NewsMapper;
import com.stock.mapping.UserMapper;
import com.stock.pojo.News;
import com.stock.pojo.User;

@Service
@Transactional
public class NewsService {
	
	@Autowired 
	NewsMapper newsMapper;
	
	public void news_delete_by_id(int news_id){
		
		newsMapper.deleteByPrimaryKey(news_id);
	}

	public News selectByName(String news_title){
		News news= newsMapper.selectByName(news_title);
		return news;
	}
	
	public void updateByPrimaryKeySelective(News news){ 
		newsMapper.updateByPrimaryKeySelective(news);
    }
	
	public void updateByName(String news_title){ 
		newsMapper.updateByName(news_title);
    }
	
    public void InsertUser(News news){
    	newsMapper.insert(news);
    }
	
	public News selectByID(Integer news_id){
	    
    	News news=newsMapper.selectByPrimaryKey(news_id);

    	return news;
    }
	
	public List<News> queryNews(String news_type){
		List<News> list = newsMapper.selectall(news_type);
		return list;
	}
	
	public List<News> queryallNews(){
		List<News> list = newsMapper.selectallnews();
		return list;
	}
	
	public List<News> getnewsid(){
		List<News>list = newsMapper.getid();
		return list;
	}
	
	public List<News> getnewscontent(){
		List<News>list = newsMapper.selectcontent();
		return list;
	}
	
}
