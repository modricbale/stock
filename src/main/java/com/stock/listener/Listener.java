package com.stock.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//@WebListener
public class Listener implements HttpSessionListener{
	
	private int count = 0;
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("hahaha");
		// TODO Auto-generated method stub
		count++;
		event.getSession().getServletContext().setAttribute("count", count);
		System.out.println(count);
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("session--destroy");
	}
}