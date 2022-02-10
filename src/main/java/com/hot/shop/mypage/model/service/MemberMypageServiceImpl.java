package com.hot.shop.mypage.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.mypage.model.dao.MemberMypageDAO;

@Service
public class MemberMypageServiceImpl implements MemberMypageService {

	@Autowired
	private MemberMypageDAO mmDAO;

	@Override
	public int updateWithdraw(HashMap<String, Object> map) {
		return mmDAO.updateWithdraw(map);
	}

	@Override
	public int updateMember(Member m) {
		return mmDAO.updateMember(m);
	}

	@Override
	public int updatePassword(HashMap<String, Object> map) {
		return mmDAO.updatePassword(map);
	}

	@Override
	public Member selectUserInfoCheck(int userNo) {
		return mmDAO.selectUserInfoCheck(userNo);
	}
	
}
