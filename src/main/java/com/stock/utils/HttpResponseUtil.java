package com.stock.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.stock.pojo.BaseResponse;

public class HttpResponseUtil {

	private static final Logger log = LoggerFactory.getLogger(HttpResponseUtil.class);
	
	public static void writeJsonResponse(HttpServletResponse resp,
			Map<String, Object> data) {
		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.write(JSON.toJSONString(data));
			log.info("Send Json["+JSON.toJSONString(data)+"] Response");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}
	public static <T> void writeJsonResponse(HttpServletResponse resp,
			BaseResponse<T> obj) {
		PrintWriter pw = null;
		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=UTF-8");
			pw = resp.getWriter();
			pw.write(JSON.toJSONString(obj));
			log.info("Send Json["+JSON.toJSONString(obj)+"] Response");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}

	public static void writeJsResponse(HttpServletResponse resp, String msg){
		PrintWriter pw = null;
		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=UTF-8");
			pw = resp.getWriter();
			pw.write("<script>"+msg+"</script>");
			log.info("Sending Js["+msg+"] Response");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}
	
	
	public static void main(String[] args) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("retcode", "1000");
		data.put("value", "haha");
		writeJsonResponse(null, data);
	}
}