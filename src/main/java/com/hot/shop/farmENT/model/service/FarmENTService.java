package com.hot.shop.farmENT.model.service;

import java.util.HashMap;

public interface FarmENTService {

	HashMap <String,Object> selectFarmENTProductList(int currentPage,HashMap<String, Object>searchMap);

	HashMap <String,Object> selectFarmENTOrderList(int currentPage, HashMap<String, Object> searchMap);

}
