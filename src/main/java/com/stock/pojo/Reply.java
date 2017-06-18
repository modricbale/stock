package com.stock.pojo;

public class Reply {
	private Integer r_id;
	private Integer r_sendid;
	private Integer r_receiveid;
	private Integer r_commentid;
	private String r_content;
	private String r_time;
	private int r_newsid;
	private int r_stockid;
	
	@Override
	public String toString() {
		return "Reply [r_id=" + r_id + ", r_sendid=" + r_sendid + ", r_receiveid=" + r_receiveid + ", r_commentid="
				+ r_commentid + ", r_content=" + r_content + ", r_time=" + r_time + ", r_newsid=" + r_newsid
				+ ", r_stockid=" + r_stockid + ", getR_stockid()=" + getR_stockid() + ", getR_newsid()=" + getR_newsid()
				+ ", getR_id()=" + getR_id() + ", getR_sendid()=" + getR_sendid() + ", getR_receiveid()="
				+ getR_receiveid() + ", getR_commentid()=" + getR_commentid() + ", getR_content()=" + getR_content()
				+ ", getR_time()=" + getR_time() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public Integer getR_stockid() {
		return r_stockid;
	}



	public void setR_stockid(int r_stockid) {
		this.r_stockid = r_stockid;
	}



	public int getR_newsid() {
		return r_newsid;
	}


	public void setR_newsid(int r_newsid) {
		this.r_newsid = r_newsid;
	}


	public Integer getR_id() {
		return r_id;
	}
	
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Integer getR_sendid() {
		return r_sendid;
	}
	public void setR_sendid(Integer r_sendid) {
		this.r_sendid = r_sendid;
	}
	public Integer getR_receiveid() {
		return r_receiveid;
	}
	public void setR_receiveid(Integer r_receiveid) {
		this.r_receiveid = r_receiveid;
	}
	public Integer getR_commentid() {
		return r_commentid;
	}
	public void setR_commentid(Integer r_commentid) {
		this.r_commentid = r_commentid;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	
}
