package com.hot.shop.farmMypage.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.farmMypage.model.dao.FarmMypageDAO;

@Service
public class FarmMypageServiceImpl implements FarmMypageService {

	@Autowired
	private FarmMypageDAO fmDAO;

	@Override
	public int updatePassword(HashMap<String, Object> map) {
		return fmDAO.updatePassword(map);
	}

	@Override
	public int updateWithdraw(HashMap<String, Object> map) {
		return fmDAO.updateWithdraw(map);
	}

	@Override
	public int updateFarm(Farm f) {
		return fmDAO.updateFarm(f);
	}
	
}
