package com.hot.shop.farm.model.service;

import java.util.HashMap;
import java.util.List;

import com.hot.shop.farm.model.vo.Farm;

public interface FarmService {

	Farm selectLoginFarm(Farm farm);

	int selectIdCheck(String farmId);

	int selectEmailCheck(String farmEmail);

	int insertFarm(Farm farm);

	List<Farm> findIdFarm(Farm farm);

	Farm selectIdEmailCheck(Farm farm);

	int findPwdFarm(Farm farm);

	int farmRandomPwd(HashMap<String, Object> map);


}
