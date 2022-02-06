package com.hot.shop.farmENT.model.vo;

import java.sql.Date;

public class FarmENTQna {

	
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private Date questionRegdate;
	private int userNo;
	private String userName;
	private String userId;
	private int questionPhotoNo;
	private int farmNo;
	
	
	
	public FarmENTQna() {
		super();
	}

	public FarmENTQna(int questionNo, String questionTitle, String questionContent, Date questionRegdate, int userNo,
			String userName, String userId, int questionPhotoNo, int farmNo) {
		super();
		this.questionNo = questionNo;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionRegdate = questionRegdate;
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.questionPhotoNo = questionPhotoNo;
		this.farmNo = farmNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Date getQuestionRegdate() {
		return questionRegdate;
	}

	public void setQuestionRegdate(Date questionRegdate) {
		this.questionRegdate = questionRegdate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getQuestionPhotoNo() {
		return questionPhotoNo;
	}

	public void setQuestionPhotoNo(int questionPhotoNo) {
		this.questionPhotoNo = questionPhotoNo;
	}

	public int getFarmNo() {
		return farmNo;
	}

	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}
	
	
}
