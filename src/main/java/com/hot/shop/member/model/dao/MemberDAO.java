package com.hot.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Member selectLoginMember(Member member) {
		
		return sql.selectOne("member.selectLoginMember",member);
	}

	public int selectIdCheck(String userId) {
		int result = sql.selectOne("member.selectIdCheck", userId);
		return result;
	}

	public int selectNickCheck(String userNick) {
		int result = sql.selectOne("member.selectNickCheck", userNick);
		return result;
	}

	public int insertMember(Member member) {
		return sql.insert("member.insertMember", member);
	}
}
