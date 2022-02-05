package com.hot.shop.farmENT.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farmENT.model.dao.FarmENTDAO;
import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;

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
	//회원정보
	@Override
	public ArrayList<Member> selectOneMember(int userNo) {
		
		ArrayList<Member> list = fENTdao.selectOneMember(userNo);
		
		return list;
	}

	//상품정보
	@Override
	public ArrayList<FarmENTProduct> selectOneProduct(String productName, int farmNo) {
		
		ArrayList<FarmENTProduct> list =fENTdao.selectOneProduct(productName,farmNo);
		
		return list;
		
	}

	@Override
	public int farmDeliveryInput(HashMap<String, Object> map) {
		
		return	fENTdao.farmDeliveryInput(map);
	}

	@Override
	public ArrayList<FarmENTDeliveryStatus> selectDeliveryInputData(int buyNo) {
		
		//공지사항 목록 가져오기
		 ArrayList<FarmENTDeliveryStatus> list = (fENTdao.selectDeliveryInputData(buyNo));
		
		 return list;
		
	}

	//공지사항 질문 리스트
	@Override
	public HashMap<String, Object> selectNoticeList(int currentPage,HashMap<String, Object> searchMap) {
		
		int recordCountPerPage = 10;
		
		//공지사랑 리스트 가져오기
		ArrayList<Notice> list = fENTdao.selectNoticeList(currentPage,recordCountPerPage,searchMap);
		
		//navi 생성
		int naviCountPerPage=5;
		String pageNavi	=fENTdao.getNoticeListPageNavi(recordCountPerPage, currentPage, naviCountPerPage,searchMap);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
		
		
	}





}

