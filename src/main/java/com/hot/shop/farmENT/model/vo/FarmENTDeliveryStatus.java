package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTDeliveryStatus {

	private int deliveryNo;
	private int buyNo;
	private String deliveryCompany;
	private String deliveryNum;
	private Date deliveryDate;
	private char delYN;
	private String deliveryStatus;
	
	
	
	public FarmENTDeliveryStatus() {
		super();
	}


	public FarmENTDeliveryStatus(int deliveryNo, int buyNo, String deliveryCompany, String deliveryNum,
			Date deliveryDate, char delYN, String deliveryStatus) {
		super();
		this.deliveryNo = deliveryNo;
		this.buyNo = buyNo;
		this.deliveryCompany = deliveryCompany;
		this.deliveryNum = deliveryNum;
		this.deliveryDate = deliveryDate;
		this.delYN = delYN;
		this.deliveryStatus = deliveryStatus;
	}


	public int getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}


	public int getBuyNo() {
		return buyNo;
	}


	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}


	public String getDeliveryCompany() {
		return deliveryCompany;
	}


	public void setDeliveryCompany(String deliveryCompany) {
		this.deliveryCompany = deliveryCompany;
	}


	public String getDeliveryNum() {
		return deliveryNum;
	}


	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}


	public Date getDeliveryDate() {
		return deliveryDate;
	}


	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}


	public char getDelYN() {
		return delYN;
	}


	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}


	public String getDeliveryStatus() {
		return deliveryStatus;
	}


	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}


	@Override
	public String toString() {
		return "FarmENTDeliveryStatus [deliveryNo=" + deliveryNo + ", buyNo=" + buyNo + ", deliveryCompany="
				+ deliveryCompany + ", deliveryNum=" + deliveryNum + ", deliveryDate=" + deliveryDate + ", delYN="
				+ delYN + ", deliveryStatus=" + deliveryStatus + "]";
	}
	
	
}
