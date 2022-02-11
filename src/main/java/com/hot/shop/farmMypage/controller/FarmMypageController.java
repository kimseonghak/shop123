package com.hot.shop.farmMypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.farmMypage.model.service.FarmMypageService;
import com.hot.shop.member.model.vo.Member;

@Controller
public class FarmMypageController {

	@Autowired
	private FarmMypageService fmService;
	
	
	//farm 비밀번호 변경
		@RequestMapping(value="/farmMypage/farmMypageChangePwd.do", method=RequestMethod.POST)
		public ModelAndView memberMypageWithdraw(@SessionAttribute Farm farm,
				ModelAndView mav,
				HttpServletRequest request,
				@RequestParam String farmPwd,
				@RequestParam String farmNewPwd) {
			
			if(farm==null) {
				mav.addObject("location", "/");
			} else {
			
				String farmId = farm.getFarmId();
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farmId", farmId);
				map.put("farmPwd",farmPwd);
				map.put("farmNewPwd", farmNewPwd);
				
				int result = fmService.updatePassword(map);
				if(result>0) {
					mav.addObject("msg", "비밀번호 변경에 성공하였습니다.");
					mav.setViewName("farm/farmMsg");
				} else {
					mav.addObject("msg", "비밀번호 변경에 실패하였습니다.");
					mav.addObject("location", "/farm/farmPwdChangePage.do");
					mav.setViewName("commons/msg");
				}
			}
			return mav;
		}
		
	//farm 회원탈퇴
	@RequestMapping(value="/farmMypage/farmMypageWithdraw.do", method=RequestMethod.POST)
	public ModelAndView memberMypageWithdraw(HttpServletRequest request,
			ModelAndView mav,
			@SessionAttribute Farm farm,
			HttpSession session) {
		
		if(farm==null) {
			mav.addObject("location", "/");
		} else {
			String farmPwd = request.getParameter("farmPwd");
			
			if(farmPwd == null) {
				mav.addObject("msg", "비밀번호를 입력해주세요.");
				mav.addObject("location", "/farm/farmWithdrawPage.do");
			}
			
			if(request.getParameter("agree")==null) {
				mav.addObject("msg", "약관에 동의해주세요.");
				mav.addObject("location", "/farm/farmWithdrawPage.do");
			} else {
				String farmId = farm.getFarmId();
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farmId", farmId);
				map.put("farmPwd", farmPwd);
				
				int result = fmService.updateWithdraw(map);
				
				
				if(result>0) {
					session.invalidate();
					mav.addObject("msg", "탈퇴에 성공하였습니다.");
					mav.setViewName("farm/farmMsg");
					
				} else {
					mav.addObject("msg", "탈퇴에 실패하였습니다.");
					mav.addObject("location", "/farm/farmWithdrawPage.do");
					mav.setViewName("commons/msg");
				}
			}
		}
		
		return mav;
	}
	
	//회원정보 변경
	@RequestMapping(value = "/farmMypage/farmMypageModify.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@RequestParam String farmName,
			@RequestParam String farmBusiNum,
			@RequestParam String farmEmail,
			@RequestParam String farmPhone,
			@RequestParam String farmAddressMain,
			@RequestParam String farmAddressSub,
			@SessionAttribute Farm farm,
			HttpSession session,
			HttpServletRequest request,
			ModelAndView mav) {
		
		if(farm==null) {
			mav.addObject("location", "/");
		} else {
			
			String farmId = farm.getFarmId();
			
			Farm f = new Farm();
			f.setFarmId(farmId);
			f.setFarmName(farmName);
			f.setFarmBusiNum(farmBusiNum);
			f.setFarmEmail(farmEmail);
			f.setFarmPhone(farmPhone);
			f.setFarmAddressMain(farmAddressMain);
			f.setFarmAddressSub(farmAddressSub);
			
			int result = fmService.updateFarm(f);
			
			if (result > 0) {
				
				session = request.getSession();
				session.setAttribute("farm", f);
				
				mav.addObject("msg", "회원정보 변경에 성공하였습니다.");
				mav.setViewName("farm/farmMsg");
				
			} else {
				
				mav.addObject("msg", "회원정보 변경에 실패했습니다.");
				mav.addObject("location", "farm/farmMypageModifyPage.do");
				mav.setViewName("commons/msg");
			}
			
		}
		return mav;

	}
	
}
