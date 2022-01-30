package com.hot.shop.farm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.farm.model.vo.Farm;

@Repository
public class FarmDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Farm selectLoginFarm(Farm farm) {
		return sql.selectOne("farm.selectLoginFarm",farm);
	}

}
