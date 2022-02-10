package com.hot.shop.auction.model.vo;

import java.sql.Date;

public class Purchaselist {
	
	private int buyNo;
	private int userNo;
	private int farmNo;
	private String productName;
	private int productCount;
	private int payAmount;
	private Date purchaseDate;
	private String phone;
	private String address1;
	private String address2;
	private String dCode;
	private String payMethod;
	private char refundYN;
	private String orderNo;
	private String farmName;   			//조인할때 사용
	private String deliveryCompany; 	//조인할때 사용
	private String deliveryNo;			//조인할때 사용
	private String dName;				//조인할때 사용
	
	public Purchaselist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Purchaselist(int buyNo, int userNo, int farmNo, String productName, int productCount, int payAmount,
			Date purchaseDate, String phone, String address1, String address2, String dCode, String payMethod,
			char refundYN, String orderNo, String farmName, String deliveryCompany, String deliveryNo, String dName) {
		super();
		this.buyNo = buyNo;
		this.userNo = userNo;
		this.farmNo = farmNo;
		this.productName = productName;
		this.productCount = productCount;
		this.payAmount = payAmount;
		this.purchaseDate = purchaseDate;
		this.phone = phone;
		this.address1 = address1;
		this.address2 = address2;
		this.dCode = dCode;
		this.payMethod = payMethod;
		this.refundYN = refundYN;
		this.orderNo = orderNo;
		this.farmName = farmName;
		this.deliveryCompany = deliveryCompany;
		this.deliveryNo = deliveryNo;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public char getRefundYN() {
		return refundYN;
	}

	public void setRefundYN(char refundYN) {
		this.refundYN = refundYN;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getFarmName() {
		return farmName;
	}

	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}

	public String getDeliveryCompany() {
		return deliveryCompany;
	}

	public void setDeliveryCompany(String deliveryCompany) {
		this.deliveryCompany = deliveryCompany;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	@Override
	public String toString() {
		return "Purchaselist [buyNo=" + buyNo + ", userNo=" + userNo + ", farmNo=" + farmNo + ", productName="
				+ productName + ", productCount=" + productCount + ", payAmount=" + payAmount + ", purchaseDate="
				+ purchaseDate + ", phone=" + phone + ", address1=" + address1 + ", address2=" + address2 + ", dCode="
				+ dCode + ", payMethod=" + payMethod + ", refundYN=" + refundYN + ", orderNo=" + orderNo + ", farmName="
				+ farmName + ", deliveryCompany=" + deliveryCompany + ", deliveryNo=" + deliveryNo + ", dName=" + dName
				+ "]";
	}

	
	
	
}
