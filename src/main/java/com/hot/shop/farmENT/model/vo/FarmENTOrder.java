package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTOrder {

	private int buyNo; 
	private int userNo;
	private int farmNo;
	private String orderNo;
	private String productName;
	private int productCount;
	private int payAmount;
	private Date purchaseDate;
	private String dName;
	
	
	
	public FarmENTOrder() {
		super();
	}



	public FarmENTOrder(int buyNo, int userNo, int farmNo, String orderNo, String productName, int productCount,
			int payAmount, Date purchaseDate, String dName) {
		super();
		this.buyNo = buyNo;
		this.userNo = userNo;
		this.farmNo = farmNo;
		this.orderNo = orderNo;
		this.productName = productName;
		this.productCount = productCount;
		this.payAmount = payAmount;
		this.purchaseDate = purchaseDate;
		this.dName = dName;
	}



	public int getBuyNo() {
		return buyNo;
	}



	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getFarmNo() {
		return farmNo;
	}



	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}



	public String getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public int getProductCount() {
		return productCount;
	}



	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}



	public int getPayAmount() {
		return payAmount;
	}



	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}



	public Date getPurchaseDate() {
		return purchaseDate;
	}



	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}



	public String getdName() {
		return dName;
	}



	public void setdName(String dName) {
		this.dName = dName;
	}


	
	
	
	
}
