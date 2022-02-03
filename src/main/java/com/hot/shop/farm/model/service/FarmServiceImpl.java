package com.hot.shop.farm.model.service;

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
	public int insertMember(Farm farm) {
		return fDAO.insertMember(farm);
	}
}
