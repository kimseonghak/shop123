package com.hot.shop.member.model.service;

import java.util.HashMap;
import java.util.List;

import com.hot.shop.member.model.vo.Member;

public interface MemberService {

	Member selectLoginMember(Member member);

	int selectIdCheck(String userId);

	int selectNickCheck(String userNick);

	int insertMember(Member member);

	List<Member> findIdMember(Member member);

	Member selectEmailCheck(Member member);

	int findPwdMember(Member member);

	int test(HashMap<String, Object> map);
}
