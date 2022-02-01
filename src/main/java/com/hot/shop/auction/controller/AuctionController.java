package com.hot.shop.auction.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.service.AuctionService;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService aucService;

	@RequestMapping(value="/auction/auctionPage.do", method = RequestMethod.GET)
	public ModelAndView auctionPage(ModelAndView mav){
		
		ArrayList<Auction> list = aucService.selectAuction();
	
		
		
		mav.addObject("list",list);
		
		mav.setViewName("auction/auctionPage");
		
		return mav;
	}
	
	@RequestMapping(value="/auction/auctionSale.do")
	public String auctionSale(){
		
		return "auction/auction_sale";
	}
	
	@RequestMapping(value="/auction/auctionWindow.do")
	public String auctionWindow() {
		
		return "auction/auction_windowOpen";
	}
	
}
