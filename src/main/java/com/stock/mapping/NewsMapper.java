package com.stock.mapping;

import java.util.List;

import com.stock.pojo.News;


public interface NewsMapper {
	int deleteByPrimaryKey(Integer news_id);

	int insert(News news);

	int insertSelective(News news);

	News selectByPrimaryKey(Integer news_id);
    
    List<News> selectall(String news_type);
   
    int updateByPrimaryKeySelective(News news);

    int updateByPrimaryKey(News news);
    
    List<News> getid();

    News selectByName(String news_title);
    
    int updateByName(String news_itle);
    
    List<News> selectallnews();
    
    int countNum();

    List<News> selectcontent();
}
