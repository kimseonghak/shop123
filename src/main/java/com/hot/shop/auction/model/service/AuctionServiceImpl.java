package com.hot.shop.auction.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.dao.AuctionDAO;
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

	

}
