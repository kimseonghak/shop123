package com.hot.shop.productintro.model.vo;

import java.sql.Timestamp;

public class SeasonProductFile {
	private int SeasonProductPhotoNo;
	private String SeasonProductPhotoOriginal;
	private String SeasonProductPhotoChange;
	private String SeasonProductPhotoFilePath;
	private long SeasonProductPhotoFileSize;
	private Timestamp SeasonProductPhotoUpdateTime;
	private char SeasonProductDelYN;
	public SeasonProductFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SeasonProductFile(int seasonProductPhotoNo, String seasonProductPhotoOriginal,
			String seasonProductPhotoChange, String seasonProductPhotoFilePath, long seasonProductPhotoFileSize,
			Timestamp seasonProductPhotoUpdateTime, char seasonProductDelYN) {
		super();
		SeasonProductPhotoNo = seasonProductPhotoNo;
		SeasonProductPhotoOriginal = seasonProductPhotoOriginal;
		SeasonProductPhotoChange = seasonProductPhotoChange;
		SeasonProductPhotoFilePath = seasonProductPhotoFilePath;
		SeasonProductPhotoFileSize = seasonProductPhotoFileSize;
		SeasonProductPhotoUpdateTime = seasonProductPhotoUpdateTime;
		SeasonProductDelYN = seasonProductDelYN;
	}
	
	
	
	
	public int getSeasonProductPhotoNo() {
		return SeasonProductPhotoNo;
	}
	public void setSeasonProductPhotoNo(int seasonProductPhotoNo) {
		SeasonProductPhotoNo = seasonProductPhotoNo;
	}
	public String getSeasonProductPhotoOriginal() {
		return SeasonProductPhotoOriginal;
	}
	public void setSeasonProductPhotoOriginal(String seasonProductPhotoOriginal) {
		SeasonProductPhotoOriginal = seasonProductPhotoOriginal;
	}
	public String getSeasonProductPhotoChange() {
		return SeasonProductPhotoChange;
	}
	public void setSeasonProductPhotoChange(String seasonProductPhotoChange) {
		SeasonProductPhotoChange = seasonProductPhotoChange;
	}
	public String getSeasonProductPhotoFilePath() {
		return SeasonProductPhotoFilePath;
	}
	public void setSeasonProductPhotoFilePath(String seasonProductPhotoFilePath) {
		SeasonProductPhotoFilePath = seasonProductPhotoFilePath;
	}
	public long getSeasonProductPhotoFileSize() {
		return SeasonProductPhotoFileSize;
	}
	public void setSeasonProductPhotoFileSize(long seasonProductPhotoFileSize) {
		SeasonProductPhotoFileSize = seasonProductPhotoFileSize;
	}
	public Timestamp getSeasonProductPhotoUpdateTime() {
		return SeasonProductPhotoUpdateTime;
	}
	public void setSeasonProductPhotoUpdateTime(Timestamp seasonProductPhotoUpdateTime) {
		SeasonProductPhotoUpdateTime = seasonProductPhotoUpdateTime;
	}
	public char getSeasonProductDelYN() {
		return SeasonProductDelYN;
	}
	public void setSeasonProductDelYN(char seasonProductDelYN) {
		SeasonProductDelYN = seasonProductDelYN;
	}
	
	
	@Override
	public String toString() {
		return "SeasonProductFile [SeasonProductPhotoNo=" + SeasonProductPhotoNo + ", SeasonProductPhotoOriginal="
				+ SeasonProductPhotoOriginal + ", SeasonProductPhotoChange=" + SeasonProductPhotoChange
				+ ", SeasonProductPhotoFilePath=" + SeasonProductPhotoFilePath + ", SeasonProductPhotoFileSize="
				+ SeasonProductPhotoFileSize + ", SeasonProductPhotoUpdateTime=" + SeasonProductPhotoUpdateTime
				+ ", SeasonProductDelYN=" + SeasonProductDelYN + "]";
	}
	
	
	
	 
}
