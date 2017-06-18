package com.stock.utils;
import java.io.BufferedReader;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
  
import org.apache.http.HttpEntity;  
import org.apache.http.HttpResponse;  
import org.apache.http.client.ClientProtocolException;  
import org.apache.http.client.HttpClient;  
import org.apache.http.client.methods.HttpGet;  
import org.apache.http.impl.client.DefaultHttpClient;  
public class getStockData {
	 public static String[] getStockPrice_sh(String stock_cd) throws ClientProtocolException, IOException  
	    {  
		   // 创建HttpClient实例      
	        HttpClient httpclient = new DefaultHttpClient();  
	        //  创建Get方法实例      
	        HttpGet httpgets = new HttpGet("http://hq.sinajs.cn/list=sh"+stock_cd);   //sh为请求上海证券所，sz为请求深圳证券所
	        HttpResponse response = httpclient.execute(httpgets);    
	        HttpEntity entity = response.getEntity();    
	        String[] splitAddress = null;
	        if (entity != null) {    
	            InputStream instreams = entity.getContent();    
	            String str = convertStreamToString(instreams);  
	            //System.out.println("获取字符");   
	            //System.out.println(str);  
	            // 截取股票代码字符
	           String getCDInfo = str.substring(str.indexOf("sh") +2, str.indexOf("="));
	            //System.out.println(getCDInfo); 
	            // 截取股票价格字符串
	            String getPriceStr = str.substring(str.indexOf("\"")+1 , str.indexOf("\";"));
	            //System.out.println(getPriceStr); 
	            //分隔字符串
	            splitAddress = getPriceStr.split(",");
	            for (int i=0;i<33;i++)
	            {
	            	//System.out.println(splitAddress[i]);
	            }
	            
	            httpgets.abort();    
	            
	        }  
	        return  splitAddress;
	    }  
	 
	 public static String[] getStockPrice_sz(String stock_cd) throws ClientProtocolException, IOException  
	    {  
		   // 创建HttpClient实例      
	        HttpClient httpclient = new DefaultHttpClient();  
	        //  创建Get方法实例      
	        HttpGet httpgets = new HttpGet("http://hq.sinajs.cn/list=sz"+stock_cd);   //sh为请求上海证券所，sz为请求深圳证券所
	        HttpResponse response = httpclient.execute(httpgets);    
	        HttpEntity entity = response.getEntity();    
	        String[] splitAddress = null;
	        if (entity != null) {    
	            InputStream instreams = entity.getContent();    
	            String str = convertStreamToString(instreams);  
	            //System.out.println("获取字符");   
	            //System.out.println(str);  
	            // 截取股票代码字符
	            String getCDInfo = str.substring(str.indexOf("sz") +2, str.indexOf("="));
	            //System.out.println(getCDInfo); 
	            // 截取股票价格字符串
	            String getPriceStr = str.substring(str.indexOf("\"")+1 , str.indexOf("\";"));
	            //System.out.println(getPriceStr); 
	            //分隔字符串
	            splitAddress=getPriceStr.split(",");
	            for (int i=0;i<33;i++)
	            {
	            	//System.out.println(splitAddress[i]);
	            }
	            
	            httpgets.abort();    
	        }  
	        return  splitAddress;
	    }  
	 
	    public static String convertStreamToString(InputStream is) {      
	        BufferedReader reader = new BufferedReader(new InputStreamReader(is));      
	        StringBuilder sb = new StringBuilder();      
	       
	        String line = null;      
	        try {      
	            while ((line = reader.readLine()) != null) {  
	                sb.append(line + "\n");      
	            }      
	        } catch (IOException e) {      
	            e.printStackTrace();      
	        } finally {      
	            try {      
	                is.close();      
	            } catch (IOException e) {      
	               e.printStackTrace();      
	            }      
	        }      
	        return sb.toString();      
	    }  
	      
}
