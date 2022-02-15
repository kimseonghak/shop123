package com.hot.shop.productintro.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class SeasonProductBoard {
	private int SeasonProductNo;
	private String SeasonProductTitle;
	private String SeasonProductContent;
	private Date SeasonProductRegDate;
	private int SeasonProductPhotoNo;//사진 번호
	private char SeasonProductDelYN;
	private String SeasonProductClassify;
	private String SeasonProductPhotoFilePath;//사진 경로
	private int originalSeasonphotoNo;
	
	public SeasonProductBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public SeasonProductBoard(int seasonProductNo, String seasonProductTitle, String seasonProductContent,
			Date seasonProductRegDate, int seasonProductPhotoNo, char seasonProductDelYN,
			String seasonProductClassify, String seasonProductPhotoFilePath, int originalSeasonphotoNo) {
		super();
		SeasonProductNo = seasonProductNo;
		SeasonProductTitle = seasonProductTitle;
		SeasonProductContent = seasonProductContent;
		SeasonProductRegDate = seasonProductRegDate;
		SeasonProductPhotoNo = seasonProductPhotoNo;
		SeasonProductDelYN = seasonProductDelYN;
		SeasonProductClassify = seasonProductClassify;
		SeasonProductPhotoFilePath = seasonProductPhotoFilePath;
		this.originalSeasonphotoNo = originalSeasonphotoNo;
	}
	
	public int getSeasonProductNo() {
		return SeasonProductNo;
	}
	public int getOriginalSeasonphotoNo() {
		return originalSeasonphotoNo;
	}
	public void setOriginalSeasonphotoNo(int originalSeasonphotoNo) {
		this.originalSeasonphotoNo = originalSeasonphotoNo;
	}
	public void setSeasonProductNo(int seasonProductNo) {
		SeasonProductNo = seasonProductNo;
	}
	public String getSeasonProductTitle() {
		return SeasonProductTitle;
	}
	public void setSeasonProductTitle(String seasonProductTitle) {
		SeasonProductTitle = seasonProductTitle;
	}
	public String getSeasonProductContent() {
		return SeasonProductContent;
	}
	public void setSeasonProductContent(String seasonProductContent) {
		SeasonProductContent = seasonProductContent;
	}
	public Date getSeasonProductRegDate() {
		return SeasonProductRegDate;
	}
	public void setSeasonProductRegDate(Date seasonProductRegDate) {
		SeasonProductRegDate = seasonProductRegDate;
	}
	public int getSeasonProductPhotoNo() {
		return SeasonProductPhotoNo;
	}
	public void setSeasonProductPhotoNo(int seasonProductPhotoNo) {
		SeasonProductPhotoNo = seasonProductPhotoNo;
	}
	public char getSeasonProductDelYN() {
		return SeasonProductDelYN;
	}
	public void setSeasonProductDelYN(char seasonProductDelYN) {
		SeasonProductDelYN = seasonProductDelYN;
	}
	public String getSeasonProductClassify() {
		return SeasonProductClassify;
	}
	public void setSeasonProductClassify(String seasonProductClassify) {
		SeasonProductClassify = seasonProductClassify;
	}
	public String getSeasonProductPhotoFilePath() {
		return SeasonProductPhotoFilePath;
	}
	public void setSeasonProductPhotoFilePath(String seasonProductPhotoFilePath) {
		SeasonProductPhotoFilePath = seasonProductPhotoFilePath;
	}
	@Override
	public String toString() {
		return "SeasonProductBoard [SeasonProductNo=" + SeasonProductNo + ", SeasonProductTitle=" + SeasonProductTitle
				+ ", SeasonProductContent=" + SeasonProductContent + ", SeasonProductRegDate=" + SeasonProductRegDate
				+ ", SeasonProductPhotoNo=" + SeasonProductPhotoNo + ", SeasonProductDelYN=" + SeasonProductDelYN
				+ ", SeasonProductClassify=" + SeasonProductClassify + ", SeasonProductPhotoFilePath="
				+ SeasonProductPhotoFilePath + ", originalSeasonphotoNo=" + originalSeasonphotoNo + "]";
	}
	
}	
