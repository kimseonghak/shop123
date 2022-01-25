package com.hot.shop.admin.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.dao.AdminDAO;
import com.hot.shop.admin.model.vo.Auction;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public int auctionInput(Auction au) {
		return aDAO.auctionInput(au);
	}

	@Override
	public HashMap<String, Object> auctionCheck() {
		return aDAO.auctionCheck();
	}

}
