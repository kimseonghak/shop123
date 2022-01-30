package com.hot.shop.farm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.service.FarmService;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

@Controller
public class FarmController {
	@Autowired
	private FarmService fService;

	//회원가입 페이지로의 접근
	@RequestMapping(value="/farm/farmJoinPage.do")
	public String farmJoinPage() {
		return "farm/farmJoin";
	}
	
	//로그인
	@RequestMapping(value="/farm/farmLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, 
			Farm farm,
			ModelAndView mav) {
		
		Farm f = fService.selectLoginFarm(farm);
		
		if(f!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("farm", f);
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "로그인 실패. 아이디와 비밀번호를 확인해주세요.");
			mav.addObject("location", "/");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
		
	//로그아웃
	@RequestMapping(value="/farm/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,
			@SessionAttribute Farm farm) {
			
			session.invalidate();
			
			return "redirect:/";
	}
}
