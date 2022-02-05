package com.hot.shop.farmENT.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.member.model.vo.Member;

public interface FarmENTService {

	HashMap <String,Object> selectFarmENTProductList(int currentPage,HashMap<String, Object>searchMap);

	HashMap <String,Object> selectFarmENTOrderList(int currentPage, HashMap<String, Object> searchMap);

	ArrayList<Member> selectOneMember(int userNo);

	ArrayList<FarmENTProduct> selectOneProduct(String productName, int farmNo);

	int farmDeliveryInput(HashMap<String, Object> map);

	ArrayList<FarmENTDeliveryStatus> selectDeliveryInputData(int buyNo);

	HashMap<String, Object> selectNoticeList(int currentPage,HashMap<String, Object> searchMap);



}
