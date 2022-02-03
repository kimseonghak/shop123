package com.hot.shop.notice.model.vo;

import javax.xml.crypto.Data;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Data noticeRegdate;
	private int farmNo;
	private int noticeCount;
	private char noticeEndYN;
	private char noticeCode;
	private String noticeCategory;
	
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Notice(int noticeNo, String noticeTitle, String noticeContent, Data noticeRegdate, int farmNo,
			int noticeCount, char noticeEndYN, char noticeCode, String noticeCategory) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeRegdate = noticeRegdate;
		this.farmNo = farmNo;
		this.noticeCount = noticeCount;
		this.noticeEndYN = noticeEndYN;
		this.noticeCode = noticeCode;
		this.noticeCategory = noticeCategory;
	}


	
	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public String getNoticeContent() {
		return noticeContent;
	}



	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}



	public Data getNoticeRegdate() {
		return noticeRegdate;
	}



	public void setNoticeRegdate(Data noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}



	public int getFarmNo() {
		return farmNo;
	}



	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}



	public int getNoticeCount() {
		return noticeCount;
	}



	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}



	public char getNoticeEndYN() {
		return noticeEndYN;
	}



	public void setNoticeEndYN(char noticeEndYN) {
		this.noticeEndYN = noticeEndYN;
	}



	public char getNoticeCode() {
		return noticeCode;
	}



	public void setNoticeCode(char noticeCode) {
		this.noticeCode = noticeCode;
	}



	public String getNoticeCategory() {
		return noticeCategory;
	}



	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeRegdate=" + noticeRegdate + ", farmNo=" + farmNo + ", noticeCount=" + noticeCount
				+ ", noticeEndYN=" + noticeEndYN + ", noticeCode=" + noticeCode + ", noticeCategory=" + noticeCategory
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}
