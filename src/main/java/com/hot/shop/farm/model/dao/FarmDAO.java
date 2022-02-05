package com.hot.shop.farm.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

@Repository
public class FarmDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Farm selectLoginFarm(Farm farm) {
		return sql.selectOne("farm.selectLoginFarm",farm);
	}

	public int selectIdCheck(String farmId) {
		int result = sql.selectOne("farm.selectIdCheck", farmId);
		return result;
	}

	public int insertFarm(Farm farm) {
		return sql.insert("farm.insertFarm", farm);
	}

	public List<Farm> findIdFarm(Farm farm) {
		return sql.selectList("farm.findIdFarm", farm);
	}

	public Farm selectEmailCheck(Farm farm) {
		Farm result = sql.selectOne("farm.selectEmailCheck", farm);
		return result;
	}

	public int findPwdFarm(Farm farm) {
		return sql.selectOne("farm.findPwdFarm", farm);
	}

	public int farmRandomPwd(HashMap<String, Object> map) {
		return sql.update("farm.farmRandomPwd", map);
	}

}
