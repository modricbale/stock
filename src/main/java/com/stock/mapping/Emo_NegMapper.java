package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Emo_Neg;

public interface Emo_NegMapper {
	
	int insertneg(Emo_Neg emoneg);
	
	List<String> selectallneg();
	
	Emo_Neg selectByWordneg(String emotion_neg_word);
}
