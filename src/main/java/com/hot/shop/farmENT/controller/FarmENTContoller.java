package com.hot.shop.farmENT.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FarmENTContoller {

	//공지사항 게시판
	@RequestMapping(value="/farm/farmNoticePage.do",method = RequestMethod.GET)
	public String farmNoticePage()
	{
		return "farm/farmNotice";
	}
	
	//문의사항 게시판
	@RequestMapping(value="/farm/farmQnaPage.do",method = RequestMethod.GET)
	public String farmQnaPage()
	{
		return "farm/farmQna";
	}
	
	//낙찰상품 목록 게시판
	@RequestMapping(value="/farm/farmProductListPage.do",method = RequestMethod.GET)
	public String farmProductListPage()
	{
		return "farm/farmProductList";
	}
	
	//주문목록 게시판
	@RequestMapping(value="/farm/farmOrdertListPage.do",method = RequestMethod.GET)
	public String farmOrdertListPage()
	{
		return "farm/farmOrderList";
	}
	
	
	
	
}
