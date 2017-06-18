package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Emo_Pos;

public interface Emo_PosMapper {

	int insertpos(Emo_Pos emopos);
	
	List<String> selectallpos();
	
	Emo_Pos selectByWordpos(String emotion_pos_word);
}
