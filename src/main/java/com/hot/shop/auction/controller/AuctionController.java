package com.hot.shop.auction.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.service.AuctionService;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService aucService;
	
	
	//경매 중인 경매폼 데이터 가져오기
	@RequestMapping(value="/auction/auctionPage.do", method = RequestMethod.GET)
	public ModelAndView auctionPage(ModelAndView mav){
		
		HashMap<String, Object> map = aucService.selectAuction();
		
		mav.addObject("map",map);
		
		mav.setViewName("auction/auctionPage");
		
		return mav;
	}
	
	@RequestMapping(value="/auction/auctionSale.do")
	public String auctionSale(){
		
		return "auction/auction_sale";
	}
	
	//최저가 입력 window.open 페이지 열기
	@RequestMapping(value="/auction/auctionWindow.do")
	public ModelAndView auctionWindow(ModelAndView mav,@RequestParam int auctionFormNo) {
		
		mav.addObject("auctionFormNo",auctionFormNo);
		mav.setViewName("auction/auction_windowOpen");
		
		return mav;
	}
	
	//수량,최저가 입력 시 비교하여 로직 처리
	@RequestMapping(value="/auction/auctionInputPrice.do", method = RequestMethod.POST)
	public void auctionInputPrice(@RequestParam int auctionCount, @RequestParam int lowestPrice,
								  Auction auction,@RequestParam int auctionFormNo ) {
		
		int auctionPrice = auction.getAuctionPrice();
		
		
		
		
	}
	
}
