package com.hot.shop.farm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.farm.model.dao.FarmDAO;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	private FarmDAO fDAO;
}
