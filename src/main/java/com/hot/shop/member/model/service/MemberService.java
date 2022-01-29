package com.hot.shop.member.model.service;

import com.hot.shop.member.model.vo.Member;

public interface MemberService {

	Member selectLoginMember(Member member);

	int selectIdCheck(String userId);

	int selectNickCheck(String userNick);

}
