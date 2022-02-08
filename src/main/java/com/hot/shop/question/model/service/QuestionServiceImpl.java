package com.hot.shop.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.dao.QuestionDAO;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDAO qDAO;

	//1:1문의 리스트(유저)
	@Override
	public ArrayList<QuestionUser> selectUserQuestionList() {
		return qDAO.selectUserQuestionList();
	}
	
	//1:1문의 글쓰기 (유저 실질적인 백단)
	@Override
	public int insertUserWrite(QuestionUser qUser) {
		return qDAO.insertUserWrite(qUser);
	}

	//1:1 문의 작성시 파일 업로드
	@Override
	public int insertWriteFile(QuestionPhoto qp) {
		
		return qDAO.insertWriteFile(qp);
	}

	//1:1문의 작성글 조회
	@Override
	public QuestionUser questionView(int questionUserNo) {
		return qDAO.questionView(questionUserNo);
	}

	//글 수정
	@Override
	public int questionUpdate(QuestionUser quser) {
		return qDAO.questionUpdate(quser);
	}

	@Override
	public HashMap<String, Object> buyListCheck(int currentPage, Member member) {
		int recordCountPerPage=5;
		ArrayList<Purchaselist> list = qDAO.getBuyList(currentPage,member,recordCountPerPage);
		int naviCountPerPage=10;
		String pageNavi = qDAO.getBuyPageNavi(recordCountPerPage,currentPage,naviCountPerPage,member);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi",pageNavi);
		return map;
	}


	//-----------------------------------------농가 문의-----------------------------------------
	
	@Override
	public ArrayList<QuestionFarm> QuestionFarmPage() {
		// TODO Auto-generated method stub
		return qDAO.QuestionFarmPage();
	}
	

	
}
