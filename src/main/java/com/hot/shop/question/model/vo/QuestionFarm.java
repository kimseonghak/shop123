package com.hot.shop.question.model.vo;

import java.sql.Date;

public class QuestionFarm {
	private int questionFarmNo;
	private String questionFarmTitle;
	private String questionFarmContent;
	private Date questionFarmRegdate;
	private int farmNo;
	private char questionFarmEndYN;
	
	
	
	public QuestionFarm(int questionFarmNo, String questionFarmTitle, String questionFarmContent,
			Date questionFarmRegdate, int farmNo, char questionFarmEndYN) {
		super();
		this.questionFarmNo = questionFarmNo;
		this.questionFarmTitle = questionFarmTitle;
		this.questionFarmContent = questionFarmContent;
		this.questionFarmRegdate = questionFarmRegdate;
		this.farmNo = farmNo;
		this.questionFarmEndYN = questionFarmEndYN;
	}
	public QuestionFarm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQuestionFarmNo() {
		return questionFarmNo;
	}
	public void setQuestionFarmNo(int questionFarmNo) {
		this.questionFarmNo = questionFarmNo;
	}
	public String getQuestionFarmTitle() {
		return questionFarmTitle;
	}
	public void setQuestionFarmTitle(String questionFarmTitle) {
		this.questionFarmTitle = questionFarmTitle;
	}
	public String getQuestionFarmContent() {
		return questionFarmContent;
	}
	public void setQuestionFarmContent(String questionFarmContent) {
		this.questionFarmContent = questionFarmContent;
	}
	public Date getQuestionFarmRegdate() {
		return questionFarmRegdate;
	}
	public void setQuestionFarmRegdate(Date questionFarmRegdate) {
		this.questionFarmRegdate = questionFarmRegdate;
	}
	public int getFarmNo() {
		return farmNo;
	}
	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}
	public char getQuestionFarmEndYN() {
		return questionFarmEndYN;
	}
	public void setQuestionFarmEndYN(char questionFarmEndYN) {
		this.questionFarmEndYN = questionFarmEndYN;
	}
	@Override
	public String toString() {
		return "QuestionFarm [questionFarmNo=" + questionFarmNo + ", questionFarmTitle=" + questionFarmTitle
				+ ", questionFarmContent=" + questionFarmContent + ", questionFarmRegdate=" + questionFarmRegdate
				+ ", farmNo=" + farmNo + ", questionFarmEndYN=" + questionFarmEndYN + "]";
	}
}