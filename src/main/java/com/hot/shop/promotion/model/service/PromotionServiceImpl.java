package com.hot.shop.promotion.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.promotion.model.dao.PromotionDAO;
import com.hot.shop.promotion.model.vo.Promotion;
import com.hot.shop.question.model.vo.QuestionUser;

@Service
public class PromotionServiceImpl implements PromotionService{

	@Autowired
	private PromotionDAO pDAO;
	
	@Override
	public HashMap<String, Object> selectPromotionList(HashMap<String, Object> map) {
		int recordCountPerPage=5;
		ArrayList<Promotion> list = pDAO.getPromotionList(recordCountPerPage,map);
		int naviCountPerPage=10;
		String pageNavi = pDAO.getPromotionNavi(recordCountPerPage,naviCountPerPage,map);
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("pageNavi",pageNavi);
		return returnMap;
	}

	
	
	
}
