package com.hot.shop.farm.model.vo;

import java.sql.Date;

public class Farm {
	
	private int farmNo;
	private String farmId;
	private String farmPwd;
	private String farmName;
	private String farmBusiNum;
	private String farmEmail;
	private String farmPhone;
	private String farmAddressMain;
	private String farmAddressSub;
	private Date farmEnrollDate;
	private char farmEndYN;
	private String rating;
	
	public Farm() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Farm(int farmNo, String farmId, String farmPwd, String farmName, String farmBusiNum, String farmEmail,
			String farmPhone, String farmAddressMain, String farmAddressSub, Date farmEnrollDate, char farmEndYN,
			String rating) {
		super();
		this.farmNo = farmNo;
		this.farmId = farmId;
		this.farmPwd = farmPwd;
		this.farmName = farmName;
		this.farmBusiNum = farmBusiNum;
		this.farmEmail = farmEmail;
		this.farmPhone = farmPhone;
		this.farmAddressMain = farmAddressMain;
		this.farmAddressSub = farmAddressSub;
		this.farmEnrollDate = farmEnrollDate;
		this.farmEndYN = farmEndYN;
		this.rating = rating;
	}
	
	public int getFarmNo() {
		return farmNo;
	}
	public void setFarmNo(int farmNo) {
		this.farmNo = farmNo;
	}
	public String getFarmId() {
		return farmId;
	}
	public void setFarmId(String farmId) {
		this.farmId = farmId;
	}
	public String getFarmPwd() {
		return farmPwd;
	}
	public void setFarmPwd(String farmPwd) {
		this.farmPwd = farmPwd;
	}
	public String getFarmName() {
		return farmName;
	}
	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}
	public String getFarmBusiNum() {
		return farmBusiNum;
	}
	public void setFarmBusiNum(String farmBusiNum) {
		this.farmBusiNum = farmBusiNum;
	}
	public String getFarmEmail() {
		return farmEmail;
	}
	public void setFarmEmail(String farmEmail) {
		this.farmEmail = farmEmail;
	}
	public String getFarmPhone() {
		return farmPhone;
	}
	public void setFarmPhone(String farmPhone) {
		this.farmPhone = farmPhone;
	}
	public String getFarmAddressMain() {
		return farmAddressMain;
	}
	public void setFarmAddressMain(String farmAddressMain) {
		this.farmAddressMain = farmAddressMain;
	}
	public String getFarmAddressSub() {
		return farmAddressSub;
	}
	public void setFarmAddressSub(String farmAddressSub) {
		this.farmAddressSub = farmAddressSub;
	}
	public Date getFarmEnrollDate() {
		return farmEnrollDate;
	}
	public void setFarmEnrollDate(Date farmEnrollDate) {
		this.farmEnrollDate = farmEnrollDate;
	}
	public char getFarmEndYN() {
		return farmEndYN;
	}
	public void setFarmEndYN(char farmEndYN) {
		this.farmEndYN = farmEndYN;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Farm [farmNo=" + farmNo + ", farmId=" + farmId + ", farmPwd=" + farmPwd + ", farmName=" + farmName
				+ ", farmBusiNum=" + farmBusiNum + ", farmEmail=" + farmEmail + ", farmPhone=" + farmPhone
				+ ", farmAddressMain=" + farmAddressMain + ", farmAddressSub=" + farmAddressSub + ", farmEnrollDate="
				+ farmEnrollDate + ", farmEndYN=" + farmEndYN + ", rating=" + rating + "]";
	}
	
}
