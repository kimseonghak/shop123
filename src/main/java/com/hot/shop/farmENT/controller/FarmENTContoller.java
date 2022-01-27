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
	
	//주문목록 게시판 팝업창 1(회원정보)
	@RequestMapping(value="/farm/farmMemberInfoPage.do",method = RequestMethod.GET)
	public String farmMemberInfoPage()
	{
		return "farm/farmMemberInfo";
	}
	
	//주문목록 게시판 팝업창 2(상품정보)
	@RequestMapping(value="/farm/farmProductInfoPage.do",method = RequestMethod.GET)
	public String farmProductInfoPage()
	{
		return "farm/farmProductInfo";
	}
	
	//주문목록 게시판 팝업창 3(배송입력)
	@RequestMapping(value="/farm/farmDeliveryInput.do",method = RequestMethod.GET)
	public String farmDeliveryInputPage()
	{
		return "farm/farmDeliveryInput";
	}
	
	
	
	
}
