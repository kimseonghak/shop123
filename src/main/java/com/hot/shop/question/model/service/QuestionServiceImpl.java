package com.hot.shop.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.dao.QuestionDAO;
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
	
	//1:1문의 글쓰기(유저 페이지 이동)
	@Override
	public QuestionUser QuestionUserWrite() {
		return null;
	}

	//1:1문의 글쓰기 (유저 실질적인 백단)
	@Override
	public int insertUserWrite(QuestionUser qUser) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return qDAO.questionView(questionUserNo);
	}

	//글 수정
	@Override
	public int questionUpdate(QuestionUser quser) {
		// TODO Auto-generated method stub
		return qDAO.questionUpdate(quser);
	}

	@Override
	public HashMap<String, Object> buyListCheck(int currentPage, Member member) {
		int recordCountPerPage=5;
		ArrayList<Member> list = qDAO.getBuyList(currentPage,member,recordCountPerPage);
		return null;
	}

	
}
