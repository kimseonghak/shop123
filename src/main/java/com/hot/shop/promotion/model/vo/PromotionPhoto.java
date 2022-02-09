package com.hot.shop.promotion.model.vo;

import java.sql.Timestamp;

public class PromotionPhoto {

	private int promotionPhotoNo;
	private String promotionPhotoOriginal;
	private String promotionPhotoChange;
	private String promotionPhotoFilePath;
	private long promotionPhotoFileSize;
	private Timestamp promotionPhotoUpdateTime;
	private char promotionPhotoDelYN;
	private char promotionPhotoUseYN;
	
	public PromotionPhoto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PromotionPhoto(int promotionPhotoNo, String promotionPhotoOriginal, String promotionPhotoChange,
			String promotionPhotoFilePath, long promotionPhotoFileSize, Timestamp promotionPhotoUpdateTime,
			char promotionPhotoDelYN, char promotionPhotoUseYN) {
		super();
		this.promotionPhotoNo = promotionPhotoNo;
		this.promotionPhotoOriginal = promotionPhotoOriginal;
		this.promotionPhotoChange = promotionPhotoChange;
		this.promotionPhotoFilePath = promotionPhotoFilePath;
		this.promotionPhotoFileSize = promotionPhotoFileSize;
		this.promotionPhotoUpdateTime = promotionPhotoUpdateTime;
		this.promotionPhotoDelYN = promotionPhotoDelYN;
		this.promotionPhotoUseYN = promotionPhotoUseYN;
	}

	public int getPromotionPhotoNo() {
		return promotionPhotoNo;
	}

	public void setPromotionPhotoNo(int promotionPhotoNo) {
		this.promotionPhotoNo = promotionPhotoNo;
	}

	public String getPromotionPhotoOriginal() {
		return promotionPhotoOriginal;
	}

	public void setPromotionPhotoOriginal(String promotionPhotoOriginal) {
		this.promotionPhotoOriginal = promotionPhotoOriginal;
	}

	public String getPromotionPhotoChange() {
		return promotionPhotoChange;
	}

	public void setPromotionPhotoChange(String promotionPhotoChange) {
		this.promotionPhotoChange = promotionPhotoChange;
	}

	public String getPromotionPhotoFilePath() {
		return promotionPhotoFilePath;
	}

	public void setPromotionPhotoFilePath(String promotionPhotoFilePath) {
		this.promotionPhotoFilePath = promotionPhotoFilePath;
	}

	public long getPromotionPhotoFileSize() {
		return promotionPhotoFileSize;
	}

	public void setPromotionPhotoFileSize(long promotionPhotoFileSize) {
		this.promotionPhotoFileSize = promotionPhotoFileSize;
	}

	public Timestamp getPromotionPhotoUpdateTime() {
		return promotionPhotoUpdateTime;
	}

	public void setPromotionPhotoUpdateTime(Timestamp promotionPhotoUpdateTime) {
		this.promotionPhotoUpdateTime = promotionPhotoUpdateTime;
	}

	public char getPromotionPhotoDelYN() {
		return promotionPhotoDelYN;
	}

	public void setPromotionPhotoDelYN(char promotionPhotoDelYN) {
		this.promotionPhotoDelYN = promotionPhotoDelYN;
	}

	public char getPromotionPhotoUseYN() {
		return promotionPhotoUseYN;
	}

	public void setPromotionPhotoUseYN(char promotionPhotoUseYN) {
		this.promotionPhotoUseYN = promotionPhotoUseYN;
	}

	@Override
	public String toString() {
		return "PromotionPhoto [promotionPhotoNo=" + promotionPhotoNo + ", promotionPhotoOriginal="
				+ promotionPhotoOriginal + ", promotionPhotoChange=" + promotionPhotoChange
				+ ", promotionPhotoFilePath=" + promotionPhotoFilePath + ", promotionPhotoFileSize="
				+ promotionPhotoFileSize + ", promotionPhotoUpdateTime=" + promotionPhotoUpdateTime
				+ ", promotionPhotoDelYN=" + promotionPhotoDelYN + ", promotionPhotoUseYN=" + promotionPhotoUseYN + "]";
	}
	
}
