package com.hot.shop.admin.contoller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.service.AdminService;
import com.hot.shop.admin.model.vo.Auction;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value="/admin/adminDashboardPage.do",method = RequestMethod.GET)
	public String adminDashboardPage() {
		return "admin/admin_dashBoard";
	}
	@RequestMapping(value="/admin/adminAuctionPage.do",method = RequestMethod.GET)
	public ModelAndView adminAuctionPage(ModelAndView mav) {
		
		HashMap<String, Object> map = aService.auctionCheck();
		mav.addObject("map",map);
		mav.setViewName("admin/admin_auction");
		return mav;
	}
	
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
}
