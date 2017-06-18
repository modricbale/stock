package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.GgsdMapper;
import com.stock.mapping.GgzjlMapper;
import com.stock.pojo.Ggsd;
import com.stock.pojo.Ggzjl;

@Service
@Transactional
public class GgzjlService {
	@Autowired
	GgzjlMapper ggzjlMapper;
	
	public List<Ggzjl>select_all(int page){
		return ggzjlMapper.select_all(page);
	}
}
