package com.stock.interceptor;

import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

public class Interceptor2 implements WebRequestInterceptor{

	public void afterCompletion(WebRequest arg0, Exception arg1) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("3");
	}

	public void postHandle(WebRequest arg0, ModelMap arg1) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("2");
	}

	public void preHandle(WebRequest arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("1");
	}

}
