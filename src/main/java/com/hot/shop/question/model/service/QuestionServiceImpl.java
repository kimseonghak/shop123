package com.hot.shop.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
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

	@Override
	public ArrayList<Farm> farmCheck(String farmName) {
		return qDAO.farmCheck(farmName);
	}
	//-----------------------------------------농가 문의-----------------------------------------
	@Override
	public HashMap<String, Object> selectFarmQuestionList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		//페이지당 보여줄 글 갯수
		int recordCountPerPage=10;
		ArrayList<QuestionFarm> list = qDAO.farmQuestionList(recordCountPerPage,map);
		//페이지 리스트
		int naviCountPerPage=10;
		String pageNavi = qDAO.FarmQuestionNavi(recordCountPerPage,naviCountPerPage,map);
		//위에 정보를 바탕으로 해쉬맵에 넣어준다
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("pageNavi",pageNavi);
		return returnMap;
	}

	//글 쓰기 
	@Override
	public int questionFarmWrite(QuestionFarm qfarm) {
		// TODO Auto-generated method stub
		return qDAO.questionFarmWrite(qfarm);
	}

	//글 조회
	@Override
	public HashMap<String, Object> questionFarmView(int questionFarmNo) {
		// TODO Auto-generated method stub
		return qDAO.questionFarmView(questionFarmNo);
	}

	//글 수정
	@Override
	public int questionFaemUpdate(QuestionFarm qfarm) {
		// TODO Auto-generated method stub
		return qDAO.questionFaemUpdate(qfarm);
	}

	@Override
	public int questionFarmDelete(int questionFarmNo) {
		// TODO Auto-generated method stub
		return qDAO.questionFarmDelete(questionFarmNo);
	}

	
}
