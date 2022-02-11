package com.hot.shop.farmMypage.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FarmMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int updatePassword(HashMap<String, Object> map) {
		return sql.update("farmMypage.updatePassword", map);
	}

}
