package com.hot.shop.memberMypage.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.member.model.vo.Member;

@Repository
public class MemberMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int updateWithdraw(HashMap<String, Object> map) {
		return sql.update("memberMypage.updateWithdraw", map);
	}

	public int updateMember(Member m) {
		return sql.update("memberMypage.updateMember", m);
	}

	public int updatePassword(HashMap<String, Object> map) {
		return sql.update("memberMypage.updatePassword", map);
	}

	public Member selectUserInfoCheck(int userNo) {
		return sql.selectOne("memberMypage.selectUserInfoCheck", userNo);
	}
	
}
