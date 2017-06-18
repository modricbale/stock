package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Log;

public interface LogMapper {
	 public void insert(Log log);//添加日志记录  
	 
	 List<String> selecttime(int type);
	 
	 List<String> selectstock(int type);
	 
	 List<String> selectbytype(int type);
	 
	 List<Log> selectbyuser(int userid,int type);
	 
	 List<Log> all_trace(int user_id);
	 
	 List<Log> login_trace(int user_id,int type);
}
