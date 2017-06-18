package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.DzjyMapper;
import com.stock.pojo.Dzjy;

@Service
@Transactional
public class DzjyService {
	@Autowired
	DzjyMapper dzjyMapper;
	
	public List<Dzjy> select_all(int page){
		return dzjyMapper.select_all(page);
	}
}
