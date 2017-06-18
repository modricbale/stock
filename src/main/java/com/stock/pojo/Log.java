package com.stock.pojo;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
	   private static final long serialVersionUID = 1024792477652984770L;  
	   
	    private Integer userid;//用户id  
	    private String createdate;//日期  
	    private String content;//日志内容  
	    private String operation;//操作(主要是"查看"、"收藏"、"登录") 
	    private Integer type;//操作类型
	    private String yuxiao;//玉筱专属备用
		public Integer getType() {
			return type;
		}
		public void setType(Integer type) {
			this.type = type;
		}
		public String getYuxiao() {
			return yuxiao;
		}
		public void setYuxiao(String yuxiao) {
			this.yuxiao = yuxiao;
		}
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getCreatedate() {
			return createdate;
		}
		public void setCreatedate(String createdate) {
			this.createdate = createdate;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getOperation() {
			return operation;
		}
		public void setOperation(String operation) {
			this.operation = operation;
		} 
}
		