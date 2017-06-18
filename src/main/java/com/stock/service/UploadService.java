package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.UploadMapper;
import com.stock.pojo.Upload;

@Service
@Transactional
public class UploadService {

	@Autowired 
	UploadMapper UploadMapper;
	public void insert(Upload up){
		UploadMapper.insert(up);
	}
	
	public Upload select(Integer id){
		return UploadMapper.select(id);
	}
	
	public List<Upload> selectname(){
		return UploadMapper.selectname();
	}
}
