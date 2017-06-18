package com.stock.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.stock.mapping.ReplyMapper;
import com.stock.pojo.Comment;
import com.stock.pojo.Reply;

@Service
@Transactional
public class ReplyService {
		
	@Autowired 
	ReplyMapper replymapper;
	public void reply_delete_by_id(int r_id){
		replymapper.deleteByPrimaryKey(r_id);
	}
	
	public void updateByPrimaryKeySelective(Reply reply){ 
		replymapper.updateByPrimaryKeySelective(reply);
    }
	
    public void InsertReply(Reply reply){
    	replymapper.insert(reply);
    }

    public int getreplycount(Integer news_id){
    	int i = replymapper.getreplycount(news_id);
    	return i;
    }
    
    public int getstock_reply_count(Integer stock_id){
    	int i = replymapper.get_stock_reply_count(stock_id);
    	return i;
    }
    

    public List<Map<String, Object>> all_comment_reply(){
    	List<Map<String, Object>> list1 = replymapper.all_comment_reply();
		return list1;
    }
    
	public List<Map<String, Object>> queryReply(Integer news_id){
		List<Map<String, Object>> list = replymapper.selectall(news_id);
		return list;
	}

	public ArrayList<Reply> getreply(Integer news_id){
		ArrayList<Reply> list = replymapper.getreply(news_id);
		return list;
	}
	
	public List<Map<String, Object>> queryReply1(Integer stock_id){
		List<Map<String, Object>> list = replymapper.selectall1(stock_id);
		return list;
	}


}
