package com.stock.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.jms.Session;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

public class Filter implements javax.servlet.Filter{
	private static int count;
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init_filter");
		count = Integer.parseInt(config.getInitParameter("count_number"));
		System.out.println(count);
		//System.out.println(config.toString()+"    init");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("byebye");
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("asad:"+((HttpServletRequest)req).getRequestURI());
		ServletContext sc = req.getServletContext();
		count++;
		
		sc.setAttribute("count", count);
		HttpServletRequest request = (HttpServletRequest)req; 
		HttpServletResponse response = (HttpServletResponse)res;
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		//System.out.println("888");
		// TODO Auto-generated method stub
		HttpSession session = (HttpSession)request.getSession();
		if(session.getAttribute("user")==null){
			System.out.println("none");
		}
		chain.doFilter(request, response);
		//System.out.println("bye");
	}



}
