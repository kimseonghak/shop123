package com.hot.shop.question.model.vo;

import java.sql.Date;

public class QuestionUser {
	private int questionUserNo;//o
	private String questionUserTitle;//o
	private String questionUserContent;//o
	private Date questionUserRegdate;//o
	private int userNo;//o
	private char questionUserEndYN;//o
	private int questionphotoNo;//o
	private String questionUserCode;//o
	private char questionUserClassify;//o
	private int farmNo;//o
	private String orderNo;//o
	private String userNick;//조인해서 쓸 것
	private char questionUserAnswerYN;//o
	private String questionPhotoFilePath;//경로를 위한 컬럼
	private int originalQuestionphotoNo;
	
	

	public QuestionUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuestionUser(int questionUserNo, String questionUserTitle, String questionUserContent,
			Date questionUserRegdate, int userNo, char questionUserEndYN, int questionphotoNo, String questionUserCode,
			char questionUserClassify, int farmNo, String orderNo, String userNick, char questionUserAnswerYN,
			String questionPhotoFilePath, int originalQuestionphotoNo) {
		super();
		this.questionUserNo = questionUserNo;
		this.questionUserTitle = questionUserTitle;
		this.questionUserContent = questionUserContent;
		this.questionUserRegdate = questionUserRegdate;
		this.userNo = userNo;
		this.questionUserEndYN = questionUserEndYN;
		this.questionphotoNo = questionphotoNo;
		this.questionUserCode = questionUserCode;
		this.questionUserClassify = questionUserClassify;
		this.farmNo = farmNo;
		this.orderNo = orderNo;
		this.userNick = userNick;
		this.questionUserAnswerYN = questionUserAnswerYN;
		this.questionPhotoFilePath = questionPhotoFilePath;
		this.originalQuestionphotoNo = originalQuestionphotoNo;
	}



	public String getQuestionPhotoFilePath() {
		return questionPhotoFilePath;
	}
	
	
	public void setQuestionPhotoFilePath(String questionPhotoFilePath) {
		this.questionPhotoFilePath = questionPhotoFilePath;
	}


	public String getUserNick() {
		return userNick;
	}
	
	
	public char getQuestionUserAnswerYN() {
		return questionUserAnswerYN;
	}
	public void setQuestionUserAnswerYN(char questionUserAnswerYN) {
		this.questionUserAnswerYN = questionUserAnswerYN;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getQuestionUserNo() {
		return questionUserNo;
	}
	public void setQuestionUserNo(int questionUserNo) {
		this.questionUserNo = questionUserNo;
	}
	public String getQuestionUserTitle() {
		return questionUserTitle;
	}
	public void setQuestionUserTitle(String questionUserTitle) {
		this.questionUserTitle = questionUserTitle;
	}
	public String getQuestionUserContent() {
		return questionUserContent;
	}
	public void setQuestionUserContent(String questionUserContent) {
		this.questionUserContent = questionUserContent;
	}
	public Date getQuestionUserRegdate() {
		return questionUserRegdate;
	}
	public void setQuestionUserRegdate(Date questionUserRegdate) {
		this.questionUserRegdate = questionUserRegdate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public char getQuestionUserEndYN() {
		return questionUserEndYN;
	}
	public void setQuestionUserEndYN(char questionUserEndYN) {
		this.questionUserEndYN = questionUserEndYN;
	}
	public int getQuestionphotoNo() {
		return questionphotoNo;
	}
	public void setQuestionphotoNo(int questionphotoNo) {
		this.questionphotoNo = questionphotoNo;
	}
	public String getQuestionUserCode() {
		return questionUserCode;
	}
	public void setQuestionUserCode(String questionUserCode) {
		this.questionUserCode = questionUserCode;
	}
	public char getQuestionUserClassify() {
		return questionUserClassify;
	}
	public void setQuestionUserClassify(char questionUserClassify) {
		this.questionUserClassify = questionUserClassify;
	}
	public int getFarmNo() {
		return farmNo;
	}
	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	public int getOriginalQuestionphotoNo() {
		return originalQuestionphotoNo;
	}

	public void setOriginalQuestionphotoNo(int originalQuestionphotoNo) {
		this.originalQuestionphotoNo = originalQuestionphotoNo;
	}

	@Override
	public String toString() {
		return "QuestionUser [questionUserNo=" + questionUserNo + ", questionUserTitle=" + questionUserTitle
				+ ", questionUserContent=" + questionUserContent + ", questionUserRegdate=" + questionUserRegdate
				+ ", userNo=" + userNo + ", questionUserEndYN=" + questionUserEndYN + ", questionphotoNo="
				+ questionphotoNo + ", questionUserCode=" + questionUserCode + ", questionUserClassify="
				+ questionUserClassify + ", farmNo=" + farmNo + ", orderNo=" + orderNo + ", userNick=" + userNick
				+ ", questionUserAnswerYN=" + questionUserAnswerYN + ", questionPhotoFilePath=" + questionPhotoFilePath
				+ ", originalQuestionphotoNo=" + originalQuestionphotoNo + "]";
	}

	
}