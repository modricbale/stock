package com.stock.mapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.stock.pojo.Reply;

public interface ReplyMapper {
	int deleteByPrimaryKey(Integer r_id);

	int insert(Reply reply);

	List<Map<String, Object>> selectall(Integer news_id);
	
	List<Map<String, Object>> selectall1(Integer stock_id);
	
	int updateByPrimaryKeySelective(Reply reply);
	
	List<Map<String, Object>> all_comment_reply();
	
	ArrayList<Reply> getreply(Integer news_id);
	
	int getreplycount(Integer news_id);
	
	int get_stock_reply_count(Integer stock_id);
}
