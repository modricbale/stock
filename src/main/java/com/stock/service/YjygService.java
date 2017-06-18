package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.GgsdMapper;
import com.stock.mapping.YjygMapper;
import com.stock.pojo.Ggsd;
import com.stock.pojo.Yjyg;

@Service
@Transactional
public class YjygService {
	@Autowired
	YjygMapper yjygMapper;
	
	public List<Yjyg>select_all(int page){
		return yjygMapper.select_all(page);
	}
}
