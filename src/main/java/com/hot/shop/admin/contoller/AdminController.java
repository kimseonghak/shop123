package com.hot.shop.admin.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.shop.admin.model.vo.Auction;

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
	
	@RequestMapping(value = "/admin/auctionInput.do",method = RequestMethod.POST)
	public void auctionInput(Auction auction) {
		System.out.println(auction.toString());
	}
}
