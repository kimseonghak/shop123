package com.hot.shop.question.model.service;


import java.util.ArrayList;

import com.hot.shop.question.model.vo.QuestionUser;

public interface QuestionService {

	ArrayList<QuestionUser> selectUserQuestionList();
	
	QuestionUser QuestionUserWrite();

	

}
