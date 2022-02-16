package com.hot.shop.farmENT.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farmENT.model.dao.FarmENTDAO;
import com.hot.shop.farmENT.model.vo.FarmENTBidProduct;
import com.hot.shop.farmENT.model.vo.FarmENTBidProductCount;
import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.farmENT.model.vo.FarmENTQna;
import com.hot.shop.farmENT.model.vo.FarmENTRefund;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;



@Service
public class FarmENTServiceImpl implements FarmENTService{

	@Autowired
	private FarmENTDAO fENTdao;

	//낙찰 목록 페이지
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

	//주문 목록 페이지
	@Override
	public HashMap <String,Object> selectFarmENTOrderList(int currentPage, HashMap<String, Object> searchMap) {
		
		//한 페이지당 보여질 게시물의 개수
		int recordCountPerPage=10;
		
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

	//배송 입력
	@Override
	public int farmDeliveryInput(HashMap<String, Object> map) {
		
		return	fENTdao.farmDeliveryInput(map);
	}

	//입력한 배송 데이터 가져오기
	@Override
	public ArrayList<FarmENTDeliveryStatus> selectDeliveryInputData(int buyNo) {
		
		 ArrayList<FarmENTDeliveryStatus> list = (fENTdao.selectDeliveryInputData(buyNo));
		
		 return list;
	}

	//공지사항 페이지
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

	//문의사항 페이지
	@Override
	public HashMap<String, Object> selectFarmQnaList(int currentPage, HashMap<String, Object> searchMap) {
		
		int recordCountPerPage = 10;
		
		ArrayList<FarmENTQna> list = fENTdao.selectFarmQnaList(recordCountPerPage,currentPage,searchMap);
		
		
		//navi 생성
		int naviCountPerPage=5;
		String pageNavi = fENTdao.getQnaListNavi(recordCountPerPage,naviCountPerPage,currentPage,searchMap);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
		
	}
	
	//환붊 목록 페이지
	@Override
	public HashMap<String, Object> selectRefundList(int currentPage, HashMap<String, Object> searchMap) {
		
		//환불 리스트
		int recordCountPerPage = 10;
		ArrayList<FarmENTRefund> list =fENTdao.selectRefundList(recordCountPerPage,currentPage,searchMap);
		
		//pagrNavi
		int naviCountPerPage=5;
		String pageNavi	= fENTdao.getRefundListNavi(recordCountPerPage,naviCountPerPage,currentPage,searchMap);
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	//사업자 환불 승인
	@Override
	public ArrayList<FarmENTOrder> selectOrdertDetailInfo(String orderNo) {
		
		ArrayList<FarmENTOrder> list =fENTdao.selectOrdertDetailInfo(orderNo);
				
		return list;
	}
	//사업자 환불 접수 취소
	@Override
	public int updateRefund(HashMap<String, Object> dataMap) {
		
		return fENTdao.updateRefund(dataMap);
		
	}

	//대쉬보드-공지사항
	@Override
	public ArrayList<Notice> selectNoticeDashBoard() {
		
		ArrayList<Notice> list = fENTdao.selectNoticeDashBoard();
		
		return list;
	}

	//대쉬보드-문의사항
	@Override
	public ArrayList<FarmENTQna> selectQnaDashBoard(int farmNo) {
		
		ArrayList<FarmENTQna> list = fENTdao.selectQnaDashBoard(farmNo);
		
		return list;
	}

	//대쉬보드-환불목록
	@Override
	public ArrayList<FarmENTRefund> selectRefundBoard(int farmNo) {
		
		ArrayList<FarmENTRefund> list = fENTdao.selectRefundBoard(farmNo);
		
		return list;
	}

	//대쉬보드 매출목록
	@Override
	public ArrayList<FarmENTBidProductCount> selectProductSales(int farmNo) {
		
		//경매 일자 기준으로 5개의 상품 가져오기
		ArrayList<FarmENTBidProduct> productList = fENTdao.selectFiveProduct(farmNo);
		
		//productList를 가지고 판매량 가져오기
		HashMap<String,Object> productDataMap = new HashMap<String, Object>();
		
		if(!productList.isEmpty())
		{
			for(int i=0; i<productList.size();i++)
			{
				productDataMap.put("product"+(i+1)+"",productList.get(i).getAuctionProduct());
			}
			
				switch (productList.size())
					{
					  case 1: productDataMap.put("size",1); break;
					  case 2: productDataMap.put("size",2); break;
					  case 3: productDataMap.put("size",3); break;
					  case 4: productDataMap.put("size",4); break;
					  case 5: productDataMap.put("size",5); break;
					}
			
				productDataMap.put("farmNo",farmNo);
				ArrayList<FarmENTBidProductCount> bidProductCountList = fENTdao.selectFiveProductCount(productDataMap);
				
				return bidProductCountList;
		}else
		{
			return null;
		}
	}





}

