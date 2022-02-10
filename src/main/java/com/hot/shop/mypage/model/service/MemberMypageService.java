package com.hot.shop.mypage.model.service;

import java.util.HashMap;

import com.hot.shop.member.model.vo.Member;

public interface MemberMypageService {

	int updateWithdraw(HashMap<String, Object> map);

	int updateMember(Member m);

	int updatePassword(HashMap<String, Object> map);

	Member selectUserInfoCheck(int userNo);

}
