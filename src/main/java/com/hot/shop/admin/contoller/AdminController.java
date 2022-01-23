package com.hot.shop.admin.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value="/admin/adminDashboardPage.do",method = RequestMethod.GET)
	public String adminDashboardPage() {
		return "admin/admin_dashBoard";
	}
	@RequestMapping(value="/admin/adminAuctionPage.do",method = RequestMethod.GET)
	public String adminAuctionPage() {
		return "admin/admin_auction";
	}
}
