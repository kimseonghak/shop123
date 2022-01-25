package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class Auction {
	
	private String auctionNo;
	private Date auctionStart;
	private Date auctionEnd;
	private String auctionProduct;
	private int auctionPrice;
	private int auctionCount1;
	private int farmNo;
	private int auctionFormNo;
	private int farmNo2;
	private int farmNo3;
	private int auctionCount2;
	private int auctionCount3;
	private char auctionEndYN;
	
	public Auction(String auctionNo, Date auctionStart, Date auctionEnd, String auctionProduct, int auctionPrice,
			int auctionCount1, int farmNo, int auctionFormNo, int farmNo2, int farmNo3, int auctionCount2,
			int auctionCount3, char auctionEndYN) {
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
		this.auctionCount2 = auctionCount2;
		this.auctionCount3 = auctionCount3;
		this.auctionEndYN = auctionEndYN;
	}
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(String auctionNo) {
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
	public int getauctionCount2() {
		return auctionCount2;
	}
	public void setauctionCount2(int auctionCount2) {
		this.auctionCount2 = auctionCount2;
	}
	public int getauctionCount3() {
		return auctionCount3;
	}
	public void setauctionCount3(int auctionCount3) {
		this.auctionCount3 = auctionCount3;
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
				+ ", farmNo3=" + farmNo3 + ", auctionCount2=" + auctionCount2 + ", auctionCount3="
				+ auctionCount3 + ", auctionEndYN=" + auctionEndYN + "]";
	}
}
