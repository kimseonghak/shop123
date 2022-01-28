package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class Count {
	private int countNo;
	private int countSum;
	private Date countDate;
	
	
	
	public Count(int countNo, int countSum, Date countDate) {
		super();
		this.countNo = countNo;
		this.countSum = countSum;
		this.countDate = countDate;
	}
	public Count() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCountNo() {
		return countNo;
	}
	public void setCountNo(int countNo) {
		this.countNo = countNo;
	}
	public int getCountSum() {
		return countSum;
	}
	public void setCountSum(int countSum) {
		this.countSum = countSum;
	}
	public Date getCountDate() {
		return countDate;
	}
	public void setCountDate(Date countDate) {
		this.countDate = countDate;
	}
	
	
}
