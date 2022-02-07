package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTRefund {
	
	
	private int refundNo;
    private String orderNo;
    private Date refundRegdate;
    private int userNo;
    private int buyNo;
    private int farmNo;
    private char refundYN;
    
    
	public FarmENTRefund() {
		super();
	}

	public FarmENTRefund(int refundNo, String orderNo, Date refundRegdate, int userNo, int buyNo, int farmNo,
			char refundYN) {
		super();
		this.refundNo = refundNo;
		this.orderNo = orderNo;
		this.refundRegdate = refundRegdate;
		this.userNo = userNo;
		this.buyNo = buyNo;
		this.farmNo = farmNo;
		this.refundYN = refundYN;
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getRefundRegdate() {
		return refundRegdate;
	}

	public void setRefundRegdate(Date refundRegdate) {
		this.refundRegdate = refundRegdate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getFarmNo() {
		return farmNo;
	}

	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}

	public char getRefundYN() {
		return refundYN;
	}

	public void setRefundYN(char refundYN) {
		this.refundYN = refundYN;
	}



}
