package com.hot.shop.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.question.model.dao.QuestionDAO;
import com.hot.shop.question.model.vo.QuestionUser;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDAO qDAO;

	@Override
	public ArrayList<QuestionUser> selectUserQuestionList() {
		return qDAO.selectUserQuestionList();
	}
	
	@Override
	public QuestionUser QuestionUserWrite() {
		return null;
	}



	
}
