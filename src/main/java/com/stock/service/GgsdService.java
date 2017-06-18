package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.DzjyMapper;
import com.stock.mapping.GgsdMapper;
import com.stock.pojo.Dzjy;
import com.stock.pojo.Ggsd;

@Service
@Transactional
public class GgsdService {
	@Autowired
	GgsdMapper ggsdMapper;
	
	public List<Ggsd>select_all(int page){
		return ggsdMapper.select_all(page);
	}
}
