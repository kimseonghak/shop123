package com.hot.shop.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.admin.model.dao.AdminDAO;
import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionUser;

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
	public HashMap<String, Integer> countOutput() {
		return aDAO.countOutput();
	}

	@Override
	public void countInput() {
		aDAO.countInput();
	}

	@Override
	public HashMap<String, Integer> joinOutput() {
		return aDAO.joinOutput();
	}

	@Override
	public HashMap<String, Integer> farmOutput() {
		return aDAO.farmOutpuf();
	}

	@Override
	public ArrayList<QuestionUser> questionUser() {
		return aDAO.questionUser();
	}

	@Override
	public ArrayList<QuestionFarm> questionFarm() {
		return aDAO.questionFarm();
	}

	@Override
	public HashMap<String, Object> farmQNAList(int currentPage) {
		int recordCountPerPage=10;
		ArrayList<QuestionFarm> list = aDAO.questiopFarmList(recordCountPerPage,currentPage); 
		int naviCountPerPage=10;
		String pageNavi = aDAO.getFarmQNAPageNavi(recordCountPerPage, currentPage, naviCountPerPage);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		return map;
	}

	@Override
	public HashMap<String, Object> farmQNASearchList(HashMap<String, Object> map, int currentPage) {
		int recordCountPerPage=10;
		ArrayList<QuestionFarm> list = aDAO.questionFarmSearchList(recordCountPerPage,currentPage,map);
		int naviCountPerPage=10;
		String pageNavi = aDAO.getFarmQNASearchPageNavi(recordCountPerPage,currentPage,map,naviCountPerPage);
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public QuestionFarm questionFarmContent(int questionFarmNo) {
		return aDAO.questionFarmContent(questionFarmNo);
	}

	@Override
	public HashMap<String, Object> userQNAList(int currentPage) {
		int recordCountPerPage=10;
		ArrayList<QuestionUser> list = aDAO.questiopUserList(recordCountPerPage,currentPage); 
		int naviCountPerPage=10;
		String pageNavi = aDAO.getUserQNAPageNavi(recordCountPerPage, currentPage, naviCountPerPage);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		return map;
	}

	@Override
	public HashMap<String, Object> userQNASearchList(HashMap<String, Object> map, int currentPage) {
		int recordCountPerPage=10;
		ArrayList<QuestionUser> list = aDAO.questionUserSearchList(recordCountPerPage,currentPage,map);
		int naviCountPerPage=10;
		String pageNavi = aDAO.getUserQNASearchPageNavi(recordCountPerPage,currentPage,map,naviCountPerPage);
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}
}
