package com.hot.shop.farmMypage.model.service;

import java.util.HashMap;

import com.hot.shop.farm.model.vo.Farm;

public interface FarmMypageService {

	int updatePassword(HashMap<String, Object> map);

	int updateWithdraw(HashMap<String, Object> map);

	int updateFarm(Farm f);

}
