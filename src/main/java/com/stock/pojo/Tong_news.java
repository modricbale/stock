package com.stock.pojo;

public class Tong_news {
	private int id;
	private String main_service;
	private String category;
	private String rank;
	private String controller;
	private String company_name;
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	private String news_title;
	private String news_source;
	private String news_content;
	private String news_time;
	private String operate_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMain_service() {
		return main_service;
	}
	public void setMain_service(String main_service) {
		this.main_service = main_service;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getController() {
		return controller;
	}
	public void setController(String controller) {
		this.controller = controller;
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
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_time() {
		return news_time;
	}
	public void setNews_time(String news_time) {
		this.news_time = news_time;
	}
	public String getOperate_date() {
		return operate_date;
	}
	public void setOperate_date(String operate_date) {
		this.operate_date = operate_date;
	}
	
}
