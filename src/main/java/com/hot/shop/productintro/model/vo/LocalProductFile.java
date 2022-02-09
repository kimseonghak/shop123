package com.hot.shop.productintro.model.vo;

import java.sql.Timestamp;

public class LocalProductFile {
	private int LocalProductPhotoNo;//사진 번호

	private String LocalProductPhotoOriginal;
	private String LocalProductPhotoChange;
	private String LocalProductPhotoFilePath;
	private long LocalProductPhotoFileSize;
	private Timestamp LocalProductPhotoUpdateTime;
	private char LocalProductDelYN;//사진 삭제 여부
	public LocalProductFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LocalProductFile(int localProductPhotoNo, int localProductNo, String localProductPhotoOriginal,
			String localProductPhotoChange, String localProductPhotoFilePath, long localProductPhotoFileSize,
			Timestamp localProductPhotoUpdateTime, char localProductDelYN) {
		super();
		LocalProductPhotoNo = localProductPhotoNo;
		LocalProductPhotoOriginal = localProductPhotoOriginal;
		LocalProductPhotoChange = localProductPhotoChange;
		LocalProductPhotoFilePath = localProductPhotoFilePath;
		LocalProductPhotoFileSize = localProductPhotoFileSize;
		LocalProductPhotoUpdateTime = localProductPhotoUpdateTime;
		LocalProductDelYN = localProductDelYN;
	}
	public int getLocalProductPhotoNo() {
		return LocalProductPhotoNo;
	}
	public void setLocalProductPhotoNo(int localProductPhotoNo) {
		LocalProductPhotoNo = localProductPhotoNo;
	}

	public String getLocalProductPhotoOriginal() {
		return LocalProductPhotoOriginal;
	}
	public void setLocalProductPhotoOriginal(String localProductPhotoOriginal) {
		LocalProductPhotoOriginal = localProductPhotoOriginal;
	}
	public String getLocalProductPhotoChange() {
		return LocalProductPhotoChange;
	}
	public void setLocalProductPhotoChange(String localProductPhotoChange) {
		LocalProductPhotoChange = localProductPhotoChange;
	}
	public String getLocalProductPhotoFilePath() {
		return LocalProductPhotoFilePath;
	}
	public void setLocalProductPhotoFilePath(String localProductPhotoFilePath) {
		LocalProductPhotoFilePath = localProductPhotoFilePath;
	}
	public long getLocalProductPhotoFileSize() {
		return LocalProductPhotoFileSize;
	}
	public void setLocalProductPhotoFileSize(long localProductPhotoFileSize) {
		LocalProductPhotoFileSize = localProductPhotoFileSize;
	}
	public Timestamp getLocalProductPhotoUpdateTime() {
		return LocalProductPhotoUpdateTime;
	}
	public void setLocalProductPhotoUpdateTime(Timestamp localProductPhotoUpdateTime) {
		LocalProductPhotoUpdateTime = localProductPhotoUpdateTime;
	}
	public char getLocalProductDelYN() {
		return LocalProductDelYN;
	}
	public void setLocalProductDelYN(char localProductDelYN) {
		LocalProductDelYN = localProductDelYN;
	}
	@Override
	public String toString() {
		return "LocalProductFile [LocalProductPhotoNo=" + LocalProductPhotoNo
				+ ", LocalProductPhotoOriginal=" + LocalProductPhotoOriginal + ", LocalProductPhotoChange="
				+ LocalProductPhotoChange + ", LocalProductPhotoFilePath=" + LocalProductPhotoFilePath
				+ ", LocalProductPhotoFileSize=" + LocalProductPhotoFileSize + ", LocalProductPhotoUpdateTime="
				+ LocalProductPhotoUpdateTime + ", LocalProductDelYN=" + LocalProductDelYN + "]";
	}
	
	
	
	
}
