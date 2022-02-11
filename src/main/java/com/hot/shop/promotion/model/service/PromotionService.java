package com.hot.shop.promotion.model.service;

import java.util.HashMap;

import com.hot.shop.promotion.model.vo.Promotion;
import com.hot.shop.promotion.model.vo.PromotionPhoto;

public interface PromotionService {

	HashMap<String, Object> selectPromotionList(HashMap<String, Object> map);

	int insertWriteFile(PromotionPhoto pp);

	int insertWrite(Promotion promotion);

	HashMap<String, Object> promotionView(int promotionNo);

}
