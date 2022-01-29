package com.hot.shop.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.member.model.service.MemberService;
import com.hot.shop.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	//로그인 페이지로의 접근
	@RequestMapping(value="/member/memberLoginPage.do", method=RequestMethod.GET)
	public String memberLoginPage() {
		return "member/login";
	}
	
	//회원가입 페이지로의 접근
	@RequestMapping(value="/member/memberJoinPage.do", method=RequestMethod.GET)
	public String memberJoinPage() {
		return "member/memberJoin";
	}
	
	//아이디 찾기 페이지로의 접근
	@RequestMapping(value="/member/memberFindIdPage.do", method=RequestMethod.GET)
	public String memberFindIdPage() {
		return "member/findId";
	}
	
	//비밀번호 찾기 페이지로의 접근
	@RequestMapping(value="/member/memberFindPwdPage.do", method=RequestMethod.GET)
	public String memberFindPwdPage() {
		return "member/findPwd";
	}
	
	//로그인
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, 
			Member member,
			ModelAndView mav) {
		
		Member m = mService.selectLoginMember(member);
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "로그인 실패. 아이디와 비밀번호를 확인해주세요.");
			mav.addObject("location", "/");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,
			@SessionAttribute Member member) {
			
			session.invalidate();
			
			return "redirect:/";
	}
	
	//회원가입시 아이디 중복체크
	@RequestMapping(value="/member/memberIdCheck.do", method = RequestMethod.GET)
	public void memberIdCheck(@RequestParam String userId,
			HttpServletResponse response) throws IOException {
		
		int result = mService.selectIdCheck(userId);
		response.getWriter().print(result);
	}
	
	//회원가입시 닉네임 중복체크 (@ResponseBody 사용)
	@RequestMapping(value="/member/memberNickCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int memberNickCheck(@RequestParam String userNick,
			HttpServletResponse response) throws IOException {
			
		int result = mService.selectNickCheck(userNick);
		return result;
	}

}
