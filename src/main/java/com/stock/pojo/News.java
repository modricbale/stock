package com.stock.pojo;

import java.util.Date;

public class News {
	private Integer news_id;
	private String news_title;
	private String news_source;
	private String news_time;
	private String news_type;
	private String news_content;
	private double news_weight;
	private String news_keywords;
	private String news_area;
	private String news_industry;
	public double getNews_weight() {
		return news_weight;
	}
	public void setNews_weight(double news_weight) {
		this.news_weight = news_weight;
	}
	public String getNews_keywords() {
		return news_keywords;
	}
	public void setNews_keywords(String news_keywords) {
		this.news_keywords = news_keywords;
	}
	public String getNews_area() {
		return news_area;
	}
	public void setNews_area(String news_area) {
		this.news_area = news_area;
	}
	public String getNews_industry() {
		return news_industry;
	}
	public void setNews_industry(String news_industry) {
		this.news_industry = news_industry;
	}
	public Integer getNews_id() {
		return news_id;
	}
	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_source() {
		return news_source;
	}
	public void setNews_source(String news_source) {
		this.news_source = news_source;
	}
	public String getNews_time() {
		return news_time;
	}
	public void setNews_time(String news_time) {
		this.news_time = news_time;
	}
	public String getNews_type() {
		return news_type;
	}
	public void setNews_type(String news_type) {
		this.news_type = news_type;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String toString(){
	return "News [news_id=" + news_id + ", news_title=" + news_title + ", news_source=" + news_source + ", news_time="
	+ news_time + ", news_type=" + news_type + ", news_content=" + news_content + "]";
	}
}
