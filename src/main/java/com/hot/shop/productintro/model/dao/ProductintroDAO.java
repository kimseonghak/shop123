package com.hot.shop.productintro.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.productintro.model.vo.LocalProductBoard;

@Repository
public class ProductintroDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	
	
	//------------------------------------
	
	public ArrayList<LocalProductBoard> LocalProductListPage() {
		// TODO Auto-generated method stub
		return new ArrayList<LocalProductBoard>(sqlSession.selectList("lpBoard.LocalProductListPage"));
	}
}
