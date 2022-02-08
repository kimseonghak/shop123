package com.hot.shop.productintro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.productintro.model.Service.ProductintroService;

@Controller
public class ProductintroController {
	
	@Autowired
	private ProductintroService piService;

	//메인에서 제철 특산물 버튼을 누르면 이동하는 메소드
	@RequestMapping(value="/productintro/SeasonProductListPage.do", method= RequestMethod.GET)
	public ModelAndView SeasonList(ModelAndView mav) {
		
		mav.setViewName("productintro/SeasonProductList");
		return mav;
	}
	
	//제철 특산물 리스트 작성
	
	
	
	//지역 특산물 리스트 조회
	
	
	//지역 특산물 리스트 수정
	
	//지역 특산물 리스트 삭제
	
	
}
