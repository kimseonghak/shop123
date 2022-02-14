package com.hot.shop.faq.model.vo;

public class FAQ {

	
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private char faqEndYN;
	private String faqCode;
	
	
	public FAQ() {
		super();
	}

	public FAQ(int faqNo, String faqTitle, String faqContent, char faqEndYN, String faqCode) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqEndYN = faqEndYN;
		this.faqCode = faqCode;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public char getFaqEndYN() {
		return faqEndYN;
	}

	public void setFaqEndYN(char faqEndYN) {
		this.faqEndYN = faqEndYN;
	}

	public String getFaqCode() {
		return faqCode;
	}

	public void setFaqCode(String faqCode) {
		this.faqCode = faqCode;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqEndYN="
				+ faqEndYN + ", faqCode=" + faqCode + "]";
	}
	
	
}
