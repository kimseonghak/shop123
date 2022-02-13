package com.hot.shop.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.faq.model.dao.FaqDAO;
import com.hot.shop.faq.model.vo.FAQ;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDAO;

	//자주 묻는 질문 리스트 
	@Override
	public ArrayList<FAQ> selectFAQList() {
		
		ArrayList<FAQ> list = faqDAO.selectFAQList();
		
		return list;
	}

	//게시글 삭제
	@Override
	public int deleteFaqBoard(int boardNo) {
			
	 return	faqDAO.deleteFaqBoard(boardNo);
		
	}

	//게시글 등록
	@Override
	public int insertfaqBoard(HashMap<String, String> dataMap) {
		
		return faqDAO.insertfaqBoard(dataMap);
		
	}

	// 수정할 게시물 내용 가져오기
	@Override
	public ArrayList<FAQ> selectFaqOneBoard(int boardNo) {
		
		ArrayList<FAQ> list = faqDAO.selectFaqOneBoard(boardNo);
		
		return list;
	}

	@Override
	public int updateFaqBoard(HashMap<String, Object>dataMap) {
		
		return	faqDAO.updateFaqBoard(dataMap);
		
	}
}
