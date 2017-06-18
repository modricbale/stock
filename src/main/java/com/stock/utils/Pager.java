package com.stock.utils;

/**
* @author 张玉筱
* Pager类的创建用于分页功能
*/

public class Pager {
	
	private int recordCount;//总记录数
	

	private int pageSize = 8;//每页多少条

	private int pageCount;//共几页
	
	private int pageNum;//当前页码
	
	private int start;//当前页的记录起始位置
	
	public Pager(int pageNum) {

		this.pageNum = pageNum;

		// 当前页码
		if (this.pageNum < 1)
			this.pageNum = 1;

		// 起始位置
		this.start = (this.pageNum - 1) * this.pageSize;//start=0时表示起始位置为第一条数据		
	}
	
	public Pager(int recordCount,int pageNum) {
		this.recordCount = recordCount;
		this.pageNum = pageNum;
		
		//计算共几页
		this.pageCount = this.recordCount / this.pageSize;
		if (this.recordCount % this.pageSize != 0) {
			this.pageCount ++;
		}
		
		//计算当前页码
		if (this.pageNum < 1)
			this.pageNum = 1;
		if (this.pageNum > this.pageCount)
			this.pageNum = this.pageCount;
		
		//计算起始位置
		this.start = (this.pageNum - 1) * this.pageSize;//start=0时表示起始位置为第一条数据			
	}
	
	public Pager(int recordCount,int pageNum,int pageSize) {
		this.recordCount = recordCount;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		
		//计算共几页
		this.pageCount = this.recordCount / this.pageSize;
		if (this.recordCount % this.pageSize != 0) {
			this.pageCount ++;
		}
		
		//计算当前页码
		if (this.pageNum < 1)
			this.pageNum = 1;
		if (this.pageNum > this.pageCount)
			this.pageNum = this.pageCount;
		
		//计算起始位置
		this.start = (this.pageNum - 1) * this.pageSize;//start=0时表示起始位置为第一条数据		
	}
		
	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}



	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public int getPageCount() {
		return pageCount;
	}



	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}



	public int getPageNum() {
		return pageNum;
	}



	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}



	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public static void main(String[] args) {
		Pager pager = new Pager(40,5);
		System.out.println(pager.start);
	}

}
