package com.hot.shop.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hot.shop.member.model.dao.MemberDAO;
import com.hot.shop.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member selectLoginMember(Member member) {
		
		return mDAO.selectLoginMember(member);
		
	}

	@Override
	public int selectIdCheck(String userId) {
		
		return mDAO.selectIdCheck(userId);
		
	}

	@Override
	public int selectNickCheck(String userNick) {
		
		return mDAO.selectNickCheck(userNick);
		
	}

	@Override
	public int insertMember(Member member) {
		
		return mDAO.insertMember(member);
		
	}
}
