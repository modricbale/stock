package com.stock.pojo;

public class area_tag {
	private int atag_id;
	private String atag_name;
	public int getAtag_id() {
		return atag_id;
	}
	public void setAtag_id(int atag_id) {
		this.atag_id = atag_id;
	}
	public String getAtag_name() {
		return atag_name;
	}
	public void setAtag_name(String atag_name) {
		this.atag_name = atag_name;
	}
	@Override
	public String toString() {
		return "area_tag [atag_id=" + atag_id + ", atag_name=" + atag_name + "]";
	}
	
}
