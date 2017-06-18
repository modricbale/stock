package com.stock.pojo;

public class Collect {
	private Integer collect_id;
	private String stock_cd;
	private Integer user_id;
	public Integer getCollect_id() {
		return collect_id;
	}
	public void setCollect_id(Integer collect_id) {
		this.collect_id = collect_id;
	}
	public String getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String toString(){
		return "Collect [collect_id=" + collect_id + ", stock_cd=" + stock_cd + ", user_id=" + user_id + "]";
	
	}
}
