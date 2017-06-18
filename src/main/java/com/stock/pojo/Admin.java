package com.stock.pojo;

public class Admin {
	private Integer admin_id;
	private String admin_name;
	
	
	private Integer admin_psd;
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public Integer getAdmin_psd() {
		return admin_psd;
	}
	public void setAdmin_psd(Integer admin_psd) {
		this.admin_psd = admin_psd;
	}
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_psd=" + admin_psd + "]";
	}
	
}
