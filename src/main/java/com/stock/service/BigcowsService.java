package com.stock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.BigcowsMapper;
import com.stock.mapping.StockMapper;

@Service
@Transactional
public class BigcowsService {
	@Autowired
	BigcowsMapper bigcowsMapper;
	
	public List<Map<String, Object>> querybigcows(){
		List<Map<String, Object>> list = bigcowsMapper.showbigcows();
		return list;
	}
}
