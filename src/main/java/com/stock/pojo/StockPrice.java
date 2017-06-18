package com.stock.pojo;

public class StockPrice {

	 private Integer stockpri_id;

	 private Integer stock_id;
	 
	 private String sp_code;
	 
     private Double bid_pri;
     
     private Double comp_pri;
     
     private Double tod_min_pri;
     
     private Double tod_max_pri;
     
     private Double tod_opening_pri;
     
     private Double yes_closing_pri;
     
     private Double curr_pri;
     
     private Double turn_pri;
     
     private Double updown_money;
     
     private Double updown_rate;
     
     private Integer trade_stocks;
     
     private String sp_date;
     
     private String sp_time;
     
	public String getSp_date() {
		return sp_date;
	}

	public void setSp_date(String sp_date) {
		this.sp_date = sp_date;
	}

	public String getSp_time() {
		return sp_time;
	}

	public void setSp_time(String sp_time) {
		this.sp_time = sp_time;
	}

	public String getSp_code() {
		return sp_code;
	}

	public void setSp_code(String sp_code) {
		this.sp_code = sp_code;
	}

	public Double getUpdown_money() {
		return updown_money;
	}

	public void setUpdown_money(Double updown_money) {
		this.updown_money = updown_money;
	}

	public Double getUpdown_rate() {
		return updown_rate;
	}

	public void setUpdown_rate(Double updown_rate) {
		this.updown_rate = updown_rate;
	}

	public Integer getStockpri_id() {
		return stockpri_id;
	}

	public void setStockpri_id(Integer stockpri_id) {
		this.stockpri_id = stockpri_id;
	}

	public Integer getStock_id() {
		return stock_id;
	}

	public void setStock_id(Integer stock_id) {
		this.stock_id = stock_id;
	}

	public Double getBid_pri() {
		return bid_pri;
	}

	public void setBid_pri(Double bid_pri) {
		this.bid_pri = bid_pri;
	}

	public Double getComp_pri() {
		return comp_pri;
	}

	public void setComp_pri(Double comp_pri) {
		this.comp_pri = comp_pri;
	}

	public Double getTod_min_pri() {
		return tod_min_pri;
	}

	public void setTod_min_pri(Double tod_min_pri) {
		this.tod_min_pri = tod_min_pri;
	}

	public Double getTod_max_pri() {
		return tod_max_pri;
	}

	public void setTod_max_pri(Double tod_max_pri) {
		this.tod_max_pri = tod_max_pri;
	}

	public Double getTod_opening_pri() {
		return tod_opening_pri;
	}

	public void setTod_opening_pri(Double tod_opening_pri) {
		this.tod_opening_pri = tod_opening_pri;
	}

	public Double getYes_closing_pri() {
		return yes_closing_pri;
	}

	public void setYes_closing_pri(Double yes_closing_pri) {
		this.yes_closing_pri = yes_closing_pri;
	}

	public Double getCurr_pri() {
		return curr_pri;
	}

	public void setCurr_pri(Double curr_pri) {
		this.curr_pri = curr_pri;
	}

	public Double getTurn_pri() {
		return turn_pri;
	}

	public void setTurn_pri(Double turn_pri) {
		this.turn_pri = turn_pri;
	}

	public Integer getTrade_stocks() {
		return trade_stocks;
	}

	public void setTrade_stocks(Integer trade_stocks) {
		this.trade_stocks = trade_stocks;
	}
     
     
}
