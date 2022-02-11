package com.hot.shop.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.auction.model.dao.AuctionDAO;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

@Service
public class AuctionServiceImpl implements AuctionService{
	
	@Autowired
	private AuctionDAO aucDAO;

	@Override
	public HashMap<String, Object> selectAuction() {

		return aucDAO.selectAuction();
		
	}

	@Override
	public int inputLowestPrice(Auction auc, int farmNo) {

		return aucDAO.inputLowestPrice(auc,farmNo);
	}

	@Override
	public HashMap<String, Object> selectAuctionSale() {
		
		
		return aucDAO.selectAuctionSale();
		
	}

	@Override
	public Member selectMember(Member member) {

		return aucDAO.selectLoginMember(member);
	}

	@Override
	public Farm selectFarm(Farm f) {

		return aucDAO.selectFarmName(f);
	}

	@Override
	public int insertOrder(Purchaselist p) {

		return aucDAO.insertOrder(p);
	}

	@Override
	public int minusAuctionCount1(int auctionCount, int auctionNo) {

		return aucDAO.minusAuctionCount1(auctionCount, auctionNo);
	}

	@Override
	public HashMap<String, Object> orderListInfo(int currentPage, int userNo) {
		
		int recordCountPerPage=5;
		
		ArrayList<Purchaselist> list = aucDAO.orderListInfo(recordCountPerPage,currentPage,userNo); 
		
		int naviCountPerPage=10;
		
		String pageNavi = aucDAO.getPageNavi(recordCountPerPage,currentPage,naviCountPerPage,userNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}



	

}
