package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTBidProduct {

	
    private int bidNo;
    private int auctionNo;
    private Date bidDate;
    private int farmNo;
    private String auctionProduct;
    
    
    
	public FarmENTBidProduct() {
		super();
	}

	public FarmENTBidProduct(int bidNo, int auctionNo, Date bidDate, int farmNo, String auctionProduct) {
		super();
		this.bidNo = bidNo;
		this.auctionNo = auctionNo;
		this.bidDate = bidDate;
		this.farmNo = farmNo;
		this.auctionProduct = auctionProduct;
	}

	public int getBidNo() {
		return bidNo;
	}

	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}

	public int getAuctionNo() {
		return auctionNo;
	}

	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}

	public Date getBidDate() {
		return bidDate;
	}

	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}

	public int getFarmNo() {
		return farmNo;
	}

	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}

	public String getAuctionProduct() {
		return auctionProduct;
	}

	public void setAuctionProduct(String auctionProduct) {
		this.auctionProduct = auctionProduct;
	}
    
    
    
}
