package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class BID {
	
	private int BIDNo;
	private int auctionNo;
	private Date BIDDate;
	private char BIDSellYN;
	
	public BID() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BID(int bIDNo, int auctionNo, Date bIDDate, char bIDSellYN) {
		super();
		BIDNo = bIDNo;
		this.auctionNo = auctionNo;
		BIDDate = bIDDate;
		BIDSellYN = bIDSellYN;
	}
	public int getBIDNo() {
		return BIDNo;
	}
	public void setBIDNo(int bIDNo) {
		BIDNo = bIDNo;
	}
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	public Date getBIDDate() {
		return BIDDate;
	}
	public void setBIDDate(Date bIDDate) {
		BIDDate = bIDDate;
	}
	public char getBIDSellYN() {
		return BIDSellYN;
	}
	public void setBIDSellYN(char bIDSellYN) {
		BIDSellYN = bIDSellYN;
	}
	@Override
	public String toString() {
		return "BID [BIDNo=" + BIDNo + ", auctionNo=" + auctionNo + ", BIDDate=" + BIDDate + ", BIDSellYN=" + BIDSellYN
				+ "]";
	}
}
