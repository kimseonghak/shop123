package com.hot.shop.admin.model.vo;

import java.sql.Date;

public class SellForm {
	
	private int sellNo;
	private Date sellStart;
	private Date sellEnd;
	private int auctionNo;
	private int sellFormNo;
	private int boardNo;
	
	
	
	public SellForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellForm(int sellNo, Date sellStart, Date sellEnd, int auctionNo, int sellFormNo, int boardNo) {
		super();
		this.sellNo = sellNo;
		this.sellStart = sellStart;
		this.sellEnd = sellEnd;
		this.auctionNo = auctionNo;
		this.sellFormNo = sellFormNo;
		this.boardNo = boardNo;
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
	@Override
	public String toString() {
		return "SellForm [sellNo=" + sellNo + ", sellStart=" + sellStart + ", sellEnd=" + sellEnd + ", auctionNo="
				+ auctionNo + ", sellFormNo=" + sellFormNo + ", boardNo=" + boardNo + "]";
	}
	
}
