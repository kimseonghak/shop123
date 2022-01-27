package com.hot.shop.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hot.shop.member.model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/member/memberLoginPage.do")
	public String memberLoginPage() {
		return "member/login";
	}
	
	@RequestMapping(value="/member/memberJoinPage.do")
	public String memberJoinPage() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/member/memberFindIdPage.do")
	public String memberFindIdPage() {
		return "member/findId";
	}
	
	@RequestMapping(value="/member/memberFindPwdPage.do")
	public String memberFindPwdPage() {
		return "member/findPwd";
	}

}
