package com.hot.shop.mypage.controller;

import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.mypage.model.service.MemberMypageService;

@Controller
public class MemberMypageController {
	
	@Autowired
	private MemberMypageService mmService;

	//회원 ** 님 클릭 시 마이페이지 리스트로 접근
	@RequestMapping(value="/mypage/memberMypageListPage.do", method=RequestMethod.GET)
	public String memberMypageListPage() {
		
		return "mypage/memberMypageList";
		
	}
	
	//마이페이지 리스트에서 회원정보수정 페이지로 접근
	@RequestMapping(value="/mypage/memberMypageModifyPage.do", method=RequestMethod.GET)
	public String memberMypageModifyPage(@SessionAttribute Member member) {
	
		return "mypage/memberMypageModify";
		
	}
	
	//마이페이지 리스트에서 비밀번호변경 페이지로 접근
	@RequestMapping(value="/mypage/memberMypageChangePwdPage.do", method=RequestMethod.GET)
	public String memberMypageChangePwdPage() {
		
		return "mypage/memberMypageChangePwd";
		
	}
	
	//마이페이지 리스트에서 회원탈퇴 페이지로 접근
	@RequestMapping(value="/mypage/memberMypageWithdrawPage.do", method=RequestMethod.GET)
	public String memberMypageWithdrawPage() {
		
		return "mypage/memberMypageWithdraw";
		
	}
	
	//회원탈퇴
	@RequestMapping(value="/mypage/memberMypageWithdraw.do", method=RequestMethod.POST)
	public ModelAndView memberMypageWithdraw(HttpServletRequest request,
			ModelAndView mav,
			@SessionAttribute Member member,
			HttpSession session) {
		
		if(member==null) {
			mav.addObject("location", "/");
		} else {
			String userPwd = request.getParameter("userPwd");
			
			if(userPwd == null) {
				mav.addObject("msg", "비밀번호를 입력해주세요.");
				mav.addObject("location", "/mypage/memberMypageWithdrawPage.do");
			}
			
			if(request.getParameter("agree")==null) {
				mav.addObject("msg", "약관에 동의해주세요.");
				mav.addObject("location", "/mypage/memberMypageWithdrawPage.do");
			} else {
				String userId = member.getUserId();
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("userId", userId);
				map.put("userPwd", userPwd);
				
				int result = mmService.updateWithdraw(map);
				
				
				if(result>0) {
					session.invalidate();
					mav.addObject("msg", "탈퇴에 성공하였습니다.");
					mav.addObject("location", "/");
					
				} else {
					mav.addObject("msg", "탈퇴에 실패하였습니다.");
					mav.addObject("location", "/mypage/memberMypageListPage.do");
					
				}
			}
		}
		
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//비밀번호 변경
	@RequestMapping(value="/mypage/memberMypageChangePwd.do", method=RequestMethod.POST)
	public ModelAndView memberMypageWithdraw(@SessionAttribute Member member,
			ModelAndView mav,
			HttpServletRequest request,
			@RequestParam String userPwd,
			@RequestParam String userNewPwd) {
		
		if(member==null) {
			mav.addObject("location", "/");
		} else {
		
			String userId = member.getUserId();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userPwd",userPwd);
			map.put("userNewPwd", userNewPwd);
			
			int result = mmService.updatePassword(map);
			if(result>0) {
				mav.addObject("msg", "비밀번호 변경에 성공하였습니다.");
				mav.addObject("location", "/mypage/memberMypageListPage.do");
			} else {
				mav.addObject("msg", "비밀번호 변경에 실패하였습니다.");
				mav.addObject("location", "/mypage/memberMypageListPage.do");
			}
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//회원정보 변경
	@RequestMapping(value = "/mypage/memberMypageModify.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@RequestParam String userName,
			@RequestParam String userNick,
			@RequestParam String userEmail,
			@RequestParam String userPhone,
			@RequestParam String userAddressMain,
			@RequestParam String userAddressSub,
			@SessionAttribute Member member,
			HttpSession session,
			HttpServletRequest request,
			ModelAndView mav) {
		
		if(member==null) {
			mav.addObject("location", "/");
		} else {
			
			String userId = member.getUserId();
			
			Member m = new Member();
			m.setUserId(userId);
			m.setUserName(userName);
			m.setUserNick(userNick);
			m.setUserEmail(userEmail);
			m.setUserPhone(userPhone);
			m.setUserAddressMain(userAddressMain);
			m.setUserAddressSub(userAddressSub);
			
			int result = mmService.updateMember(m);
			
			if (result > 0) {
				
				mav.addObject("msg", "회원정보 변경에 성공하였습니다.");
				mav.addObject("location", "/mypage/memberMypageListPage.do");
				
				session = request.getSession();
				session.setAttribute("member", m);
				
			} else {
				
				mav.addObject("msg", "회원정보 변경에 실패했습니다.");
				mav.addObject("location", "/mypage/memberMypageListPage.do");
				
			}
			
		}
		mav.setViewName("commons/msg");
		return mav;

	}
}
