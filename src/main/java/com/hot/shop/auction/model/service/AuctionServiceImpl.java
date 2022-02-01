package com.hot.shop.auction.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.auction.model.dao.AuctionDAO;

@Service
public class AuctionServiceImpl implements AuctionService{
	
	@Autowired
	private AuctionDAO aucDAO;

	@Override
	public ArrayList<Auction> selectAuction() {

		return aucDAO.selectAuction();
		
	}

}
