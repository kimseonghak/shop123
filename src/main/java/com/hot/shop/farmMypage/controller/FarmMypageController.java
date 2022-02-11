package com.hot.shop.farmMypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.farmMypage.model.service.FarmMypageService;

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
				} else {
					mav.addObject("msg", "비밀번호 변경에 실패하였습니다.");
				}
			}
			mav.setViewName("commons/msg");
			return mav;
		}
	
}
