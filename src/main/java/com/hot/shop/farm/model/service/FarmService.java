package com.hot.shop.farm.model.service;

import com.hot.shop.farm.model.vo.Farm;

public interface FarmService {

	Farm selectLoginFarm(Farm farm);

	int selectIdCheck(String farmId);

	int insertMember(Farm farm);

}
