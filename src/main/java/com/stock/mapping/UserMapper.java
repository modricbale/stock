package com.stock.mapping;

import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;

import com.stock.pojo.User;

public interface UserMapper {
	
		int deleteByPrimaryKey(Integer u_id);

		int insert(User user);

		int insertSelective(User user);

		User selectByPrimaryKey(Integer u_id);
	    
	    List<User> selectall();
	    /**
	     * 用户本人完善个人信息
	     * */
	    int updateByPrimaryKeySelective(User user);

	    int updateByPrimaryKey(User user);
	    
	    /**
	     * 根据用户名查找个人信息
	     * */
	    public  User selectByName(String u_name);
	    
	    /**
	     * 用户修改个人信息
	     * */
	    int updateByName(String name);
	    
	    /**
	     * 统计用户数量
	     * */
	    int countNum();
	   
	    /**
		 * 注册
		 * @author Xiaoyan
		 */
		int insertUser(User user);
		
		/**
		 * 登录
		 * @author Xiaoyan
		 */
		User userLogin(Map usermap);
		
	
	    
		/**
	     * 根据email查询用户是否存在
	     * @author Xiaoyan
	     */
	    public User selectByEmail(String u_email);
	    
	    int updateByPrimaryKey1(User user);
}
