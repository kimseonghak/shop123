package com.hot.shop.farm.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farm.model.dao.FarmDAO;
import com.hot.shop.farm.model.vo.Farm;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	private FarmDAO fDAO;

	@Override
	public Farm selectLoginFarm(Farm farm) {
		return fDAO.selectLoginFarm(farm);
	}

	@Override
	public int selectIdCheck(String farmId) {
		return fDAO.selectIdCheck(farmId);
	}

	@Override
	public int selectEmailCheck(String farmEmail) {
		return fDAO.selectEmailCheck(farmEmail);
	}
	
	@Override
	public int insertFarm(Farm farm) {
		return fDAO.insertFarm(farm);
	}

	@Override
	public List<Farm> findIdFarm(Farm farm) {
		return fDAO.findIdFarm(farm);
	}

	@Override
	public Farm selectIdEmailCheck(Farm farm) {
		return fDAO.selectIdEmailCheck(farm);
	}

	@Override
	public int findPwdFarm(Farm farm) {
		return fDAO.findPwdFarm(farm);
	}

	@Override
	public int farmRandomPwd(HashMap<String, Object> map) {
		return fDAO.farmRandomPwd(map);
	}

}
