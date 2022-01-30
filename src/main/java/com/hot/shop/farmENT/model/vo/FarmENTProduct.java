package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTProduct {

	private int auctionNo;
	private String auctionProduct;
	private int auctionPrice;
	private Date auctionEnd;
	
	
	
	public FarmENTProduct() {
		super();
	}

	public FarmENTProduct(int auctionNo, String auctionProduct, int auctionPrice, Date auctionEnd) {
		super();
		this.auctionNo = auctionNo;
		this.auctionProduct = auctionProduct;
		this.auctionPrice = auctionPrice;
		this.auctionEnd = auctionEnd;
	}

	public int getAuctionNo() {
		return auctionNo;
	}

	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
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

	public Date getAuctionEnd() {
		return auctionEnd;
	}

	public void setAuctionEnd(Date auctionEnd) {
		this.auctionEnd = auctionEnd;
	}

	@Override
	public String toString() {
		return "FarmENTProduct [auctionNo=" + auctionNo + ", auctionProduct=" + auctionProduct + ", auctionPrice="
				+ auctionPrice + ", auctionEnd=" + auctionEnd + "]";
	}
	
	
}
