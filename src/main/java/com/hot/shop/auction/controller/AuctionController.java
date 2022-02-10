package com.hot.shop.auction.controller;


import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.auction.model.service.AuctionService;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

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
		
		if(auctionCount1>49 && auctionPrice<currentPrice) {
		
			int result = aucService.inputLowestPrice(auc, farmNo);
			
			if(result>0) {
			
				response.getWriter().print(true);
				
			}else {
				
				response.getWriter().print(false);
			}
			
		}
		
	}
	
	//진행 중인 구매 폼 찾아서 데이터 가져오기
	@RequestMapping(value="/auction/auctionSalePage.do",method=RequestMethod.GET)
	public ModelAndView auctionSalePage(ModelAndView mav) {
		
		HashMap<String, Object> map = aucService.selectAuctionSale();
		
		mav.addObject("map",map);
		
		mav.setViewName("auction/auction_sale");
		
		return mav;
		
	}
	
	//구매하기 누를 경우 수량 비교하고, 해당 유저 데이터 가져와서 주문 하기 페이지로 이동
	@RequestMapping(value="/auction/orderPage.do", method = RequestMethod.POST)
	public ModelAndView orderPage(SellForm sf, Member member, Farm f,
							@RequestParam int currentCount,
							ModelAndView mav) {
		
		int auctionCount = sf.getAuctionCount1();
		
		if(currentCount<auctionCount) {
			
			mav.addObject("msg","잘못된 접근입니다. 다시 확인해주세요.");
		
		}else {
			
			Member m = aucService.selectMember(member);
			f = aucService.selectFarm(f);
			
			mav.addObject("m",m);
			mav.addObject("f",f);
			mav.addObject("sf",sf);
			
		
			mav.setViewName("auction/orderPage");
			
		}
		
		return mav;
	}
	
	//결제하기 누를 경우 Purchaselist 테이블에 데이터 삽입, 수량 빼기
	@RequestMapping(value="/auction/orderPay.do", method = RequestMethod.POST)
	public void orderPay(Purchaselist p, HttpServletResponse response,
						 @RequestParam int auctionNo)throws IOException {
		
		int auctionCount  = p.getProductCount();
		int insertResult = aucService.insertOrder(p);
		int farmNo = p.getFarmNo();
		int updateResult = aucService.minusAuctionCount1(auctionCount, auctionNo);
		
		if(insertResult>0 && updateResult>0) {
			
			response.getWriter().print(true);
			
		}else {
			
			response.getWriter().print(false);
		}
	
	}
	
	//결제가 되면 주문 완료 페이지로이동
	@RequestMapping(value="/auction/orderComplete.do",method = RequestMethod.GET)
	public String orderComplete() {
		
		return "auction/orderComplete";
	}
	
	
	//해당 유저의 주문 목록 페이지
	@RequestMapping(value="/auction/orderListPage.do",method = RequestMethod.GET)
	public ModelAndView orderListPage(@RequestParam(required = false, defaultValue = "1") int currentPage,
								@RequestParam int userNo,ModelAndView mav) {
		
		HashMap<String, Object> map = aucService.orderListInfo(currentPage,userNo);
		
		mav.addObject("map",map);
		mav.addObject("userNo",userNo);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("auction/orderList");
		
		return mav;
	}
	
	//주문 목록에서 주문번호를 누를 경우 상세 페이지로 이동
	@RequestMapping(value="/auction/orderDetailPage.do")
	public String orderDetailPage() {
		
		return "auction/orderDetailPage";
	}
	
	
	
	
	
}
