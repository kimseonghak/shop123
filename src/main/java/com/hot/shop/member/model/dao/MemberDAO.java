package com.hot.shop.member.model.dao;

import java.util.HashMap;
import java.util.HashMap;
import java.util.List;

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
	
	public int selectEmailCheck(String userEmail) {
		int result = sql.selectOne("member.selectEmailCheck", userEmail);
		return result;
	}

	public int insertMember(Member member) {
		return sql.insert("member.insertMember", member);
	}

	public List<Member> findIdMember(Member member) {
		return sql.selectList("member.findIdMember", member);
	}

	public Member selectIdEmailCheck(Member member) {
		Member result = sql.selectOne("member.selectIdEmailCheck", member);
		return result;
	}

	public int findPwdMember(Member member) {
		return sql.selectOne("member.findPwdMember", member);
	}

	public int userRandomPwd(HashMap<String, Object> map) {
		return sql.update("member.userRandomPwd", map);
	}

}
