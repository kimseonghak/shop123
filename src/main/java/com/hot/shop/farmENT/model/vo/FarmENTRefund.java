package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTRefund {
	
	
	private int refundNo; 
	private int buyNo; 
	private int userNo;
	private int farmNo;
	private char farmYN;
	private int questionUserNo; 
	private String questionUserTitle;
	private String questionUserContent; 
	private Date questionUserRegdate; 
	private String orderNo;
	
	
	public FarmENTRefund() {
		super();
	}


	public FarmENTRefund(int refundNo, int buyNo, int userNo, int farmNo, char farmYN, int questionUserNo,
			String questionUserTitle, String questionUserContent, Date questionUserRegdate, String orderNo) {
		super();
		this.refundNo = refundNo;
		this.buyNo = buyNo;
		this.userNo = userNo;
		this.farmNo = farmNo;
		this.farmYN = farmYN;
		this.questionUserNo = questionUserNo;
		this.questionUserTitle = questionUserTitle;
		this.questionUserContent = questionUserContent;
		this.questionUserRegdate = questionUserRegdate;
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


	public int getQuestionUserNo() {
		return questionUserNo;
	}


	public void setQuestionUserNo(int questionUserNo) {
		this.questionUserNo = questionUserNo;
	}


	public String getQuestionUserTitle() {
		return questionUserTitle;
	}


	public void setQuestionUserTitle(String questionUserTitle) {
		this.questionUserTitle = questionUserTitle;
	}


	public String getQuestionUserContent() {
		return questionUserContent;
	}


	public void setQuestionUserContent(String questionUserContent) {
		this.questionUserContent = questionUserContent;
	}


	public Date getQuestionUserRegdate() {
		return questionUserRegdate;
	}


	public void setQuestionUserRegdate(Date questionUserRegdate) {
		this.questionUserRegdate = questionUserRegdate;
	}


	public String getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}


	@Override
	public String toString() {
		return "FarmENTRefund [refundNo=" + refundNo + ", buyNo=" + buyNo + ", userNo=" + userNo + ", farmNo=" + farmNo
				+ ", farmYN=" + farmYN + ", questionUserNo=" + questionUserNo + ", questionUserTitle="
				+ questionUserTitle + ", questionUserContent=" + questionUserContent + ", questionUserRegdate="
				+ questionUserRegdate + ", orderNo=" + orderNo + "]";
	}
	
	
	

}
