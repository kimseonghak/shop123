package com.hot.shop.farmENT.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farmENT.model.service.FarmENTService;
import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.member.model.vo.Member;

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
	public ModelAndView farmNoticePage(HttpServletRequest request,
										@RequestParam(required = false, defaultValue = "1") int currentPage, ModelAndView mv)
	{
		//검색 값이 있다면
		String type = request.getParameter("type");
		String keyWord = request.getParameter("keyWord");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("type",type);
		searchMap.put("keyWord", keyWord);
					
		HashMap<String, Object> map	=fENTservice.selectNoticeList(currentPage,searchMap);
		
		mv.addObject("list", map.get("list"));
		mv.addObject("pageNavi", map.get("pageNavi"));
		mv.addObject("type", type);
		mv.addObject("keyWord", keyWord);
		mv.setViewName("farm/farmNotice");
		
		return mv;

	}
	
	//공지게시판 내용
	@RequestMapping(value="/farm/farmNoticeContent.do",method = RequestMethod.GET)
	public ModelAndView farmNoticeContent(@RequestParam String noticeContent,@RequestParam String noticeTitle,ModelAndView mv)
	{
		mv.addObject("noticeContent", noticeContent);
		mv.addObject("noticeTitle", noticeTitle);
		
		mv.setViewName("farm/farmNoticeContent");
		
		return mv;
	}
	
	//문의사항 게시판
	@RequestMapping(value="/farm/farmQnaPage.do",method = RequestMethod.GET)
	public ModelAndView  farmQnaPage(@RequestParam(required = false,defaultValue = "1") int currentPage,
											ModelAndView mv,HttpServletRequest request) //session 연동되면 매개변수에 @SessionAttribute Farm farm 추가하기
	{
		//session 연동되면 사용하기
		//int farmNo = farm.getFarmNo(); 
		int farmNo = 1;
		
		//검색 조건 
		String type = request.getParameter("type");
		String keyWord = request.getParameter("keyWord");
		
	
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("type", type);
		searchMap.put("keyWord", keyWord);
		searchMap.put("farmNo",farmNo);
		
		HashMap<String, Object> map = fENTservice.selectFarmQnaList(currentPage,searchMap);
		
		mv.addObject("list",map.get("list"));
		mv.addObject("pageNavi",map.get("pageNavi"));
		mv.addObject("type",type);
		mv.addObject("keyWord",keyWord);
		mv.setViewName("farm/farmQna");
		
		return mv;
	}
	
	//낙찰상품 목록 게시판
	@RequestMapping(value="/farm/farmProductListPage.do",method = RequestMethod.GET)
	public ModelAndView farmProductListPage(HttpServletRequest request,ModelAndView mv,
			@RequestParam(required = false,defaultValue = "1") int currentPage) //session 연동되면 매개변수에 @SessionAttribute Farm farm 추가하기
	{
		//session 연동되면 사용하기
		//int farmNo = farm.getFarmNo(); 
		int farmNo = 1;
		
		//검색 값이 있다면
		String type = request.getParameter("type");
		String keyWord = request.getParameter("keyWord");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("farmNo",farmNo);
		searchMap.put("type",type);
		searchMap.put("keyWord", keyWord);
		
		//현재 페이지 값
		/*int currentPage;
		
		if(request.getParameter("currentPage")==null)
		{
			currentPage=1;
		}else
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		*/
		
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
		int farmNo = 1;
		
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
	public ModelAndView farmMemberInfoPage(@RequestParam int userNo,ModelAndView mv)
	{
		ArrayList<Member> list = fENTservice.selectOneMember(userNo);
		
		mv.addObject("list", list);
		mv.setViewName("farm/farmMemberInfo");
		
		return mv;
	}
	

	
	//주문목록 게시판 팝업창 2(상품정보)
	@RequestMapping(value="/farm/farmProductInfoPage.do",method = RequestMethod.GET)
	public ModelAndView farmProductInfoPage(@RequestParam String productName,ModelAndView mv)//session 연동되면 매개변수에 @SessionAttribute Farm farm 추가하기
	{
		//session 연동되면 사용하기
		//int farmNo = farm.farmNo();
		int farmNo = 1;		
		ArrayList<FarmENTProduct>list =fENTservice.selectOneProduct(productName,farmNo);
		
		mv.addObject("list", list);
		mv.setViewName("farm/farmProductInfo");
		
		return mv;
	}
	
	//주문목록 게시판 팝업창 3(배송입력)
	@RequestMapping(value="/farm/farmDeliveryInputForm.do",method = RequestMethod.GET)
	public ModelAndView farmDeliveryInputPage(@RequestParam int userNo,@RequestParam int buyNo,ModelAndView mv)
	{
		//배송 입력한 데이터 값 가져오기
		ArrayList<FarmENTDeliveryStatus> list = fENTservice.selectDeliveryInputData(buyNo);
		
		if(!list.isEmpty())
		{
			mv.addObject("list",list);
			mv.addObject("userNo",userNo);
			mv.addObject("buyNo",buyNo);
			mv.setViewName("farm/farmDeliveryInputForm");
		}else 
		{
			mv.addObject("userNo",userNo);
			mv.addObject("buyNo",buyNo);
			mv.setViewName("farm/farmDeliveryInputForm");
		}

		
		return mv;
		
		
	}
	
	//주문목록 -배송입력
	@RequestMapping(value="/farm/farmDeliveryInput.do",method = RequestMethod.POST)
	public ModelAndView farmDeliveryInputSubmit(@RequestParam int userNo,@RequestParam int buyNo,@RequestParam String deliveryCompany,
										@RequestParam String sendNo,@RequestParam String sendDate,
										@RequestParam String deliveryStatus,ModelAndView mv)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("buyNo", buyNo);
		map.put("deliveryCompany",deliveryCompany);
		map.put("sendNo",sendNo);
		map.put("sendDate",sendDate);
		map.put("deliveryStatus", deliveryStatus);
		
		
		int result= fENTservice.farmDeliveryInput(map);
		
		if(result>1)
		{
			mv.addObject("msg", "배송 입력이 완료되었습니다.");
			
		}else
		{

			mv.addObject("msg", "배송 입력에 실패하였습니다. 지속적인 오류 발생 시 관리자에게 문의해주세요.");
		}
			mv.setViewName("farm/farmMsg");
		return mv;
		
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
