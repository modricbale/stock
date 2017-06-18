package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Collect;
import com.stock.pojo.Comment;
import com.stock.pojo.News;

public interface CollectMapper {
	
	int deleteByPrimaryKey(Integer collect_id);
	
	List<Collect> selectall();
	
	int insert(Collect collect);
	
	Collect selectByPrimaryKey(Integer collect_id);
	
	List<String> selectcdbyid(int user_id);
	
	int deleteBycd(String stock_cd);
}
