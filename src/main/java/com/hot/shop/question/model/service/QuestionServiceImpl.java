package com.hot.shop.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.dao.QuestionDAO;
import com.hot.shop.question.model.vo.QuestionAnswer;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDAO qDAO;

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
	public HashMap<String, Object> questionView(int questionUserNo) {
		return qDAO.questionView(questionUserNo);
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
	
	@Override
	public HashMap<String, Object> selectUserQuestionList(HashMap<String, Object> map) {
		int recordCountPerPage=10;
		ArrayList<QuestionUser> list = qDAO.getUserQuestionList(recordCountPerPage,map);
		int naviCountPerPage=10;
		String pageNavi = qDAO.getUserQuestionNavi(recordCountPerPage,naviCountPerPage,map);
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("pageNavi",pageNavi);
		return returnMap;
	}

	//-----------------------------------------농가 문의-----------------------------------------
	
	@Override
	public ArrayList<QuestionFarm> QuestionFarmPage() {
		// TODO Auto-generated method stub
		return qDAO.QuestionFarmPage();
	}

	@Override
	public int questionUserDelete(int questionUserNo,String questionUserCode) {
		return qDAO.questionUserDelete(questionUserNo,questionUserCode);
	}

	@Override
	public boolean questionAnswer(QuestionAnswer qAnswer) {
		return qDAO.questionAnswer(qAnswer);
	}

	@Override
	public QuestionPhoto deleteFileCheck(int originalQuestionphotoNo) {
		return qDAO.deleteFileCheck(originalQuestionphotoNo);
	}

	@Override
	public int questionUserUpdate(QuestionUser qUser) {
		return qDAO.questiouUserUpdate(qUser);
	}

	

	
}
