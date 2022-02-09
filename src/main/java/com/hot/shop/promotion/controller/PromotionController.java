package com.hot.shop.promotion.controller;

import java.util.HashMap;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.promotion.model.service.PromotionService;

@Controller
public class PromotionController {
	
	@Autowired
	private PromotionService pService;
	
	@Autowired
	private ServletContext context;

	//헤더에서 홍보 게시판을 누르면 이동하는 메소드(페이징 처리, 검색 기능까지 구현)
	@RequestMapping(value="/promotion/promotionListPage.do", method= RequestMethod.GET)
	public ModelAndView PromotionListPage(ModelAndView mav,
			@SessionAttribute(required = false) Member member,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "default") String type,
			@SessionAttribute(required = false) Farm farm) 
	{	
		if(member==null&&farm==null) {
			mav.setViewName("member/login");
			return mav;
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("farm", farm);
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			map.put("type", type);
			HashMap<String, Object> returnMap = pService.selectPromotionList(map);
			returnMap.put("keyword", keyword);
			returnMap.put("type", type);
			mav.addObject("map",returnMap);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("promotion/PromotionList");
			return mav;
		}
		
	}
	
	//글 작성 페이지로 이동
	@RequestMapping(value="/promotion/PromotionWritePage.do", method=RequestMethod.GET)
	public String PromotionWritePage() {
		return "promotion/PromotionWrite";
	}
	
	
}
