package com.hot.shop.auction.controller;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.service.AuctionService;
import com.hot.shop.farm.model.vo.Farm;

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
	
	//수량,최저가 입력 시 비교하여 로직 처리
	@RequestMapping(value="/auction/auctionInputPrice.do", method = RequestMethod.POST)
	public void auctionInputPrice(Auction auc, @SessionAttribute Farm farm,
								  HttpServletResponse response, @RequestParam int currentPrice,
								  ModelAndView mav)throws IOException {
		
		int farmNo = farm.getFarmNo();
		int auctionCount1 = auc.getAuctionCount1();
		int auctionPrice = auc.getAuctionPrice();
		
		if(auctionCount1>0 && auctionPrice<currentPrice) {
		
			int result = aucService.inputLowestPrice(auc, farmNo);
			
			if(result>0) {
			
				response.getWriter().print(true);
				
			}else {
				
				response.getWriter().print(false);
			}
			
		}else {
			mav.addObject("msg","잘못된 접근입니다. 다시 확인해주세요.");
		}
		
	}
	
	
	@RequestMapping(value="/auction/auctionSalePage.do",method=RequestMethod.POST)
	public String auctionSalePage() {
		
		return "auction/auction_sale";
	}
	
}
