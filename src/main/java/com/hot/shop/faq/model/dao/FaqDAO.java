package com.hot.shop.faq.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.faq.model.vo.FAQ;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//자주 묻는 질문 리스트
	public ArrayList<FAQ> selectFAQList() {
		
		RowBounds rb = new RowBounds(0, 10);
		
		return new ArrayList<FAQ>(sql.selectList("faq.selectFaqList",null,rb));
		
	}

	//게시물 삭제
	public int deleteFaqBoard(int boardNo) {
		
		return	sql.update("faq.deleteFaqBoard",boardNo);
		
	}

	public int insertfaqBoard(HashMap<String, String> dataMap) {
		
		return	sql.insert("faq.insertFaqBoard",dataMap);
		
	}

	public ArrayList<FAQ> selectFaqOneBoard(int boardNo) {
		
		return new ArrayList<FAQ>(sql.selectList("faq.selectFaqOneBoard", boardNo));
		
	}

	public int updateFaqBoard(HashMap<String, Object> dataMap) {
		
		return	sql.update("faq.updateFaqBoard",dataMap);
		
	}
	
	
}
