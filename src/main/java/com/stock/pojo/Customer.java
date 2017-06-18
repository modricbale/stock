package com.stock.pojo;

public class Customer {
    private Integer customerid;

    private String username;

    private String password;

    private String email;

    private String mobilephone;

    private Boolean isvalidated;

    private String customeravatar;

    private String interestedfield;
    

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone == null ? null : mobilephone.trim();
    }

    public Boolean getIsvalidated() {
        return isvalidated;
    }

    public void setIsvalidated(Boolean isvalidated) {
        this.isvalidated = isvalidated;
    }

    public String getCustomeravatar() {
        return customeravatar;
    }

    public void setCustomeravatar(String customeravatar) {
        this.customeravatar = customeravatar == null ? null : customeravatar.trim();
    }


    public String getInterestedfield() {
        return interestedfield;
    }

    public void setInterestedfield(String interestedfield) {
        this.interestedfield = interestedfield == null ? null : interestedfield.trim();
    }

	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", username=" + username + ", password=" + password + ", email="
				+ email + ", mobilephone=" + mobilephone + ", isvalidated=" + isvalidated + ", customeravatar="
				+ customeravatar + ", interestedfield=" + interestedfield + "]";
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}



  
}