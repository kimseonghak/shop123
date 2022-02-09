package com.hot.shop.question.model.vo;

import java.sql.Date;

public class QuestionAnswer {
	private int questionAnswerNo;
	private String questionAnswerContent;
	private Date questionAnswerRegdate;
	private int questionBoardNo;
	private char questionBoardCode;
	private char questionAnswerEndYN;
	private char questionUserAnswerYN;
	private char questionFarmAnswerYN;
	
	
	public QuestionAnswer(int questionAnswerNo, String questionAnswerContent, Date questionAnswerRegdate,
			int questionBoardNo, char questionBoardCode, char questionAnswerEndYN, char questionUserAnswerYN,
			char questionFarmAnswerYN) {
		super();
		this.questionAnswerNo = questionAnswerNo;
		this.questionAnswerContent = questionAnswerContent;
		this.questionAnswerRegdate = questionAnswerRegdate;
		this.questionBoardNo = questionBoardNo;
		this.questionBoardCode = questionBoardCode;
		this.questionAnswerEndYN = questionAnswerEndYN;
		this.questionUserAnswerYN = questionUserAnswerYN;
		this.questionFarmAnswerYN = questionFarmAnswerYN;
	}

	public QuestionAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public char getQuestionUserAnswerYN() {
		return questionUserAnswerYN;
	}
	public void setQuestionUserAnswerYN(char questionUserAnswerYN) {
		this.questionUserAnswerYN = questionUserAnswerYN;
	}
	public char getQuestionFarmAnswerYN() {
		return questionFarmAnswerYN;
	}
	public void setQuestionFarmAnswerYN(char questionFarmAnswerYN) {
		this.questionFarmAnswerYN = questionFarmAnswerYN;
	}
	public int getQuestionAnswerNo() {
		return questionAnswerNo;
	}
	public void setQuestionAnswerNo(int questionAnswerNo) {
		this.questionAnswerNo = questionAnswerNo;
	}
	public String getQuestionAnswerContent() {
		return questionAnswerContent;
	}
	public void setQuestionAnswerContent(String questionAnswerContent) {
		this.questionAnswerContent = questionAnswerContent;
	}
	public Date getQuestionAnswerRegdate() {
		return questionAnswerRegdate;
	}
	public void setQuestionAnswerRegdate(Date questionAnswerRegdate) {
		this.questionAnswerRegdate = questionAnswerRegdate;
	}
	public int getQuestionBoardNo() {
		return questionBoardNo;
	}
	public void setQuestionBoardNo(int questionBoardNo) {
		this.questionBoardNo = questionBoardNo;
	}
	public char getQuestionBoardCode() {
		return questionBoardCode;
	}
	public void setQuestionBoardCode(char questionBoardCode) {
		this.questionBoardCode = questionBoardCode;
	}
	public char getQuestionAnswerEndYN() {
		return questionAnswerEndYN;
	}
	public void setQuestionAnswerEndYN(char questionAnswerEndYN) {
		this.questionAnswerEndYN = questionAnswerEndYN;
	}

	@Override
	public String toString() {
		return "QuestionAnswer [questionAnswerNo=" + questionAnswerNo + ", questionAnswerContent="
				+ questionAnswerContent + ", questionAnswerRegdate=" + questionAnswerRegdate + ", questionBoardNo="
				+ questionBoardNo + ", questionBoardCode=" + questionBoardCode + ", questionAnswerEndYN="
				+ questionAnswerEndYN + ", questionUserAnswerYN=" + questionUserAnswerYN + ", questionFarmAnswerYN="
				+ questionFarmAnswerYN + "]";
	}
}