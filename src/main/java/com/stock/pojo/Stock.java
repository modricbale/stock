package com.stock.pojo;

import java.util.Date;

public class Stock {
	    private Integer stock_id;

	    private String stock_cd;

        private String securities;
        
        private String list_sector_id;
        
        private String list_sector;
        
        private String trans_curr;
        
        private String sec_short_name;
        
        private String sec_full_name;
        
        private String list_status;
        
        private Date list_date;
        
        private Date delist_date;
        
        private String stock_type_id;
        
        private String stock_type;
        
        private String market_country;
        
        private Integer party_id;
        
        private String total_shares;
        
        private String nonrest_float_shares;
        
        private String nonrest_float_capital_stock;
        
        private String office_addr;
        
        private String prime_operating;
        
        private Date end_date;
        
        private String total_equity;
        

		@Override
		public String toString() {
			return "Stock [stock_id=" + stock_id + ", stock_cd=" + stock_cd + ", securities=" + securities
					+ ", list_sector_id=" + list_sector_id + ", list_sector=" + list_sector + ", trans_curr="
					+ trans_curr + ", sec_short_name=" + sec_short_name + ", sec_full_name=" + sec_full_name
					+ ", list_status=" + list_status + ", list_date=" + list_date + ", delist_date=" + delist_date
					+ ", stock_type_id=" + stock_type_id + ", stock_type=" + stock_type + ", market_country="
					+ market_country + ", party_id=" + party_id + ", total_shares=" + total_shares
					+ ", nonrest_float_shares=" + nonrest_float_shares + ", nonrest_float_capital_stock="
					+ nonrest_float_capital_stock + ", office_addr=" + office_addr + ", prime_operating="
					+ prime_operating + ", end_date=" + end_date + ", total_equity=" + total_equity + ", getStock_id()="
					+ getStock_id() + ", getStock_cd()=" + getStock_cd() + ", getSecurities()=" + getSecurities()
					+ ", getList_sector_id()=" + getList_sector_id() + ", getList_sector()=" + getList_sector()
					+ ", getTrans_curr()=" + getTrans_curr() + ", getSec_short_name()=" + getSec_short_name()
					+ ", getSec_full_name()=" + getSec_full_name() + ", getList_status()=" + getList_status()
					+ ", getList_date()=" + getList_date() + ", getDelist_date()=" + getDelist_date()
					+ ", getStock_type_id()=" + getStock_type_id() + ", getStock_type()=" + getStock_type()
					+ ", getMarket_country()=" + getMarket_country() + ", getParty_id()=" + getParty_id()
					+ ", getTotal_shares()=" + getTotal_shares() + ", getNonrest_float_shares()="
					+ getNonrest_float_shares() + ", getNonrest_float_capital_stock()="
					+ getNonrest_float_capital_stock() + ", getOffice_addr()=" + getOffice_addr()
					+ ", getPrime_operating()=" + getPrime_operating() + ", getEnd_date()=" + getEnd_date()
					+ ", getTotal_equity()=" + getTotal_equity() + ", getClass()=" + getClass() + ", hashCode()="
					+ hashCode() + ", toString()=" + super.toString() + "]";
		}

		public Integer getStock_id() {
			return stock_id;
		}

		public void setStock_id(Integer stock_id) {
			this.stock_id = stock_id;
		}

		public String getStock_cd() {
			return stock_cd;
		}

		public void setStock_cd(String stock_cd) {
			this.stock_cd = stock_cd;
		}

		public String getSecurities() {
			return securities;
		}

		public void setSecurities(String securities) {
			this.securities = securities;
		}

		public String getList_sector_id() {
			return list_sector_id;
		}

		public void setList_sector_id(String list_sector_id) {
			this.list_sector_id = list_sector_id;
		}

		public String getList_sector() {
			return list_sector;
		}

		public void setList_sector(String list_sector) {
			this.list_sector = list_sector;
		}

		public String getTrans_curr() {
			return trans_curr;
		}

		public void setTrans_curr(String trans_curr) {
			this.trans_curr = trans_curr;
		}

		public String getSec_short_name() {
			return sec_short_name;
		}

		public void setSec_short_name(String sec_short_name) {
			this.sec_short_name = sec_short_name;
		}

		public String getSec_full_name() {
			return sec_full_name;
		}

		public void setSec_full_name(String sec_full_name) {
			this.sec_full_name = sec_full_name;
		}

		public String getList_status() {
			return list_status;
		}

		public void setList_status(String list_status) {
			this.list_status = list_status;
		}

		public Date getList_date() {
			return list_date;
		}

		public void setList_date(Date list_date) {
			this.list_date = list_date;
		}

		public Date getDelist_date() {
			return delist_date;
		}

		public void setDelist_date(Date delist_date) {
			this.delist_date = delist_date;
		}

		public String getStock_type_id() {
			return stock_type_id;
		}

		public void setStock_type_id(String stock_type_id) {
			this.stock_type_id = stock_type_id;
		}

		public String getStock_type() {
			return stock_type;
		}

		public void setStock_type(String stock_type) {
			this.stock_type = stock_type;
		}

		public String getMarket_country() {
			return market_country;
		}

		public void setMarket_country(String market_country) {
			this.market_country = market_country;
		}

		public Integer getParty_id() {
			return party_id;
		}

		public void setParty_id(Integer party_id) {
			this.party_id = party_id;
		}

		public String getTotal_shares() {
			return total_shares;
		}

		public void setTotal_shares(String total_shares) {
			this.total_shares = total_shares;
		}

		public String getNonrest_float_shares() {
			return nonrest_float_shares;
		}

		public void setNonrest_float_shares(String nonrest_float_shares) {
			this.nonrest_float_shares = nonrest_float_shares;
		}

		public String getNonrest_float_capital_stock() {
			return nonrest_float_capital_stock;
		}

		public void setNonrest_float_capital_stock(String nonrest_float_capital_stock) {
			this.nonrest_float_capital_stock = nonrest_float_capital_stock;
		}

		public String getOffice_addr() {
			return office_addr;
		}

		public void setOffice_addr(String office_addr) {
			this.office_addr = office_addr;
		}

		public String getPrime_operating() {
			return prime_operating;
		}

		public void setPrime_operating(String prime_operating) {
			this.prime_operating = prime_operating;
		}

		public Date getEnd_date() {
			return end_date;
		}

		public void setEnd_date(Date end_date) {
			this.end_date = end_date;
		}

		public String getTotal_equity() {
			return total_equity;
		}

		public void setTotal_equity(String total_equity) {
			this.total_equity = total_equity;
		}
        
        
        
}
