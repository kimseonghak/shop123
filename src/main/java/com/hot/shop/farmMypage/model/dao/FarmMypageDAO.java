package com.hot.shop.farmMypage.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.farm.model.vo.Farm;

@Repository
public class FarmMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int updatePassword(HashMap<String, Object> map) {
		return sql.update("farmMypage.updatePassword", map);
	}

	public int updateWithdraw(HashMap<String, Object> map) {
		return sql.update("farmMypage.updateWithdraw", map);
	}

	public int updateFarm(Farm f) {
		return sql.update("farmMypage.updateFarm", f);
	}

}
