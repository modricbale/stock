package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.GgsdMapper;
import com.stock.mapping.LzggMapper;
import com.stock.pojo.Ggsd;
import com.stock.pojo.Lzgg;

@Service
@Transactional
public class LzggService {
	@Autowired
	LzggMapper lzggMapper;
	
	public List<Lzgg>select_all(int page){
		return lzggMapper.select_all(page);
	}
}
