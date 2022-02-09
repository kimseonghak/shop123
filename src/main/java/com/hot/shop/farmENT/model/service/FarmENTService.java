package com.hot.shop.farmENT.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.farmENT.model.vo.FarmENTBidProductCount;
import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.farmENT.model.vo.FarmENTQna;
import com.hot.shop.farmENT.model.vo.FarmENTRefund;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;

public interface FarmENTService {

	HashMap <String,Object> selectFarmENTProductList(int currentPage,HashMap<String, Object>searchMap);

	HashMap <String,Object> selectFarmENTOrderList(int currentPage, HashMap<String, Object> searchMap);

	ArrayList<Member> selectOneMember(int userNo);

	ArrayList<FarmENTProduct> selectOneProduct(String productName, int farmNo);

	int farmDeliveryInput(HashMap<String, Object> map);

	ArrayList<FarmENTDeliveryStatus> selectDeliveryInputData(int buyNo);

	HashMap<String, Object> selectNoticeList(int currentPage,HashMap<String, Object> searchMap);

	HashMap<String, Object> selectFarmQnaList(int currentPage, HashMap<String, Object> searchMap);

	HashMap<String, Object> selectRefundList(int currentPage, HashMap<String, Object> searchMap);

	ArrayList<FarmENTOrder> selectOrdertDetailInfo(String orderNo);

	int updateRefund(HashMap<String, Object> dataMap);

	//대쉬보드 공지사항
	ArrayList<Notice> selectNoticeDashBoard();

	//대쉬보드 문의사항
	ArrayList<FarmENTQna> selectQnaDashBoard(int farmNo);

	//대쉬보드 환불목록
	ArrayList<FarmENTRefund> selectRefundBoard(int farmNo);
	
	//대시보드 매출
	ArrayList<FarmENTBidProductCount> selectProductSales(int farmNo);

	



}
