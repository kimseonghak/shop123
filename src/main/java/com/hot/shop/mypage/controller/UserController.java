package com.hot.shop.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping(value="/mypage/userMyPage.do")
	public String userMyPage() {
		
		return "mypage/user_mypage_modify";
	}
	
}
