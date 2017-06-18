package com.stock.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.CommentMapper;
import com.stock.mapping.Emo_NegMapper;
import com.stock.mapping.Emo_PosMapper;
import com.stock.pojo.Comment;
import com.stock.pojo.Emo_Neg;
import com.stock.pojo.Emo_Pos;
/**
 * @author Xiaoyan
 */
@Service
@Transactional
public class EmoService {
	
	@Autowired
	Emo_NegMapper emo_NegMapper;
	@Autowired
	Emo_PosMapper emo_PosMapper;
	@Autowired
	CommentMapper commentMapper;
	
	public Emo_Neg selectByWordneg(String word){
		
		Emo_Neg emoneg = emo_NegMapper.selectByWordneg(word);
		return emoneg;
	}
	
	public Emo_Pos selectByWordpos(String word){
		
		Emo_Pos emopos= emo_PosMapper.selectByWordpos(word);
		return emopos; 
	}
	
	//更新评论的情感
	public void updateEmotion(Comment comment, int emotion){
		
		Map id_emo = new HashMap();
		id_emo.put("com_id", comment.getCom_id());
		//System.out.println("papapa"+comment.getCom_id());
		id_emo.put("com_emotion", emotion);
		commentMapper.updateEmotionByPrimaryKey(id_emo);
		
		
	}
	
	//获取某股票的评论数量
	public int selectEmotionNum(Integer stock_id){
		
		return commentMapper.selectEmotionNum(stock_id);
	}
	
	//获取某股票正向情感的数量
    public int selectEmotionpos(Integer stock_id){
    	
    	return commentMapper.selectEmotionpos(stock_id);
    }
    
    //获取某股票逆向情感的数量
    public int selectEmotionneg(Integer stock_id){
    	
    	return commentMapper.selectEmotionneg(stock_id);
    }
}
