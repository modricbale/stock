package com.stock.pojo;

import java.util.Date;

public class User {
	private Integer u_id;
	private String u_name;
	private String u_psd;
	private Integer u_type;
	private String u_nickname;
	private String u_sex;
	private String u_email;
	private String u_phone;
	private String u_introduce;
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", u_psd=" + u_psd + ", u_type=" + u_type + ", u_nickname="
				+ u_nickname + ", u_sex=" + u_sex + ", u_email=" + u_email + ", u_phone=" + u_phone + ", u_introduce="
				+ u_introduce + "]";
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_psd() {
		return u_psd;
	}
	public void setU_psd(String u_psd) {
		this.u_psd = u_psd;
	}
	public Integer getU_type() {
		return u_type;
	}
	public void setU_type(Integer u_type) {
		this.u_type = u_type;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_introduce() {
		return u_introduce;
	}
	public void setU_introduce(String u_introduce) {
		this.u_introduce = u_introduce;
	}

}
