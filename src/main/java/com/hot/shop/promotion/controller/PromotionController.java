package com.hot.shop.promotion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PromotionController {

	@RequestMapping(value="/promotion/promotionListPage.do", method= RequestMethod.GET)
	public ModelAndView PromotionListPage(ModelAndView mav) {
		
		mav.setViewName("promotion/PromotionList");
		return mav;
	}
	
	
}
