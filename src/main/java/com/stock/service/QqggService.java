package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.GgsdMapper;
import com.stock.mapping.QqggMapper;
import com.stock.pojo.Ggsd;
import com.stock.pojo.Qqgg;

@Service
@Transactional
public class QqggService {
	@Autowired
	QqggMapper qqggMapper;
	
	public List<Qqgg>select_all(int page){
		return qqggMapper.select_all(page);
	}
}
