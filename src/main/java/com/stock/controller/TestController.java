package com.stock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.MultipartStream.MalformedStreamException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.io.FileUtils;
import org.apache.hadoop.io.compress.bzip2.CBZip2InputStream.STATE;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.aspectj.apache.bcel.classfile.Field;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.mysql.fabric.Response;
import com.mysql.jdbc.Buffer;
import com.stock.pojo.Upload;
import com.stock.service.UploadService;


@Controller
public class TestController {
	@Autowired UploadService uploadService;
	 private String makeFileName(String filename){  //2.jpg
		        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		         return UUID.randomUUID().toString() + "_" + filename;
		      }
		     
	
	@RequestMapping(value = "/test")
	public String index(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		return "upload";
	}
	
	@RequestMapping(value = "/test2")
	public String index3(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		List<Upload>list= uploadService.selectname();
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i));
//		}
		model.addAttribute("list", list);		
		return "download";
	}
	
	@RequestMapping(value = "/download")
	public String index4(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		
		Integer upload_id = Integer.parseInt(req.getParameter("upload_id"));
		String download_name1 = uploadService.select(upload_id).getUpload_name();
		int index= download_name1.lastIndexOf("_");
		String download_name = download_name1.substring(index+1);
		String author_name = uploadService.select(upload_id).getUpload_author();
		String path = "F:/upload"+"/"+author_name;
		//List<Upload>list= uploadService.selectname();
		System.out.println(path);
		String arr[]=(new File(path).list());
		File file = new File(path+"\\"+download_name);
		System.out.println(path+"\\"+download_name);
		if(!file.exists()){
			System.out.println("该文件已被删除");
			return "error";
		}
		else{
			 res.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(download_name, "UTF-8"));
			 FileInputStream in = new FileInputStream(path+"\\"+download_name);
			 OutputStream out = res.getOutputStream();
			 byte buffer[] = new byte[1024];
			         int len = 0;
			          //循环将输入流中的内容读取到缓冲区当中
			          while((len=in.read(buffer))>0){
			              //输出缓冲区的内容到浏览器，实现文件下载
			              out.write(buffer, 0, len);
			          }
			          //关闭文件输入流
			          in.close();
			          //关闭输出流
			          out.close();
			          System.out.println("下载成功");
			         //Thread.sleep(10000);
			         // req.getRequestDispatcher("/upload").forward(req, res);
			          return null;
		}
	}
	
//	@RequestMapping(value = "/upload")
//	public void index2(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
//		
//		String contentRange = req.getHeader("Content-Range");  
//		FileOutputStream out=null;
//		InputStream in=null;
//	//	String nmb = req.getHeader("Content-Language");
//	//	System.out.print("tou:  "+contentRange+"  "); 
//		Enumeration enum1 = req.getHeaderNames();  
//		      
//		    
////		    while(enum1.hasMoreElements()){  
////		        String key = (String)enum1.nextElement();  
////		        String value = req.getHeader(key);  
////		       System.out.println(key + ":" + value);  
////		    }  
////		
//		String message = "";
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
//				req.getSession().getServletContext());
//		if (multipartResolver.isMultipart(req)) {
//			System.out.print("ss");
//			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
//			//System.out.println(req.getParameter("username"));
//			String upload_name;
//			upload_name = multiRequest.getParameter("username");
//			
//			String savePath = "F:/upload"+"/"+upload_name;
//			System.out.print(savePath);
//			File File_dir = new File(savePath);
//			if(!File_dir.exists()){
//				File_dir.mkdirs();
//			}
//			//System.out.print("name:"+upload_name);
//			Iterator<String> iter = multiRequest.getFileNames();
//			
//			while (iter.hasNext()) {
//				
//				 Date date = new Date();
//			 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				 String time=format.format(date);
//				 String tmp = iter.next();
//				//System.out.println("item:"+tmp);
//				 MultipartFile file = multiRequest.getFile((String) tmp);
//				 if (file != null) {
//					String fileName = file.getOriginalFilename();
//					
////					int index = fileName.indexOf(".");
////					String tmp1= fileName.substring(0, index);
////					String tmp2 = fileName.substring(index);
////					String file_name = makeFileName(tmp1+time+tmp2);
//					//System.out.print(file_name);
//					Upload upload = new Upload();
//					upload.setUpload_name(makeFileName(fileName));
//					upload.setUpload_time(time);
//					upload.setUpload_author(upload_name);
//					uploadService.insert(upload);
//					//System.out.println(file_name);
//					//String nametmp = fileName+upload_name; 
//					
//					try{
//					out = new FileOutputStream(savePath + "\\"+fileName);
//					byte buffer[] = new byte[1024];
//					int len = 0;
//				    in = file.getInputStream();
//					while((len=in.read(buffer))>0){
//		             //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
//						out.write(buffer, 0, len);
//					}
//						in.close();
//					}
//					catch(MalformedStreamException e){
//						System.out.print("haoge");
//						out.flush();	
//					}
//					catch(Exception e){	
//						//return "error";
//					}	
//			  }
//		 }
//		out.close();
//		message = "上传成功";
//		PrintWriter writer = res.getWriter();
//		writer.write("success");
//		//req.setAttribute("message",message);	 
//		}
//		//return "message";
//	}
	@RequestMapping(value = "/upload")
	public void index2( @RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "file1", required = false) File file_one,
			@RequestParam(value = "file2", required = false)File file_two,
			HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		FileOutputStream out=null;
		InputStream in=null;
		String message = "";
		System.out.print("caonidaye");
		System.out.print(file_one);
		in = new FileInputStream(file_one);
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
//				req.getSession().getServletContext());
//		if (multipartResolver.isMultipart(req)) {
//			System.out.print("ss");
//			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
//			//System.out.println(req.getParameter("username"));
			String upload_name;
			upload_name = username;
			String savePath = "F:/upload"+"/"+upload_name;
			//System.out.print(savePath);
			File File_dir = new File(savePath);
			if(!File_dir.exists()){
				File_dir.mkdirs();
			}
			Date date = new Date();
		 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 String time=format.format(date);
			
			 if (file_one != null) {
			//		String fileName = file_one.getName();
					//System.out.print(file_one);
					Upload upload = new Upload();
					upload.setUpload_name(":");
					upload.setUpload_time(time);
					upload.setUpload_author(upload_name);
					uploadService.insert(upload);
//					//System.out.println(file_name);
//					//String nametmp = fileName+upload_name; 
				
					//out = new FileOutputStream(file_one);
					byte buffer[] = new byte[1024];
					int len = 0;
					//System.out.print(file_one.getAbsolutePath());
				     //in = new FileInputStream(file_one.getAbsolutePath());
					while((len=in.read(buffer))>0){
		             //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
						out.write(buffer, 0, len);
					}
						in.close();
					}
	
			  }
	
	@RequestMapping(value = "/checkbox")
	public String index4(HttpServletRequest req,HttpServletResponse res) throws ClientProtocolException, IOException{	
		ServletContext sc = req.getServletContext();
		sc.setAttribute("nisd", "sdsdsdsdsdsds");
		return "checkbox";
	}
	
	@RequestMapping(value = "/client")
	public String index(HttpServletRequest req,HttpServletResponse res) throws ClientProtocolException, IOException{	
		CloseableHttpClient httpClient = HttpClients.createDefault();
//		HttpGet httpGet = new HttpGet("http://www.baidu.com/");
//		HttpResponse response = httpClient.execute(httpGet);
//		HttpEntity httpEntity = response.getEntity();
//		String html = new String((EntityUtils.toString(httpEntity)).getBytes("ISO-8859-1"),"UTF-8");
		String url = "http://ww2.sinaimg.cn/large/9d57a855jw1dqpv9fp4yuj.jpg";
		String destfilename = "E:\\TDDOWNLOAD\\cat.jpg";
		HttpGet httpGet = new HttpGet(url);		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream in = httpEntity.getContent();
		File file = new File(destfilename);
		int l = -1;  
		FileOutputStream fout = new FileOutputStream(file);
		byte[] tmp = new byte[1024];
		while((l=in.read())!=-1){
			fout.write(tmp,0,l);
		}
		fout.flush();
		fout.close();
		in.close();
		httpClient.close();
		return "checkbox";
	}
	
	
	@RequestMapping(value = "/client1")
	public String index1(HttpServletRequest req,HttpServletResponse res) throws ClientProtocolException, IOException{	
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://www.baidu.com/");
		HttpResponse response = httpClient.execute(httpGet);
		Header[] headers = response.getAllHeaders();
		for(int i=0;i<headers.length;i++){
			System.out.println(headers[i]);
		}
		return "checkbox";
	}
	
	
	
	
	@RequestMapping(value = "/checkbox1")
	public String index5(HttpServletRequest req,HttpServletResponse res){
		ServletContext sc = req.getServletContext();
		//System.out.println(sc.getAttribute("nisd"));
		String item1 = req.getParameter("input1");
		//System.out.println(item1);
		String item2 = req.getParameter("input2");
		//System.out.println(item2);
		String item3 = req.getParameter("input3");
		//System.out.println(item3);
		String arr[] = req.getParameterValues("chkItem");
		for(int i=0;i<arr.length;i++){
		System.out.println("选中:"+arr[i]);
		System.out.println(req.getParameter((String)arr[i]));
		}
		return "checkbox";
	}
	
	
}
	 
