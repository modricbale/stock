package com.stock.pojo;

public class Upload {
	private Integer upload_id;
	private String upload_name;
	private String upload_time;
	private String upload_author;
	public String getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}
	public String getUpload_author() {
		return upload_author;
	}
	public void setUpload_author(String upload_author) {
		this.upload_author = upload_author;
	}
	public void setUpload_id(Integer upload_id) {
		this.upload_id = upload_id;
	}
	public int getUpload_id() {
		return upload_id;
	}
	public void setUpload_id(int upload_id) {
		this.upload_id = upload_id;
	}
	public String getUpload_name() {
		return upload_name;
	}
	public void setUpload_name(String upload_name) {
		this.upload_name = upload_name;
	}
	@Override
	public String toString() {
		return "Upload [upload_id=" + upload_id + ", upload_name=" + upload_name + ", upload_time=" + upload_time
				+ ", upload_author=" + upload_author + "]";
	}
	
}
