package com.hot.shop.admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hot.shop.admin.model.service.AdminService;
import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	//최초 대시보드 접속
	@RequestMapping(value="/admin/adminDashboardPage.do",method = RequestMethod.GET)
	public String adminDashboardPage() {
		return "admin/admin_dashBoard";
	}
	//옥션 페이지
	@RequestMapping(value="/admin/adminAuctionPage.do",method = RequestMethod.GET)
	public ModelAndView adminAuctionPage(ModelAndView mav) {
		
		HashMap<String, Object> map = aService.auctionCheck();
		mav.addObject("map",map);
		mav.setViewName("admin/admin_auction");
		return mav;
	}
	//경매 정보 입력
	@RequestMapping(value = "/admin/auctionInput.do",method = RequestMethod.POST)
	public ModelAndView auctionInput(Auction au,ModelAndView mav) {
		au.setFarmNo(1);
		int result = aService.auctionInput(au);
		if(result>0) {
			mav.addObject("msg",au.getAuctionFormNo()+"번 경매가 시작되었습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}else {
			mav.addObject("msg","오류가 발생하였습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}
		
		mav.setViewName("commons/msg");
		
		return mav;
	}
	//낙찰 정보 가져오기
	@RequestMapping(value = "/admin/adminAuctionInfoPage.do", method = RequestMethod.GET)
	public ModelAndView adminAuctionInfoPage(HttpServletRequest request,ModelAndView mav,@RequestParam int formNo) {
		int currentPage;
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String,Object> map = aService.BIDInfo(currentPage);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("map",map);
		mav.addObject("formNo",formNo);
		mav.setViewName("admin/admin_auction_info");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/outputAuctionInfo.do", method = RequestMethod.GET)
	public void outputAucionInfo(@RequestParam int auctionNo,HttpServletResponse response) throws IOException{
		Auction au = aService.outputAucionInfo(auctionNo);
		Gson gson = new Gson();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		gson.toJson(au,out);
	}
}
