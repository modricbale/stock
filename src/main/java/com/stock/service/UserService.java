package com.stock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.stock.utils.Pager;
import com.stock.mapping.UserMapper;
import com.stock.pojo.User;

@Service
@Transactional
public class UserService {
	
	@Autowired 
	UserMapper userMapper;
	
	public void user_delete_by_id(int u_id){
		
		userMapper.deleteByPrimaryKey(u_id);
	}

	public User selectByName(String u_name){
		User user = userMapper.selectByName(u_name);
		return user;
	}
	
	public void updateByPrimaryKeySelective(User user){ 
		userMapper.updateByPrimaryKeySelective(user);
    }
	
	public void updateByName(String u_name){ 
		userMapper.updateByName(u_name);
    }
	
    public void InsertUser(User user){
    	userMapper.insertSelective(user);
    }
	
	public User selectByID(Integer u_id){
	    
    	User user=userMapper.selectByPrimaryKey(u_id);

    	return user;
    }
	
	public List<User> queryUsers(){
		List<User> list = userMapper.selectall();
		return list;
	}
	
	/**
	 * 查看个人信息
	 * @author Xiaoyan
	 */
	public User selectByPrimaryKey(Integer u_id){
		
		User user = userMapper.selectByPrimaryKey(u_id);
		
		return user;
	}
	
	/**
	 * 修改个人信息
	 * @author Xiaoyan
	 */
	public void updateByPrimaryKey(User user){
		
		userMapper.updateByPrimaryKey1(user);
		
	}
	
	/**
	 * 根据email查询用户是否存在
	 * @author Xiaoyan
	 */
	public User selectByEmail(String u_email){
		
		User user = userMapper.selectByEmail(u_email);
		
		return user;
	}
	
	/**
	 * 用户注册
	 * @author Xiaoyan
	 */
	public boolean userRegister(User user){
		
		userMapper.insertUser(user);
		
		return true;
	}
	
	/**
	 * 用户登录
	 * @author Xiaoyan
	 */
	public User userLogin(String name, String psd){
		
		Map usermap = new HashMap();
		usermap.put("u_name", name);
		usermap.put("u_psd", psd);
		User user = userMapper.userLogin(usermap);
		
		return user;
	}
	
}
