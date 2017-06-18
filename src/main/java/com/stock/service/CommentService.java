package com.stock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.stock.mapping.CommentMapper;
import com.stock.pojo.Comment;

@Service
@Transactional
public class CommentService {

	@Autowired 
	CommentMapper commentmapper;
	
	public void comment_delete_by_id(int com_id){
		
		commentmapper.deleteByPrimaryKey(com_id);
	}
	
	public void updateByPrimaryKeySelective(Comment comment){ 
		commentmapper.updateByPrimaryKeySelective(comment);
    }
	
    public void InsertComment(Comment comment){
    	commentmapper.insert(comment);
    }

	
	public List<Map<String, Object>> queryComment(Integer news_id){
		List<Map<String, Object>> list = commentmapper.selectall(news_id);
		return list;
	}
	
	public List<Map<String, Object>> queryComment1(Integer stock_id){
		List<Map<String, Object>> list = commentmapper.selectall1(stock_id);
		return list;
	}
	
	
	public Comment selectByID(Integer com_id){
	    
    	Comment comment=commentmapper.selectByPrimaryKey(com_id);

    	return comment;
    }
	
	public int getcommentcount(Integer news_id){
		int count = commentmapper.commentcount(news_id);
		return count;
	}
	
	public int get_stock_comment_count(Integer stock_id){
		int count = commentmapper.stock_comment_scount(stock_id);
		return count;
	}
	
	
}
