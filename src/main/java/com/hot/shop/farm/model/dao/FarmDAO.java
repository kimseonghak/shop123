package com.hot.shop.farm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FarmDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

}
