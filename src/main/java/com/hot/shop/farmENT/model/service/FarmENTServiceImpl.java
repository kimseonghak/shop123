package com.hot.shop.farmENT.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farmENT.model.dao.FarmENTDAO;
import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;

@Service
public class FarmENTServiceImpl implements FarmENTService{

	@Autowired
	private FarmENTDAO fENTdao;

	@Override
	public HashMap <String,Object> selectFarmENTProductList(int currentPage,HashMap<String, Object>searchMap) {
		
		int recordCountPerPage = 10;
		
		//낙찰된 목록 가져오기
		ArrayList<FarmENTProduct> list = fENTdao.selectFarmENTProductList(recordCountPerPage,currentPage,searchMap);
		
		//navi 생성
		int naviCountPerPage=5;
		String pageNavi = fENTdao.getPageNavi(recordCountPerPage,currentPage,naviCountPerPage,searchMap);
		
		HashMap <String,Object> map =new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
		
		
	}

	@Override
	public HashMap <String,Object> selectFarmENTOrderList(int currentPage, HashMap<String, Object> searchMap) {
		
		//한 페이지당 보여질 게시물의 개수
		int recordCountPerPage=5;
		
		//주문 목록 가져오기
		ArrayList<FarmENTOrder> list =fENTdao.selectFarmENTOrderList(recordCountPerPage,currentPage,searchMap);
		
		//navi 생성
		int naviCountPerPage=5;
		String pageNavi	=fENTdao.getOrderListPageNavi(recordCountPerPage, currentPage, naviCountPerPage, searchMap);
		
		HashMap <String,Object> map =new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
		
	}




}

