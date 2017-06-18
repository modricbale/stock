package com.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.stock.mapping.StockMapper;
import com.stock.pojo.Comment;
import com.stock.pojo.Emo_Neg;
import com.stock.pojo.Emo_Pos;
import com.stock.pojo.Stock;
import com.stock.service.CollectService;
import com.stock.service.CommentService;
import com.stock.service.EmoService;
import com.stock.service.StockService;

/**
 * @author Xiaoyan
 */
@Controller
public class IKCommentController {

	@Autowired
	CommentService commentService;
	@Autowired
	EmoService emoService;
	@Autowired
	StockService stockService;
	@Autowired
	CollectService collectService;
	
	/**
	 *对股票评论进行评分 
	 *评分说明：正向词出现一次+1,逆向词出现一次-1,最后计算该评论的最终值
	 *最终值评定：积极>0;持中=0;消极<0; 
	 */
	@RequestMapping("/commentMark")
	public String commentMark(HttpServletRequest req, HttpServletResponse res){
		//获取评论 分词 匹配 评分 计算最终值

		//获取用户评论
		Comment comment = commentService.selectByID(59);//传评论id
		System.out.println("用户评论：" + comment.getCom_content());
		req.setAttribute("com_content", comment.getCom_content());
				
		//创建分词对象  
		Analyzer anal=new IKAnalyzer(true);       
		StringReader reader=new StringReader(comment.getCom_content());  
		
		//分词  
		TokenStream ts=anal.tokenStream("", reader);
		CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
		
		List<String> comlist = new ArrayList<String>();
		//遍历分词数据  
		try {
			while(ts.incrementToken()){  
				System.out.print(term.toString()+"|");
				comlist.add(term.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		reader.close();  
		System.out.println();
		
		Emo_Neg emoneg = null;
		Emo_Pos emopos = null;
		int emotion = 0;//情感得分
		//匹配
		for(int i = 0; i < comlist.size(); i++){
			
			System.out.println("comlist的第"+i+"项："+comlist.get(i));
			emoneg = emoService.selectByWordneg(comlist.get(i));
	
			if(null != emoneg){//逆向-1
				emotion--;
			}else{
				emopos = emoService.selectByWordpos(comlist.get(i));
			
				if(null != emopos){
					emotion++;
				}
			}
			
		}
		System.out.println("emotion的值:"+emotion);
		
		//最终值评定,写入数据库
		if(emotion > 0){//积极
			emoService.updateEmotion(comment, 1);
		}else if(emotion < 0){//消极
			emoService.updateEmotion(comment, -1);
		}else{//持中
			emoService.updateEmotion(comment, 0);
		}
		comment = commentService.selectByID(comment.getCom_id());
		System.out.println("用户评论股票的情感倾向："+comment.getCom_emotion());
		req.setAttribute("com_emotion", comment.getCom_emotion());
				
		
		
		return "com_emotion_test";
	}
	
	/**
	 * 获取某股票所有评论的情感倾向
	 * @throws IOException 
	 */
	@RequestMapping("/stockEmotion")
	@ResponseBody
	public void commentEmotion(HttpServletRequest req, HttpServletResponse res, Stock stock) throws IOException{
	    String stock_cd=req.getParameter("stockCd");
		NumberFormat num = NumberFormat.getPercentInstance(); 
		System.out.println(stock_cd);
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2); 
//		double csdn = 0.20; 
//		System.out.println(num.format(csdn));
		int stockid=stockService.getStock(stock_cd).getStock_id();
		stock.setStock_id(stockid);//test

		//获取某股票的评论数量
		int	allCommentNum = emoService.selectEmotionNum(stock.getStock_id());
		System.out.println("所有评论数量："+allCommentNum);
		
		//正向情感
		int posNum = emoService.selectEmotionpos(stock.getStock_id());
		double posPercent = posNum/(double)allCommentNum;
		System.out.println("正向数量："+posNum+";正向百分比:"+num.format(posPercent));
		//逆向情感
		int negNum = emoService.selectEmotionneg(stock.getStock_id());
		double negPercent = negNum/(double)allCommentNum;
		System.out.println("逆向数量："+negNum+";逆向百分比:"+num.format(negPercent));
		
		if(posNum > negNum){
			System.out.println("posNum > negNum");
		}else if(posNum < negNum){
			System.out.println("posNum < negNum");
		}else{
			System.out.println("posNum = negNum");
		}
		
		PrintWriter writer=res.getWriter();
		System.out.println(num.format(posPercent));
		writer.write(num.format(posPercent));
		writer.flush();
		writer.close();
		
		
	}
	
	
}
