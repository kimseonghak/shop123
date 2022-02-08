package com.hot.shop.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

public interface AuctionService {

	
	HashMap<String, Object> selectAuction();

	int inputLowestPrice(Auction auc, int farmNo);

	HashMap<String, Object> selectAuctionSale();

	Member selectMember(Member member);

	Farm selectFarm(Farm f);

	int insertOrder(Purchaselist p);

	
	
}
