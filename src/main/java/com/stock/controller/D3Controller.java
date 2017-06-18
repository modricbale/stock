package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.classification.InterfaceAudience.Public;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.fabric.Response;
import com.sun.xml.bind.v2.model.core.ID;

import code.Connect_stock;
import code.Dbscan_stock;
import code.Dbscan_stock_entity;
import code.Shareholder;
import code.Stock_process;
import code.Tools;



@Controller
public class D3Controller {
	
	@RequestMapping("/d3")
	public String d3(HttpServletRequest req,Model model){
	//得到二维数组矩阵数据供dbscan使用
		if(req.getParameter("starttime")==null){
			System.out.println("11111");
			Double radius = 0.89;//控制相关系数
			int minPts = 2;//控制个数
			String start = "2015-06-30";//起始日期
			String end = "2015-09-30";//结束日期
			Double therehold = 0.86; //生成边的最低下限
			//获取所有指定日期内的股东信息
			TreeMap<String, TreeMap<String,ArrayList<Shareholder>>> hs_test = Tools.connect("shareho"
					+ "lder", "shareholder2", start,end);
			//获取所有指定日期内股票信息
			TreeMap<String, TreeMap<String,String>> hs_stock = Connect_stock.connect2("scrapy_news",start, end);
			
			ArrayList<Object> obj = Tools.get_similar_stock_generate_Arr2(
					hs_test,hs_stock,start,end);
			
			HashMap<String, Integer> field = (HashMap<String, Integer>)obj.get(0);
			
			Double[][] arr2 = (Double[][])obj.get(1);
	//		System.out.println("fff "+arr2[0][0]+" "+arr2[1][1]+
	//				" "+arr2[2][2]+" "+arr2[3][3]+" "+arr2[4][4]+" "+arr2[5][5]);
			ArrayList<String[]> contents = (ArrayList<String[]>)obj.get(2);
			Dbscan_stock db = new Dbscan_stock(radius, minPts);
			ArrayList<Dbscan_stock_entity> arr = db.gen(field);		
			ArrayList<Dbscan_stock_entity> result = db.process(arr, field, arr2);
			String str_d3 = Tools.get_similar_stock_generate_json(hs_test,hs_stock, contents,result,start,end,therehold);		
			model.addAttribute("str_d3", str_d3);
			return "echarts";
		}
		else{
			
			Double radius = Double.parseDouble(req.getParameter("radius"));//控制相关系数
			int minPts = Integer.parseInt(req.getParameter("minPts"));//控制个数
			String start = req.getParameter("starttime");//起始日期
			String end = req.getParameter("endtime");//结束日期
			Double therehold =Double.parseDouble(req.getParameter("therehold")); //生成边的最低下限
			//获取所有指定日期内的股东信息
			TreeMap<String, TreeMap<String,ArrayList<Shareholder>>> hs_test = Tools.connect("shareho"
					+ "lder", "shareholder2", start,end);
			//获取所有指定日期内股票信息
			TreeMap<String, TreeMap<String,String>> hs_stock = Connect_stock.connect2("scrapy_news",start, end);
			System.out.println("finish");
			ArrayList<Object> obj = Tools.get_similar_stock_generate_Arr2(
					hs_test,hs_stock,start,end);
			
			HashMap<String, Integer> field = (HashMap<String, Integer>)obj.get(0);
			
			Double[][] arr2 = (Double[][])obj.get(1);
	//		System.out.println("fff "+arr2[0][0]+" "+arr2[1][1]+
	//				" "+arr2[2][2]+" "+arr2[3][3]+" "+arr2[4][4]+" "+arr2[5][5]);
			
			ArrayList<String[]> contents = (ArrayList<String[]>)obj.get(2);
			Dbscan_stock db = new Dbscan_stock(radius, minPts);
			ArrayList<Dbscan_stock_entity> arr = db.gen(field);		
			ArrayList<Dbscan_stock_entity> result = db.process(arr, field, arr2);
			String str_d3 = Tools.get_similar_stock_generate_json(hs_test,hs_stock, contents,result,start,end,therehold);		
			model.addAttribute("str_d3", str_d3);	
			return "echarts";
		}
	}
	@RequestMapping("/ajax_stock")
	public void ajax_stock(HttpServletRequest req,HttpServletResponse res,Model model) throws IOException{
		String name = req.getParameter("name");
		
		String end = req.getParameter("end");
		if(end==null||end.equals("")){
			
			end="2015-09-30";
		}
		String msg = Tools.ajax_stock("scrapy_news", "scrapy_news", name, end);
		res.setContentType("text/html;charset=utf-8");
        res.setHeader("Cache-Control", "no-cache");
		PrintWriter out = res.getWriter();
		out.print(msg);
		
	}
}
