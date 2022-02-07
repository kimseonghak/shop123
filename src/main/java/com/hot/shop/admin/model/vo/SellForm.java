package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class SellForm {
	
	private int sellNo;
	private Date sellStart;
	private Date sellEnd;
	private int auctionNo;
	private int sellFormNo;
	private int boardNo;
	private char sellEndYN;
	private String auctionProduct;  //조인해서 사용 경매 상품
	private int auctionPrice;		//조인해서 사용 최저가
	private int auctionCount1;  	//조인해서 사용 수량
	private int farmNo;				//조인해서 사용 농가번호
	
	
	public SellForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SellForm(int sellNo, Date sellStart, Date sellEnd, int auctionNo, int sellFormNo, int boardNo,
			char sellEndYN, String auctionProduct, int auctionPrice, int auctionCount1, int farmNo) {
		super();
		this.sellNo = sellNo;
		this.sellStart = sellStart;
		this.sellEnd = sellEnd;
		this.auctionNo = auctionNo;
		this.sellFormNo = sellFormNo;
		this.boardNo = boardNo;
		this.sellEndYN = sellEndYN;
		this.auctionProduct = auctionProduct;
		this.auctionPrice = auctionPrice;
		this.auctionCount1 = auctionCount1;
		this.farmNo = farmNo;
	}


	public int getSellNo() {
		return sellNo;
	}


	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}


	public Date getSellStart() {
		return sellStart;
	}


	public void setSellStart(Date sellStart) {
		this.sellStart = sellStart;
	}


	public Date getSellEnd() {
		return sellEnd;
	}


	public void setSellEnd(Date sellEnd) {
		this.sellEnd = sellEnd;
	}


	public int getAuctionNo() {
		return auctionNo;
	}


	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}


	public int getSellFormNo() {
		return sellFormNo;
	}


	public void setSellFormNo(int sellFormNo) {
		this.sellFormNo = sellFormNo;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public char getSellEndYN() {
		return sellEndYN;
	}


	public void setSellEndYN(char sellEndYN) {
		this.sellEndYN = sellEndYN;
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


	@Override
	public String toString() {
		return "SellForm [sellNo=" + sellNo + ", sellStart=" + sellStart + ", sellEnd=" + sellEnd + ", auctionNo="
				+ auctionNo + ", sellFormNo=" + sellFormNo + ", boardNo=" + boardNo + ", sellEndYN=" + sellEndYN
				+ ", auctionProduct=" + auctionProduct + ", auctionPrice=" + auctionPrice + ", auctionCount1="
				+ auctionCount1 + ", farmNo=" + farmNo + "]";
	}
	
	
	
	
	
}
