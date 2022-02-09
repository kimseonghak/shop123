package com.hot.shop.promotion.model.vo;

import java.sql.Date;

public class Promotion {

	private int promotionNo;
	private String promotionTitle;
	private String promotionContent;
	private Date promotionRegdate;
	private int farmNo;
	private String promotionCount;
	private char promotionEndYN;
	private int promotionPhotoNo;
	private char advertiseYN;
	private String farmName;
	
	//farmName 추가해야 함
	
	public Promotion() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Promotion(int promotionNo, String promotionTitle, String promotionContent, Date promotionRegdate, int farmNo,
			String promotionCount, char promotionEndYN, int promotionPhotoNo, char advertiseYN, String farmName) {
		super();
		this.promotionNo = promotionNo;
		this.promotionTitle = promotionTitle;
		this.promotionContent = promotionContent;
		this.promotionRegdate = promotionRegdate;
		this.farmNo = farmNo;
		this.promotionCount = promotionCount;
		this.promotionEndYN = promotionEndYN;
		this.promotionPhotoNo = promotionPhotoNo;
		this.advertiseYN = advertiseYN;
		this.farmName = farmName;
	}

	public int getPromotionNo() {
		return promotionNo;
	}

	public void setPromotionNo(int promotionNo) {
		this.promotionNo = promotionNo;
	}

	public String getPromotionTitle() {
		return promotionTitle;
	}

	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}

	public String getPromotionContent() {
		return promotionContent;
	}

	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}

	public Date getPromotionRegdate() {
		return promotionRegdate;
	}

	public void setPromotionRegdate(Date promotionRegdate) {
		this.promotionRegdate = promotionRegdate;
	}

	public int getFarmNo() {
		return farmNo;
	}

	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}

	public String getPromotionCount() {
		return promotionCount;
	}

	public void setPromotionCount(String promotionCount) {
		this.promotionCount = promotionCount;
	}

	public char getPromotionEndYN() {
		return promotionEndYN;
	}

	public void setPromotionEndYN(char promotionEndYN) {
		this.promotionEndYN = promotionEndYN;
	}

	public int getPromotionPhotoNo() {
		return promotionPhotoNo;
	}

	public void setPromotionPhotoNo(int promotionPhotoNo) {
		this.promotionPhotoNo = promotionPhotoNo;
	}

	public char getAdvertiseYN() {
		return advertiseYN;
	}

	public void setAdvertiseYN(char advertiseYN) {
		this.advertiseYN = advertiseYN;
	}

	public String getFarmName() {
		return farmName;
	}

	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}

	@Override
	public String toString() {
		return "Promotion [promotionNo=" + promotionNo + ", promotionTitle=" + promotionTitle + ", promotionContent="
				+ promotionContent + ", promotionRegdate=" + promotionRegdate + ", farmNo=" + farmNo
				+ ", promotionCount=" + promotionCount + ", promotionEndYN=" + promotionEndYN + ", promotionPhotoNo="
				+ promotionPhotoNo + ", advertiseYN=" + advertiseYN + ", farmName=" + farmName + "]";
	}
	
}
