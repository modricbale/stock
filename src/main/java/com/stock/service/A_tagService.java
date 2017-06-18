package com.stock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.A_tagMapper;
import com.stock.pojo.area_tag;

@Service
@Transactional
public class A_tagService {
	@Autowired
	A_tagMapper a_tagmappper;
	public List<area_tag> tag(){
		List<area_tag> list = a_tagmappper.gettag();
		return list;
	}
}
