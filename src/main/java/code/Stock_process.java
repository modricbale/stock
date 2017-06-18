package code;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;

import javax.tools.Tool;

public class Stock_process {
	public static void main(String args[]){
		String start = "2007-10-23";
		String next = start;
//		String end = Tools.get_next_year(start);	
		String end = "2007-11-11";	
		TreeMap<String, TreeMap<String,String>> hs = Connect_stock.connect("scrapy_news",start,end);
//		getcd("*ST中企 概念板块",hs,start,next,end);
		Set set = hs.keySet();
		Iterator<String> iterator = set.iterator();
		ArrayList<String[]> contents = new ArrayList<String[]>();
		ArrayList<String> judge = new ArrayList<String>();
		String[] headers ={"Source","Target","Value"};
		contents.add(headers);
		while(iterator.hasNext()){
			String stock_name = iterator.next();
			ArrayList<String[]> arr = getcd(stock_name, hs, start, next, end);
			for(int j=arr.size()-1;j>=0;j--){
				String tmp1 = arr.get(j)[0];
				String tmp2 = arr.get(j)[1];
				String tmp3 = arr.get(j)[2];				
				if(judge.contains(tmp2.trim()+tmp1.trim())){
					//System.out.println("1");
					arr.remove(j);
				}
				else{
					judge.add(tmp1.trim()+tmp2.trim());
				}
			}
			contents.addAll(arr);
		}
		Tools.write(contents,"info");
	}
	
	
	
	//获取超过阈值的股票集合
	public static ArrayList<String[]> getcd(String stock_name,TreeMap<String, TreeMap<String,String>> hs,String start,String next,String end){		
		ArrayList<String> date_arr = new ArrayList<String>();
		String cd="";
		date_arr.add(start);
		for(int i=0;;i++){
			next = Tools.get_next_day(next);		
			
			if(next.equals(end)){
				break;
			}
			date_arr.add(next);
		}
		//System.out.println(date_arr);
		//找出需要对比的股票
		TreeMap<String, String> tr1 = hs.get(stock_name);
		Set s = hs.keySet();
		Iterator it = s.iterator();
		ArrayList<String[]>arr = new ArrayList<String[]>();
		while(it.hasNext()){
			String name = (String) it.next();
			TreeMap<String, String> tr2 = hs.get(name);
			ArrayList<Double> r1 = Tools.getR(tr1,date_arr);
			ArrayList<Double> r2 = Tools.getR(tr2,date_arr);
			Double cd_tmp = Tools.getCd(r1, r2);
			cd = String.format("%.8f", cd_tmp);
			//System.out.println(name+": "+cd);
			System.out.println(cd);
			if(Double.parseDouble(cd)>0.94){
			String[] arr_tmp = {stock_name,name,cd};
			arr.add(arr_tmp);
			}
		}
		return arr;
//		TreeMap<String, String> tr1 = hs.get("*ST中企 概念板块");
//		TreeMap<String, String> tr2 = hs.get("新五丰 A 农林牧渔");
//		ArrayList<Double> r1 = Tools.getR(tr1,date_arr);
//		ArrayList<Double> r2 = Tools.getR(tr2,date_arr);
//		Double cd_tmp = Tools.getCd(r1, r2);
//		String cd = String.format("%.8f", cd_tmp);
//		System.out.println("haha: "+cd);
		
	}
	
}



