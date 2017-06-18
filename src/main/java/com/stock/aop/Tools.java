package com.stock.aop;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ibm.icu.util.BytesTrie.Iterator;
import com.stock.service.LogService;


public class Tools {
  
	private  LogService logService = new LogService();
	
	public HashMap<String, Integer> gettime(){
		
		HashMap<String,Integer>  hm = new HashMap<String, Integer>();
		List<String> list = logService.selecttime(1);
		for(int i=0;i<list.size();i++){
			if(hm.get(list.get(i))==null){
				hm.put(list.get(i), 1);
			}
			else{
				hm.replace(list.get(i), hm.get(list.get(i)).intValue(), hm.get(list.get(i)).intValue()+1);
			}
		}
		return hm;
	}

}
