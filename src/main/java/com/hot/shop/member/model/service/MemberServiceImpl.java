package com.hot.shop.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectEmailCheck(String userEmail) {
		return mDAO.selectEmailCheck(userEmail);
	}
	
	@Override
	public int insertMember(Member member) {
		return mDAO.insertMember(member);
	}

	@Override
	public List<Member> findIdMember(Member member) {
		return mDAO.findIdMember(member);
	}

	@Override
	public Member selectIdEmailCheck(Member member) {
		return mDAO.selectIdEmailCheck(member);
	}
	
	@Override
	public int findPwdMember(Member member) {
		return mDAO.findPwdMember(member);
	}

	@Override
	public int userRandomPwd(HashMap<String, Object> map) {
		return mDAO.userRandomPwd(map);
	}

}
