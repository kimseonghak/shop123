package com.hot.shop.admin.model.vo;

public class Refund {
	private int refundNo;
	private int buyNo;
	private int userNo;
	private int farmNo;
	private char farmYN;
	private char adminYN;
	private char delYN;
	private int questionUserNo;
	private String orderNo;
	
	
	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", buyNo=" + buyNo + ", userNo=" + userNo + ", farmNo=" + farmNo
				+ ", farmYN=" + farmYN + ", adminYN=" + adminYN + ", delYN=" + delYN + ", questionUserNo="
				+ questionUserNo + ", orderNo=" + orderNo + "]";
	}

	public Refund(int refundNo, int buyNo, int userNo, int farmNo, char farmYN, char adminYN, char delYN,
			int questionUserNo, String orderNo) {
		super();
		this.refundNo = refundNo;
		this.buyNo = buyNo;
		this.userNo = userNo;
		this.farmNo = farmNo;
		this.farmYN = farmYN;
		this.adminYN = adminYN;
		this.delYN = delYN;
		this.questionUserNo = questionUserNo;
		this.orderNo = orderNo;
	}

	public Refund() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
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
	public char getFarmYN() {
		return farmYN;
	}
	public void setFarmYN(char farmYN) {
		this.farmYN = farmYN;
	}
	public char getAdminYN() {
		return adminYN;
	}
	public void setAdminYN(char adminYN) {
		this.adminYN = adminYN;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	public int getQuestionUserNo() {
		return questionUserNo;
	}
	public void setQuestionUserNo(int questionUserNo) {
		this.questionUserNo = questionUserNo;
	}
}
