package com.stock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class Interceptor implements HandlerInterceptor{
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("a");
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("b");
	}

	public boolean preHandle(HttpServletRequest req, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("c");
//		System.out.println("1"+req.getMethod());
//		System.out.println("2"+req.getSession());
//		System.out.println("3"+req.getContentType());
//		System.out.println("4"+req.getContextPath());
//		System.out.println("5"+req.getPathInfo());
//		System.out.println("6"+req.getLocalPort());
//		System.out.println("7"+req.getQueryString());	
//		System.out.println("7"+req.getServletPath());	
		return true;
	}
	
}
