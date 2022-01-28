package com.hot.shop.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.dao.AdminDAO;
import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.admin.model.vo.SellForm;

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
	
	@Override
	public void BIDScheduler() {
		aDAO.BIDScheduler();
	}

	@Override
	public HashMap<String, Object> BIDInfo(int currentPage,int formNo) {
		
		int recordCountPerPage=10;
		ArrayList<BID> list = aDAO.BIDList(recordCountPerPage,currentPage); 
		int naviCountPerPage=10;
		String pageNavi = aDAO.getPageNavi(recordCountPerPage,currentPage,naviCountPerPage,formNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public Auction outputAucionInfo(int auctionNo) {
		return aDAO.outputAucionInfo(auctionNo);
	}

	@Override
	public int sellInput(SellForm sf) {
		return aDAO.sellInput(sf);
	}

	@Override
	public HashMap<String, Object> sellFormCheck() {
		return aDAO.sellFormCheck();
	}

	@Override
	public int sellUpdate(SellForm sf) {
		return aDAO.sellUpdate(sf);
	}

	@Override
	public void countOutput() {
		aDAO.countOutput();
	}

	@Override
	public void countInput() {
		aDAO.countInput();
	}
}
