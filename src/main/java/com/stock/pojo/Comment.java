package com.stock.pojo;

public class Comment {
	private Integer com_id;
	private Integer stock_id;
	private Integer news_id;
	private Integer commentator_id;
	private String com_content;
	private String com_time;
	private Integer com_emotion;
	
	
	@Override
	public String toString() {
		return "Comment [com_id=" + com_id + ", stock_id=" + stock_id + ", news_id=" + news_id + ", commentator_id="
				+ commentator_id + ", com_content=" + com_content + ", com_time=" + com_time + ", com_emotion="
				+ com_emotion + ", getCom_id()=" + getCom_id() + ", getStock_id()=" + getStock_id() + ", getNews_id()="
				+ getNews_id() + ", getCommentator_id()=" + getCommentator_id() + ", getCom_content()="
				+ getCom_content() + ", getCom_time()=" + getCom_time() + ", getCom_emotion()=" + getCom_emotion()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
	}
	public Integer getStock_id() {
		return stock_id;
	}
	public void setStock_id(Integer stock_id) {
		this.stock_id = stock_id;
	}
	public Integer getNews_id() {
		return news_id;
	}
	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}
	public Integer getCommentator_id() {
		return commentator_id;
	}
	public void setCommentator_id(Integer commentator_id) {
		this.commentator_id = commentator_id;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_time() {
		return com_time;
	}
	public void setCom_time(String com_time) {
		this.com_time = com_time;
	}
	
	public Integer getCom_emotion() {
		return com_emotion;
	}
	public void setCom_emotion(Integer com_emotion) {
		this.com_emotion = com_emotion;
	}

	
}
