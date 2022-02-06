package com.hot.shop.common;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MemberAOP {

	@Autowired
	private SHA256Util enc;
	
	//로그인, 회원가입, 비밀번호 재발송
	
}
