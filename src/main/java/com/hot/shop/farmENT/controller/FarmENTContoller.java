package com.hot.shop.farmENT.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farmENT.model.service.FarmENTService;

@Controller
public class FarmENTContoller {

	@Autowired	
	private FarmENTService fENTservice;
	
	//대시보드 (사업자 메인페이지)
	@RequestMapping(value="/farm/farmDashBoardPage.do",method = RequestMethod.GET)
	public String farmDashBoardPage()
	{
		return "farm/farmDashBoard";
	}
	
	
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
	public ModelAndView farmProductListPage(HttpServletRequest request,ModelAndView mv,
			@RequestParam(required = false,defaultValue = "1") int currentPage) //session 연동되면 매개변수에 @SessionAttribute Farm farm 추가하기
	{
		//session 연동되면 사용하기
		//int farmNo = farm.getFarmNo(); 
		int farmNo = 4;
		
		//검색 값이 있다면
		String type = request.getParameter("type");
		String keyWord = request.getParameter("keyWord");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("farmNo",farmNo);
		searchMap.put("type",type);
		searchMap.put("keyWord", keyWord);
		
		HashMap <String,Object> list =fENTservice.selectFarmENTProductList(currentPage,searchMap);
		
		
		mv.addObject("list",list.get("list"));
		mv.addObject("pageNavi",list.get("pageNavi"));
		mv.addObject("type",type);
		mv.addObject("keyWord",keyWord);
		
		mv.setViewName("farm/farmProductList");
		
		return mv;
	}
	

	
	
	//주문목록 게시판
	@RequestMapping(value="/farm/farmOrdertListPage.do",method = RequestMethod.GET)
	public ModelAndView farmOrdertListPage(HttpServletRequest request,ModelAndView mv,
			@RequestParam(required = false,defaultValue = "1") int currentPage) //session 연동되면 매개변수에 @SessionAttribute Farm farm 추가하기
	{
		//session 연동되면 사용하기
		//int farmNo = farm.farmNo();
		int farmNo = 4;
		
		//검색 값 받아오기 
		String type = request.getParameter("type");
		String keyWord = request.getParameter("keyWord");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("farmNo", farmNo);
		searchMap.put("type", type);
		searchMap.put("keyWord", keyWord);

				
		HashMap <String,Object> map	 = fENTservice.selectFarmENTOrderList(currentPage,searchMap);
		
		mv.addObject("list",map.get("list"));
		mv.addObject("pageNavi",map.get("pageNavi"));
		mv.addObject("type",type);
		mv.addObject("keyWord",keyWord);
		mv.setViewName("farm/farmOrderList");
		
		return mv;
	}
	
	//주문목록,환불목록 게시판 팝업창 1(회원정보)
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
	
	//환불목록 게시판
	@RequestMapping(value="/farm/farmRefundList.do",method = RequestMethod.GET)
	public String farmRefundListPage()
	{
		return "farm/farmRefundList";
	}
	
	//환불목록 게시판 팝업창 1(주문상세)
	@RequestMapping(value="/farm/farmOrdertDetailInfoPage.do",method = RequestMethod.GET)
	public String farmOrdertDetailInfoPage()
	{
		return "farm/farmOrderDetailInfo";
	}
	

	
}
