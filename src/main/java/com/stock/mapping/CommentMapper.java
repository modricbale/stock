package com.stock.mapping;

import java.util.List;
import java.util.Map;

import com.stock.pojo.Comment;


public interface CommentMapper {
	int deleteByPrimaryKey(Integer com_id);

	int insert(Comment comment);

	int insertSelective(Comment comment);

	Comment selectByPrimaryKey(Integer com_id);
    
    List<Map<String, Object>> selectall(Integer news_id);
    
    List<Map<String, Object>> selectall1(Integer stock_id);
   
    int updateByPrimaryKeySelective(Comment comment);

    int updateByPrimaryKey(Comment comment);
   
    int commentcount(Integer news_id);
    
    int stock_comment_scount(Integer stock_id);
    //更新评论的情感
    int updateEmotionByPrimaryKey(Map id_emo);
    
    /**
     * 获取某股票的评论数量
     * @author Xiaoyan
     */
    int selectEmotionNum(Integer stock_id);
    
    /**
     * 获取某股票正向情感的数量
     * @author Xiaoyan
     */
    int selectEmotionpos(Integer stock_id);
    
    /**
     * 获取某股票逆向情感的数量
     * @author Xiaoyan
     */
    int selectEmotionneg(Integer stock_id);
}


