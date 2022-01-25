package com.hot.shop.admin.model.service;

import java.util.HashMap;

import com.hot.shop.admin.model.vo.Auction;

public interface AdminService {

	int auctionInput(Auction au);

	HashMap<String, Object> auctionCheck();

}
