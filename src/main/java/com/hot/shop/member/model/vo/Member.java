package com.hot.shop.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNick;
	private String userEmail;
	private String userPhone;
	private String userAddressMain;
	private String userAddressSub;
	private Date userEnrollDate;
	private char userEndYN;
	private String rating;
	
	public Member(int userNo, String userId, String userPwd, String userName, String userNick, String userEmail,
			String userPhone, String userAddressMain, String userAddressSub, Date userEnrollDate, char userEndYN,
			String rating) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNick = userNick;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userAddressMain = userAddressMain;
		this.userAddressSub = userAddressSub;
		this.userEnrollDate = userEnrollDate;
		this.userEndYN = userEndYN;
		this.rating = rating;
	}
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddressMain() {
		return userAddressMain;
	}
	public void setUserAddressMain(String userAddressMain) {
		this.userAddressMain = userAddressMain;
	}
	public String getUserAddressSub() {
		return userAddressSub;
	}
	public void setUserAddressSub(String userAddressSub) {
		this.userAddressSub = userAddressSub;
	}
	public Date getUserEnrollDate() {
		return userEnrollDate;
	}
	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}
	public char getUserEndYN() {
		return userEndYN;
	}
	public void setUserEndYN(char userEndYN) {
		this.userEndYN = userEndYN;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userNick=" + userNick + ", userEmail=" + userEmail + ", userPhone=" + userPhone
				+ ", userAddressMain=" + userAddressMain + ", userAddressSub=" + userAddressSub + ", userEnrollDate="
				+ userEnrollDate + ", userEndYN=" + userEndYN + ", rating=" + rating + "]";
	}
	
}
