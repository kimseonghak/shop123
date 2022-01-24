package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class Auction {
	
	private int auctionNo;
	private Date auctionStart;
	private Date auctionEnd;
	private String auctionProduct;
	private int auctionPrice;
	private int auctionCount1;
	private int farmNo;
	private int auctionFormNo;
	private int farmNo2;
	private int farmNo3;
	private int auctionProduct2;
	private int auctionProduct3;
	private char auctionEndYN;
	
	public Auction(int auctionNo, Date auctionStart, Date auctionEnd, String auctionProduct, int auctionPrice,
			int auctionCount1, int farmNo, int auctionFormNo, int farmNo2, int farmNo3, int auctionProduct2,
			int auctionProduct3, char auctionEndYN) {
		super();
		this.auctionNo = auctionNo;
		this.auctionStart = auctionStart;
		this.auctionEnd = auctionEnd;
		this.auctionProduct = auctionProduct;
		this.auctionPrice = auctionPrice;
		this.auctionCount1 = auctionCount1;
		this.farmNo = farmNo;
		this.auctionFormNo = auctionFormNo;
		this.farmNo2 = farmNo2;
		this.farmNo3 = farmNo3;
		this.auctionProduct2 = auctionProduct2;
		this.auctionProduct3 = auctionProduct3;
		this.auctionEndYN = auctionEndYN;
	}
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	public Date getAuctionStart() {
		return auctionStart;
	}
	public void setAuctionStart(Date auctionStart) {
		this.auctionStart = auctionStart;
	}
	public Date getAuctionEnd() {
		return auctionEnd;
	}
	public void setAuctionEnd(Date auctionEnd) {
		this.auctionEnd = auctionEnd;
	}
	public String getAuctionProduct() {
		return auctionProduct;
	}
	public void setAuctionProduct(String auctionProduct) {
		this.auctionProduct = auctionProduct;
	}
	public int getAuctionPrice() {
		return auctionPrice;
	}
	public void setAuctionPrice(int auctionPrice) {
		this.auctionPrice = auctionPrice;
	}
	public int getAuctionCount1() {
		return auctionCount1;
	}
	public void setAuctionCount1(int auctionCount1) {
		this.auctionCount1 = auctionCount1;
	}
	public int getFarmNo() {
		return farmNo;
	}
	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}
	public int getAuctionFormNo() {
		return auctionFormNo;
	}
	public void setAuctionFormNo(int auctionFormNo) {
		this.auctionFormNo = auctionFormNo;
	}
	public int getFarmNo2() {
		return farmNo2;
	}
	public void setFarmNo2(int farmNo2) {
		this.farmNo2 = farmNo2;
	}
	public int getFarmNo3() {
		return farmNo3;
	}
	public void setFarmNo3(int farmNo3) {
		this.farmNo3 = farmNo3;
	}
	public int getAuctionProduct2() {
		return auctionProduct2;
	}
	public void setAuctionProduct2(int auctionProduct2) {
		this.auctionProduct2 = auctionProduct2;
	}
	public int getAuctionProduct3() {
		return auctionProduct3;
	}
	public void setAuctionProduct3(int auctionProduct3) {
		this.auctionProduct3 = auctionProduct3;
	}
	public char getAuctionEndYN() {
		return auctionEndYN;
	}
	public void setAuctionEndYN(char auctionEndYN) {
		this.auctionEndYN = auctionEndYN;
	}
	@Override
	public String toString() {
		return "Auction [auctionNo=" + auctionNo + ", auctionStart=" + auctionStart + ", auctionEnd=" + auctionEnd
				+ ", auctionProduct=" + auctionProduct + ", auctionPrice=" + auctionPrice + ", auctionCount1="
				+ auctionCount1 + ", farmNo=" + farmNo + ", auctionFormNo=" + auctionFormNo + ", farmNo2=" + farmNo2
				+ ", farmNo3=" + farmNo3 + ", auctionProduct2=" + auctionProduct2 + ", auctionProduct3="
				+ auctionProduct3 + ", auctionEndYN=" + auctionEndYN + "]";
	}
}
