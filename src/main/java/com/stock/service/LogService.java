package com.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.LogMapper;
import com.stock.pojo.Log;


@Service
@Transactional
public class LogService {
	
	@Autowired LogMapper logmapper;
	
    public void log(Log log) {  
        logmapper.insert(log);  
    }  
    
    public List<String> selecttime(Integer type) {  
         List<String> list = logmapper.selecttime(type) ;      
         return list;
    } 
    
    public List<String> selectstock(Integer type) {  
        List<String> list = logmapper.selectstock(type) ;      
        return list;
   } 
    
    public List<String> selectbytype(Integer type) {  
        List<String> list = logmapper.selectbytype(type) ;      
        return list;
   } 
    
    public List<Log> selectbyuser(Integer userid,Integer type) {  
        List<Log> list = logmapper.selectbyuser(userid,type) ;      
        return list;
   }

    public List<Log> all_trace(Integer userid) {  
        List<Log> list = logmapper.all_trace(userid);     
        return list;
   }
    
    public List<Log> login_trace(Integer user_id,Integer type) {  
        List<Log> list = logmapper.login_trace(user_id,type);  
        return list;
   }
    
}
